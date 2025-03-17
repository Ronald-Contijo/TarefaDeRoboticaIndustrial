% Ângulos de rotação (em graus)
theta = 45; % Rotação em Z
Theta = 30; % Rotação em X

% Conversão para radianos
theta_rad = deg2rad(theta);
Theta_rad = deg2rad(Theta);

% Matriz de rotação em Z
Rz = [cos(theta_rad) -sin(theta_rad) 0;
       sin(theta_rad)  cos(theta_rad) 0;
       0              0              1];

% Matriz de rotação em X
Rx = [1      0             0;
      0      cos(Theta_rad) -sin(Theta_rad);
      0      sin(Theta_rad)  cos(Theta_rad)];

% Matriz de rotação final
R = Rx * Rz;

% Exibindo a matriz de rotação
disp('Matriz de Rotação Final:');
disp(R);

% Visualização da rotação
figure;
trplot(eye(4), 'frame', 'A', 'color', 'k', 'length', 1); % Frame original
hold on;
trplot([R [0; 0; 0]; 0 0 0 1], 'frame', 'B', 'color', 'r', 'length', 1); % Frame rotacionado
title('Rotação em Z e depois em X');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
axis equal;