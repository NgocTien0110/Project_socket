import socket
import os
import threading
import json
import codecs
import datetime
import urllib.request


IP = '127.0.0.1'
PORT = 12345

class Server:
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    account = ['admin', 'admin']
    clients = []  # adress
    nicknames = []  # username

    # --------------             --------------              --------------
    def __init__(self, PORT):
        os.system('cls')
        print("Starting server")
        self.server.bind((socket.gethostname(), PORT))
        self.server.listen(5)

        # ---- Get data 

        # with urllib.request.urlopen("https://tygia.com/json.php?ran=0&rate=0&gold=1&bank=VIETCOM&date=now") as url:
        #     data = json.loads(url.read().decode('utf-8-sig'))
        # with open("tien.json","w") as outfile:
        #     json.dump(data, outfile)

        # ---- Load account data
        with open("account.txt", 'r', encoding='utf-8') as loadfile:
            data = loadfile.readline()
            self.account = data.split('|')

    def check_register(self, username, password):
        for i in range(len(self.account)):
            if (self.account[i] == username):
                return -1
            else:
                i = i + 2

        with open("account.txt", 'a', encoding='utf-8') as outfile:
            outfile.write(username + '|' + password + '|')
            self.account.append(username)
            self.account.append(password)

        return 1

        # ------- save reg-ID in file
    def check_login(self, username, password):
        for i in range(len(self.account)):
            if (username == self.account[i] and password == self.account[i + 1]):
                return i  # login success
            if (username == self.account[i] and password != self.account[i + 1]):
                return -1  # wrong password

            i = i + 1

        return -2  # username not exist

    def login(self, client, username, password):
        if (self.check_login(username, password) < 0):
            print("Username or Password wrong.")
        else:
            print("Login success to account: " + username)
            self.clients.append(client)
            self.nicknames.append(username)

    def register(self, username, password):
        if(self.check_register(username, password) == 1):
            print("Register success.")
        else:
            print("Username already exists.")
 
    def check_user(self, client):
        username = 'default'
        while True:
            try:  # recieving valid messages from client
                mess = client.recv(1024).decode('utf8')
                datetime_object = datetime.datetime.now()
                
                print(mess)
                print(datetime_object)
                
                str_data = mess.split(' ')
                source_name = str_data[0].replace(':', '')

                 # ---- Get data 
                             
                #print(int(datetime_object.year))

                if(len(str_data) != 5 ):
                    check = False
                else:
                    if(int(str_data[4]) > int(datetime_object.year) or (int(str_data[4]) == int(datetime_object.year) and int(str_data[3]) > int(datetime_object.month)) or (int(str_data[4]) == int(datetime_object.year) and int(str_data[3]) > int(datetime_object.month) and int(str_data[2]) > int(datetime_object.day))):
                        check = False
                    else:
                        ngay = str_data[4] + str_data[3] + str_data[2]

                        #print (ngay)

                        dulieu = "https://tygia.com/json.php?ran=0&rate=0&gold=1&bank=VIETCOM&date=" + ngay

                        with urllib.request.urlopen(dulieu) as url:
                            data = json.loads(url.read().decode('utf-8-sig'))
                        with open("tien.json","w") as outfile:
                            json.dump(data, outfile)
                
                        check = False
                        client.send(("loading").encode('utf8'))
                        with codecs.open('tien.json', 'r', 'utf-8-sig') as json_file:  
                            data = json.load(json_file)
                            for i in data['golds']:
                                for j in i['value']:
                                    if (i['date'] == ngay and j['company'] == "SJC") and j['brand1'] == str_data[1]: 
                                                            
                                        buy = str(j['buy'])
                                        sell = str(j['sell'])
                                        type = str(j['type'])
                                        brand = str(j['brand'])
                                        time = str(j['updated'])
                                        #client.send(("Brand: " + brand + "\t" + type  + "\nBuy: " + buy + "\t Sell: " + sell + "\nUpdated: " + time + "\n\n").encode('utf8'))
                            
                                        check = True
                                        break
                                    else:
                                        continue
                                
                                break

                if(check == True):              
                    client.send(("Brand: " + brand + "\t" + type  + "\nBuy: " + buy + "\t Sell: " + sell + "\nUpdated: " + time + "\n\nWrite following this form: AA dd mm yyyy ( AA: province, dd: day, mm: month, yyyy: year) \n(HN 15 08 2021 -> Hà Nội ngày 15 tháng 08 năm 2021)").encode('utf8'))
             
                else:
                    message = "Syntax error! Try again! \n\nWrite following this form: AA dd mm yyyy ( AA: province, dd: day, mm: month, yyyy: year) \n(HN 15 08 2021 -> Hà Nội ngày 15 tháng 08 năm 2021)"
                    client.send(message.encode('utf8'))
                    continue

            except:
                index = self.clients.index(client)
                nickname = self.nicknames[index]
                datetime_object = datetime.datetime.now()                             
                print("account " + nickname + ' left !!!')
                print(datetime_object)
                break

    
    def run_server(self):  # accepting multiple clients
       
        while True:
            
            client, address = self.server.accept()
            #print("Connected with {}".format(str(address))) #connect
            client.send('server_ready'.encode('utf8')) #send request

            while True:
           
                str_data = client.recv(1024).decode('utf8').split('|')
               #print(str_data)
                if (len(str_data) == 3):                
                        client.recv(1024)
                        datetime_object = datetime.datetime.now()
                        if (str_data[0] == 'login'):
                            if (self.check_login(str_data[1], str_data[2]) == -1):
                                client.send("!password".encode('utf8'))
                                continue

                            elif (self.check_login(str_data[1], str_data[2]) == -2):
                                client.send("!username".encode('utf8'))
                                continue
                            
                            else:
                                self.login(client, str_data[1], str_data[2])
                                nickname = str_data[1]                              
                                print(datetime_object)
                                client.send('Login successfully. Hello {} \nPlease enter the region code that you want to check:\nWrite following this form: AA dd mm yyyy ( AA: province, dd: day, mm: month, yyyy: year) \n(HN 15 08 2021 -> Hà Nội ngày 15 tháng 08 năm 2021)'.format(nickname).encode('utf8'))
                            
                            break

                        elif (str_data[0] == 'register'):
                            if (self.check_register(str_data[1], str_data[2]) == 1):
                                client.send("#register".encode('utf8'))
                                # client.close()
                                continue
                                
                            elif (self.check_register(str_data[1], str_data[2]) == -1):
                                client.send("!register".encode('utf8'))
                                # client.close()
                                continue
                     

            thread = threading.Thread(target=self.check_user, args=(client,))
            thread.start()

    # --------------             --------------              --------------

s = Server(PORT)


thread1 = threading.Thread(target=s.run_server, args=())
thread1.start()

thread2 = threading.Thread(target=s.run_server, args=())
thread2.start()

thread3 = threading.Thread(target=s.run_server, args=())
thread3.start()

thread4 = threading.Thread(target=s.run_server, args=())
thread4.start()





