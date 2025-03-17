% Ângulo de rotação (graus)
theta = 45;

% Conversão para radianos
theta_rad = deg2rad(theta);

% Matriz de rotação em Z
Rz = [cos(theta_rad) -sin(theta_rad) 0;
      sin(theta_rad) cos(theta_rad) 0;
      0 0 1];

% Vetor de translação
T = [4; 3; 0];

% Matriz de transformação B T_A
B_T_A = [Rz, T; 0 0 0 1];

% Matriz de transformação A T_B (inversa)
A_T_B = inv(B_T_A);

% Exibição das matrizes
disp('Matriz B T_A:');
disp(B_T_A);
disp('Matriz A T_B:');
disp(A_T_B);

% Plotagem
figure;
hold on;
grid on;
axis equal;
view(3);
rotate3d on;
xlabel('X'); ylabel('Y'); zlabel('Z');

% Frame original {A}
trplot(eye(4), 'frame', 'A', 'color', 'k', 'length', 1);


% Frame transformado {B}
trplot(B_T_A, 'frame', 'B', 'color', 'r', 'length', 1);

% Extração da posição do frame B a partir de B_T_A
orig_A = [0; 0; 0]; % Origem do sistema A
orig_B = B_T_A(1:3, 4); % Origem do sistema B

% Desenhar uma linha conectando os frames
plot3([orig_A(1), orig_B(1)], [orig_A(2), orig_B(2)], [orig_A(3), orig_B(3)], 'k--', 'LineWidth', 2);


% Título
title('Transformação de Coordenadas: Frames {A} e {B}');
