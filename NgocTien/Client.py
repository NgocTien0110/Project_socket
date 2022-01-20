import socket
import threading
import os


PORT = 12345
key = b'twAM67PJu_aTf2iT3DUJY2O1qb0Jv5E_DRfrorBXDUw=' #default

class Client:
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    request = "default"
    nickname = "default"
    status = "off"

    def check_status(self):
        return self.status

    def login_request(self):                
        while True:           
            print("1. Login.\n2. Register.")
            selection = input("Your selection :")
            if(selection == '1' or selection == '2'):
                break
            os.system('cls')
            continue
         
        if (selection == "1"):
            username = input("Username: ")
            password = input("Password: ")

            self.request = "login|" + username + '|' + password 
            self.nickname = username
            
        elif (selection == "2"):
            username = input("Username: ")
            password = input("Password: ")

            self.request = "register|" + username + '|' + password     

        self.client.send(self.request.encode('utf8'))
        self.client.sendall(key)


    def receive(self):
        self.client.connect((socket.gethostname(), PORT))
        #print(socket.gethostname())
        while True:  # making valid connection
            try:
                message = self.client.recv(1024).decode('utf8')
                # print(message)
                if message == 'server_ready':
                    #os.system('cls')
                    self.login_request()
                    os.system('cls')
                    print(message)

                elif (message == '!password' or message == '!username'):
                    os.system('cls')
                    print("wrong pass word or user name does not exits")
                    client.login_request()
                    continue
                
                elif (message == "#register"):
                    os.system('cls')
                    print('Registered success')
                    client.login_request()
                    continue

                elif (message == "!register"):
                    os.system('cls')
                    print('Registered fail')
                    client.login_request()
                    continue

                else: #noti
                    self.status = "on"
                    os.system('cls')
                    if (message != ''):
                        print(message)

                    continue

            except:  # case on wrong ip/port details
                print("###.404 Server not found!")
                self.status = "fail"
                self.client.close()
                break


    def write(self):
        while True:  # message layout
            try:
                if (self.check_status() != 'on'):
                    if self.check_status() == 'fail':
                        break
                    continue

                message = '{}: {}'.format(self.nickname, input(''))

                print("Loading...")
           
                self.client.send(message.encode('utf-8'))
            except:
                print("###.An error occurred!")
                self.client.close()
                break
    
client = Client()

os.system('cls')

receive_thread = threading.Thread(target=client.receive)  # receiving multiple messages
receive_thread.start()
receive_thread.join(2.0)

write_thread = threading.Thread(target=client.write, args=())  # sending messages
write_thread.start()
write_thread.join(2.0)


