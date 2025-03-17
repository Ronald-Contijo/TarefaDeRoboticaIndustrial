% Definição do vetor original
PA1 = [0; 2; 0];

% Ângulos de rotação (graus)
thetaZ = 45; % Rotação em Z
thetaY = -30; % Rotação em Y
thetaX = 90; % Rotação em X

% Conversão para radianos
thetaZ_rad = deg2rad(thetaZ);
thetaY_rad = deg2rad(thetaY);
thetaX_rad = deg2rad(thetaX);

% Matrizes de rotação
Rz = [cos(thetaZ_rad) -sin(thetaZ_rad) 0;
      sin(thetaZ_rad) cos(thetaZ_rad) 0;
      0 0 1];

Ry = [cos(thetaY_rad) 0 sin(thetaY_rad);
      0 1 0;
      -sin(thetaY_rad) 0 cos(thetaY_rad)];

Rx = [1 0 0;
      0 cos(thetaX_rad) -sin(thetaX_rad);
      0 sin(thetaX_rad) cos(thetaX_rad)];

% Aplicando as rotações
PA2 = Rz * PA1; % Rotação em Z
PA3 = Ry * PA1; % Rotação em Y
PA4 = Rx * PA1; % Rotação em X

% Exibição dos resultados
disp('P_A^2:'); disp(PA2);
disp('P_A^3:'); disp(PA3);
disp('P_A^4:'); disp(PA4);

% Plotagem dos vetores
figure;
hold on;
grid on;
axis equal;
view(3);
rotate3d on;

xlabel('X'); ylabel('Y'); zlabel('Z');

% Frame de referência
trplot(eye(4), 'frame', 'A', 'color', 'k', 'length', 1);

% Plotando os vetores
quiver3(0, 0, 0, PA1(1), PA1(2), PA1(3), 'r', 'LineWidth', 2);
quiver3(0, 0, 0, PA2(1), PA2(2), PA2(3), 'b', 'LineWidth', 2);
quiver3(0, 0, 0, PA3(1), PA3(2), PA3(3), 'g', 'LineWidth', 2);
quiver3(0, 0, 0, PA4(1), PA4(2), PA4(3), 'm', 'LineWidth', 2);

% Legenda
legend('P_A^1 (Original)', 'P_A^2 (Rotação Z de 45°)', 'P_A^3 (Rotação Y de -30°)', 'P_A^4 (Rotação X de 90°)');
title('Transformações do Vetor P_A^1');