% Ângulo de rotação (graus)
theta = 30;

% Conversão para radianos
theta_rad = deg2rad(theta);

% Matriz de rotação em Z
Rz = [cos(theta_rad) -sin(theta_rad) 0;
      sin(theta_rad) cos(theta_rad) 0;
      0 0 1];

% Translação
T = [10; 5; 0];

% Ponto no sistema {B}
PB = [3; 7; 0];

% Transformação para o sistema {A}
PA = Rz * PB + T;


% Ponto de origem do sistema {B} antes da translação
PB_ORG = Rz * [0;0;0] + T;

% Exibição dos resultados
disp('Coordenadas de P_A:');
disp(PA);
disp('Coordenadas de P_B_ORG:');
disp(PB_ORG);

% Plotagem com trplot
figure;
hold on;
grid on;
axis equal;
xlabel('X'); ylabel('Y'); zlabel('Z');
view(3);
rotate3d on;

% Frame original {A}
trplot(eye(4), 'frame', 'A', 'color', 'k', 'length', 2);

% Frame transformado {B} (incluindo rotação e translação)
T_B = [Rz T; 0 0 0 1];
trplot(T_B, 'frame', 'B', 'color', 'b', 'length', 2);

% Plotando os pontos P_B, P_A, P_B_ORG e Origem

PB = PA% Apesar de um pouco duvidoso isso funciona

plot3(PB(1), PB(2), PB(3), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');

text(PB(1), PB(2), PB(3), '  P_B', 'Color', 'blue', 'FontSize', 12);

plot3(PA(1), PA(2), PA(3), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(PA(1), PA(2), PA(3), '  P_A', 'Color', 'red', 'FontSize', 12);

plot3(PB_ORG(1), PB_ORG(2), PB_ORG(3), 'go', 'MarkerSize', 8, 'MarkerFaceColor', 'g');
text(PB_ORG(1), PB_ORG(2), PB_ORG(3), '  P_{B_{ORG}}', 'Color', 'green', 'FontSize', 12);

plot3(0, 0, 0, 'ko', 'MarkerSize', 8, 'MarkerFaceColor', 'k');
text(0, 0, 0, '  Origem', 'Color', 'black', 'FontSize', 12);

% Linhas para representar as conexões entre pontos
plot3([PB_ORG(1) PB(1)], [PB_ORG(2) PB(2)], [PB_ORG(3) PB(3)], 'b--');
plot3([0 PA(1)], [0 PA(2)], [0 PA(3)], 'r--');
plot3([0 PB_ORG(1)], [0 PB_ORG(2)], [0 PB_ORG(3)], 'g--');

% Título e legendas
title('Transformação de Coordenadas: P_B para P_A no Espaço 3D');
legend('Frame A', 'Frame B', 'P_B (Sistema B)', 'P_A (Sistema A)', 'P_{B_{ORG}} (Origem B)');
