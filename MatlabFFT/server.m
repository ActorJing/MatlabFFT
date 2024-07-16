IP = '192.168.2.3';
PORT = 6802;
SampleCount = 10200;
% 4字节float类型
t_server = tcpserver(IP, PORT);  
fopen(t_server);  
% 初始化一个空数组用于存储读取的数据
data = [];

while(1)
    % 检查是否有可用的数据
    if t_server.BytesAvailable >= 4*SampleCount % 每次读取4个字节，总共需要读取10次
        % 读取数据并转换为float类型
        for i = 1:SampleCount
            data_recv = fread(t_server, 4, 'uint8');
            % 将读取的数据添加到数组中
            data = [data; str2double(char(data_recv))];
        end
        break;
    end
end

plot(data);
delete(t_server);  
