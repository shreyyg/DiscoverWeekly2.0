[speech,fs] = audioread('weeknd.mp3'); %insert song here
speech = (speech(:,1)+speech(:,2))/2; %convert from stereo to mono
[length dontcare] = size(speech);
speech = speech(length/2 - 661500:length/2 + 661500);%grab audio from mmiddle 30 secs
length = 30000; %length of sample in ms
Tw = length/510;
Ts = Tw*.5;
alpha = .95;
M = 22;
L = 22;
window = blackmanharris(32);
R = [22 22000];
N = 22;

[CC,FBE,frames] =mfcc(speech,fs,Tw,Ts,alpha,window,R,M,N,L);

figure('Position', [30 100 800 200], 'PaperPositionMode', 'auto', ... 
                 'color', 'w', 'PaperOrientation', 'landscape', 'Visible', 'on' ); 
      
          imagesc( [1:size(CC,2)], [0:N-1], CC ); 
          axis( 'xy' );
          xlabel( 'Frame index' ); 
          ylabel( 'Cepstrum index' );
          title( 'Mel frequency cepstrum' );