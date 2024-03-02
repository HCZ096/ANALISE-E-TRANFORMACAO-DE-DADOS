%Este projeto visa a análise nos domínios da frequência e do tempo de sinais áudio com o
%objetivo de identificar os dígitos em inglês entre 0 e 9.

% Reproduzir graficamente um exemplo dos sinais obtidos(frequencia,y,x(1\Ts/(tempo de amostragem))
% identificar o digito a cada grupo de sinais correspondente,indicando  o
% o eixo horizontal com o tempo em segundos.

close all
folder_path="C:\Users\nshay\Documents\MATLAB\data\01\";
wav_files = dir(fullfile(folder_path,'*.wav'));% wav_files recebe todos os arquivos .wav na pasta 01;
%T = struct2table(wav_files);
%sortedT = sortrows(T, 'Value');
%wav_files = table2struct(sortredT);
digit_info = containers.Map('keyType','char','ValueType','Any');% reservamos espaço\mapas que cada chave será de tipo "char" e valor de "qualquer"tipo; 
for i = 0:9 
   digit_info(num2str(i)) = [] ; % para cada i chave,tera como valor uma matriz vazia (num2str(A) converts a numeric array into a character array that represents the numbers)

  %armazena o sinal do audio i no mapa digit_signal
   %digit_signal(num2str(i)) = audio_signal;

end

for k = 1:numel(wav_files)  %formatar o codigo em 
    %acessando a estrutura na posicao k
    wav_file = wav_files(k);

    %acessando o campo "name" dentro da estrutura
    digit = wav_file.name(1); % DIGIT RECEBE O PRIMEIRO CARATERE DE WAVFILES(K)
    
    % contruindo o caminho completo até o arquivo
    file_path = fullfile(folder_path,wav_file.name);
    
    %obtendo os sinais 
    audio_data = audioread(file_path);
    
    % armazenando
    digit_info(digit) = [digit_info(digit) {audio_data}];
end




fig = figure('Position',[100,100,1200,50]);
for i = 0:9
    subplot(2,5,i+1); %divide a figura em m por n e cria eixos na posicao p
    audio_data_cell = digit_info(num2str(i));
    if ~isempty(audio_data_cell)
        audio_data = audio_data_cell{1};
        %sound(audio_data,48000);
        plot(audio_data);
    end
    title(sprintf("Digito %d",i));
    xlabel("Tempo [s]");
    ylabel("Amplitude");
end



