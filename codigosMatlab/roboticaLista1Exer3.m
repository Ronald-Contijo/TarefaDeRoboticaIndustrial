% Ângulo de rotação (graus)
theta = 30;

% Conversão para radianos
theta_rad = deg2rad(theta);

% Matriz de rotação em Z
Rz = [cos(theta_rad) -sin(theta_rad) 0;
      sin(theta_rad) cos(theta_rad) 0;
      0 0 1];

% Ponto no sistema {B}
PB = [0; 2; 0];

% Transformação para o sistema {A}
PA = Rz * PB;

% Exibição dos resultados
disp('Coordenadas de P_A:');
disp(PA);

% Plotagem com trplot
figure;
hold on;
grid on;
axis equal;
xlabel('X'); ylabel('Y'); zlabel('Z');
view(3); % Garante que a visualização seja 3D
rotate3d on; % Permite interatividade no gráfico 3D

% Frame original {A}
trplot(eye(4), 'frame', 'A', 'color', 'k', 'length', 2);

% Frame transformado {B} usando Rz
T_B = [Rz [0;0;0]; 0 0 0 1];
trplot(T_B, 'frame', 'B', 'color', 'b', 'length', 2);

% Plotando os pontos P_B, P_A 
plot3(PB(1), PB(2), PB(3), 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
text(PB(1), PB(2), PB(3), '  P_B', 'Color', 'blue', 'FontSize', 12);

plot3(PA(1), PA(2), PA(3), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');
text(PA(1), PA(2), PA(3), '  P_A', 'Color', 'red', 'FontSize', 12);


% Linhas para representar as conexões entre pontos
plot3([0 PB(1)], [0 PB(2)], [0 PB(3)], 'b--');
plot3([0 PA(1)], [0 PA(2)], [0 PA(3)], 'r--');

% Título e legendas
title('Transformação de Coordenadas: P_B para P_A no Espaço 3D');
legend('Frame A', 'Frame B', 'P_B (Sistema B)', 'P_A (Sistema A)', 'P_C (Ponto Extra)');
