% Ângulos de rotação (graus)
thetaZ = 30;
thetaY = 45;
thetaX = 60;

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

% Vetor inicial
P = [5; 0; 0];

% Aplicação das rotações na ordem 1
P_final1 = Rz * Ry * Rx * P;

% Aplicação das rotações na ordem inversa
P_final2 = Rx * Ry * Rz * P;

% Comparação
disp('P_final1:'); disp(P_final1);
disp('P_final2:'); disp(P_final2);

% Plotagem
figure;
hold on;
grid on;
axis equal;
view(3);
rotate3d on;
xlabel('X'); ylabel('Y'); zlabel('Z');

% Frames de referência
trplot(eye(4), 'frame', 'A', 'color', 'k', 'length', 1);

% Vetor inicial
quiver3(0, 0, 0, P(1), P(2), P(3), 'k', 'LineWidth', 2);

% Vetores finais
quiver3(0, 0, 0, P_final1(1), P_final1(2), P_final1(3), 'r', 'LineWidth', 2);
quiver3(0, 0, 0, P_final2(1), P_final2(2), P_final2(3), 'b', 'LineWidth', 2);

% Legenda
legend('Vetor Inicial', 'P_final1 (Ordem ZYX)', 'P_final2 (Ordem XYZ)');
title('Efeito da Ordem das Rotações');