function    torsional_analysis(fb,H,stiffness)

num_parts = length(H);

% Torsional Stiffness Matrix
K = zeros(num_parts, num_parts);
for i = 1:num_parts-1
    K(i, i) = K(i, i) + stiffness(i);
    K(i+1, i) = K(i+1, i) - stiffness(i);
    K(i, i+1) = K(i, i+1) - stiffness(i);
    K(i+1, i+1) = K(i+1, i+1) + stiffness(i);
end

% Torsional Mass Matrix
M = zeros(num_parts, num_parts);
for i = 1:num_parts
    M(i, i) = M(i, i) + 2*H(i);
end

% Eigenvalue Problem
A1 = inv(M) * K;
[eigenvectors, eigenvalues_matrix] = eig(A1);
eigenvalues = diag(eigenvalues_matrix);

eigenvalues=eigenvalues';

wb = 2 * pi * fb;
freqs = sqrt(abs(eigenvalues) * wb) / (2 * pi);


normalized_V = normalize_columns(eigenvectors);
Modenumber = count_sign_changes(normalized_V);

format compact
% Display results
disp('Torsional_Mass_Matrix (=diag(2H_i)) =');
disp(round(M, 4));
disp('-----------------------------------');
disp('Torsional_Stiffness_Matrix =');
disp(round(K, 4));
disp('-----------------------------------');
disp('State_Matrix =');
disp(round(A1, 4));
disp('-----------------------------------');
disp('eigenvalues =');
disp(round(eigenvalues, 4));
disp('-----------------------------------');
disp('Frequencies (Hz) =');
disp(round(freqs, 4));
disp('-----------------------------------');
disp('V =');
disp(round(eigenvectors, 4));
disp('-----------------------------------');
disp('normalized_V =');
disp(round(normalized_V, 4));

%% 

%%
% Save to workspace
assignin('base', 'Torsional_Stiffness_Matrix', K);
assignin('base', 'Torsional_Mass_Matrix', M);
assignin('base', 'State_Matrix', A1);
assignin('base', 'eigenvalues', eigenvalues);
assignin('base', 'freqs', freqs);
assignin('base', 'eigenvectors', eigenvectors);
assignin('base', 'normalized_V', normalized_V);

% Create subplots for each column
figure('Color', 'w');  % Set the figure background to white
set(gcf, 'Position', [100, 100, 800, 600]);
for i = 1:num_parts
    % Adjust the subplot position
    subplot('Position', [00.05, (num_parts-i)/num_parts+0.015, 0.6, 1/num_parts - 0.05]);
    x_values = 1:num_parts;
    plot(x_values, normalized_V(:, i),'Color','b','LineWidth',1.3, 'DisplayName', sprintf('Column $%d$, Mode $%d$, $f_{%d}$ = %.2f Hz', i, Modenumber(i), Modenumber(i), round(freqs(i), 2)),'LineStyle','-','Marker','square','MarkerSize',4,'MarkerFaceColor','b');
    set(gca, 'XTickLabel', []);
    ylim([min(normalized_V(:, i)) max(normalized_V(:, i))])
    xticks(1:num_parts);
    box off;

    % Position the x-axis in the middle
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.XColor = '#d8d8d8';
    ax.YColor = 'none';

    % Remove minor and major grid lines
    ax.XGrid = 'on';
    ax.YGrid = 'off';

    % Highlight the exact sign change points with small red-filled circles
    sign_changes = find(diff(sign(normalized_V(:, i))) ~= 0);
    hold on;
    for idx = 1:length(sign_changes)
        x1 = x_values(sign_changes(idx));
        x2 = x_values(sign_changes(idx) + 1);
        y1 = normalized_V(sign_changes(idx), i);
        y2 = normalized_V(sign_changes(idx) + 1, i);
        x_cross = x1 - y1 * (x2 - x1) / (y2 - y1);
        plot(x_cross, 0, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 6,'HandleVisibility', 'off');
        str="$\frac{"+num2str(idx)+"}{"+length(sign_changes)+"}$";
        text(x_cross-0.1,+0.4,str,'FontSize',14,'Color','r','FontWeight','bold','Interpreter','latex','VerticalAlignment','middle')
    end
    hold off;

    % Add text
    x_range = xlim;
    y_range = ylim;
    x_text = x_range(2) + 0.05 * (x_range(2) - x_range(1));
    y_text = mean(y_range);
    text(x_text, y_text, sprintf('Column $%d$, Mode $%d$, $f_{%d}$ = %.2f Hz', i, Modenumber(i), Modenumber(i), round(freqs(i), 2)), 'HorizontalAlignment', 'left', 'VerticalAlignment', 'middle','Interpreter','latex');

    % Label each point with its y-axis value
    for j = 1:num_parts
        text(x_values(j), normalized_V(j, i), sprintf('%.2f', normalized_V(j, i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom','Interpreter','latex','SelectionHighlight','on');
    end
end
end

function normalized_matrix = normalize_columns(matrix)
m1 = max(abs(matrix), [], 1);
m2 = min(matrix, [], 1);
indic=(m1==-m2);
max_vals=indic.*m2+(~indic).*m1;
max_vals(max_vals == 0) = 1;
normalized_matrix = matrix ./ max_vals;
end

function sign_changes = count_sign_changes(matrix)
sign_changes = sum(diff(sign(matrix), 1, 1) ~= 0, 1);
end
