import 'package:chess/models/cell_index.dart';
import 'package:chess/models/figures/figure.dart';

typedef BoardList = List<List<Figure?>>;

extension BoardListExt on BoardList {
  Figure? getFigure(CellIndex index) => this[index.ver][index.hor];

  void setFigure(Figure figure, [CellIndex? index]) {
    if (index == null) return;
    this[index.ver][index.hor] = figure;
  }

  BoardList moveFigure(CellIndex target, CellIndex selected) {
    final figure = this[selected.ver][selected.hor];
    return List.generate(8, (vIndex) {
      return List.generate(8, (hIndex) {
        if (vIndex == target.ver && hIndex == target.hor) return figure;
        if (vIndex == selected.ver && hIndex == selected.hor) return null;
        return this[vIndex][hIndex];
      });
    });
  }
}
