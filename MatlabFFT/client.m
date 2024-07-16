t_client=tcpip('192.168.2.3',6802,'NetworkRole','client');%与本地主机建立连接，端口号为30000，作为客户机连接。
t_client.OutputBuffersize=100000;
fopen(t_client);%与一个服务器建立连接，直到建立完成返回，否则报错。
data_send=sin(1:60);%发送的数字数据。
%%%%%%%% txt_send='HELLO'; %发送的文本数据
pause(1);%等待连接稳定，随意设置。
fwrite(t_client,data_send,'double');%写入数字数据
pause(1);
%%%%%%%% fprintf(t_client,txt_send);%发送文本数据
fclose(t_client)
