% Long Line Impedance Matching
P2_rec = [300, 400, 500, 600, 700]; 
V2_LL  = [392, 383, 368, 350, 330]; 
I2_L1  = [0.53, 0.64, 0.78, 0.97, 1.23]; 
P1_sum = [312, 413, 519, 628, 765]; 
Q1_sum = [-154, -104, -27, 78, 221]; 

fig = figure('Color', 'w', 'Position', [100, 100, 1000, 600]);
left_margin = 0.25; 
ax_pos = [left_margin, 0.15, 0.7, 0.72]; 

% --- AXIS 1: Active Power (P1) ---
ax1 = axes('Position', ax_pos, 'YColor', [0.1 0.6 0.1], 'Box', 'off');
hold(ax1, 'on');
h1 = plot(P2_rec, P1_sum, '-o', 'Color', [0.1 0.6 0.1], 'LineWidth', 1.5, 'MarkerFaceColor', [0.1 0.6 0.1]);
ylabel(ax1, 'ΣP1 [W]');
ylim(ax1, [0 1000]);
grid(ax1, 'on');

% --- AXIS 2: Reactive Power (Q1) ---
ax2 = axes('Position', ax_pos, 'YColor', [0.1 0.7 0.6], 'Color', 'none', 'YAxisLocation', 'left', 'Box', 'off');
ax2.Position(1) = ax_pos(1) - 0.05; 
hold(ax2, 'on');
h2 = plot(P2_rec, Q1_sum, '-s', 'Color', [0.1 0.7 0.6], 'LineWidth', 1.5, 'MarkerFaceColor', [0.1 0.7 0.6]);
ylabel(ax2, 'ΣQ1 [var]');
ylim(ax2, [-200 300]);
ax2.XAxis.Visible = 'off';

% --- AXIS 3: Current (I2) ---
ax3 = axes('Position', ax_pos, 'YColor', [0.9 0.2 0.1], 'Color', 'none', 'YAxisLocation', 'left', 'Box', 'off');
ax3.Position(1) = ax_pos(1) - 0.10;
hold(ax3, 'on');
h3 = plot(P2_rec, I2_L1, '-^', 'Color', [0.9 0.2 0.1], 'LineWidth', 1.5, 'MarkerFaceColor', [0.9 0.2 0.1]);
ylabel(ax3, 'I2 (L1) [A]');
ylim(ax3, [0 1.5]);
ax3.XAxis.Visible = 'off';

% --- AXIS 4: Voltage (U2) ---
ax4 = axes('Position', ax_pos, 'YColor', [0.1 0.3 0.9], 'Color', 'none', 'YAxisLocation', 'left', 'Box', 'off');
ax4.Position(1) = ax_pos(1) - 0.15;
hold(ax4, 'on');
h4 = plot(P2_rec, V2_LL, '-d', 'Color', [0.1 0.3 0.9], 'LineWidth', 1.5, 'MarkerFaceColor', [0.1 0.3 0.9]);
ylabel(ax4, 'V2 (L1-L2) [V]');
ylim(ax4, [0 450]);
ax4.XAxis.Visible = 'off';

% Labels, Title, and Legend
xlabel(ax1, 'P2 (receiving) [W]');
xlim(ax1, [300 700]);
title(ax1, 'Long Line Impedance Matching', 'FontSize', 14, 'FontWeight', 'bold');

% Fixed Legend: Collects handles from all axes
legend([h1, h2, h3, h4], {'ΣP1 [W]', 'ΣQ1 [var]', 'I2 (L1) [A]', 'V2 (L1-L2) [V]'}, ...
    'Location', 'northoutside', 'Orientation', 'horizontal');

linkaxes([ax1 ax2 ax3 ax4], 'x');
set([ax1 ax2 ax3 ax4], 'FontSize', 10, 'LineWidth', 1.2);
