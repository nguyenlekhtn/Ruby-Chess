# frozen_string_literal: true

require_relative '../lib/library'

describe Cell do
  describe '#self.for' do
    context 'when give a valid input with uppcase' do
      it 'returns the cell instance with correct row and col' do
        cell = Cell.for('A4')

        expect(cell.row).to eq 3
        expect(cell.col).to eq 0
      end
    end

    context 'when give a valid input with lowercase' do
      it 'returns the cell instance with correct row and col' do
        cell = Cell.for('a3')

        expect(cell.row).to eq 2
        expect(cell.col).to eq 0
      end
    end

    context 'when give an out-of-range input' do
      it 'returns nil' do
        result = Cell.for('A9')

        expect(result).to eq nil
      end
    end
  end

  describe '#same_horizontal_line_with_cell?' do
    subject(:cell) { described_class.new(0, 1) }

    context 'if the cell is in the same row with another cell' do
      it 'returns true' do
        result = cell.same_horizontal_line_with_cell?(described_class.new(0, 3))
        expect(result).to be true
      end
    end

    context 'if the cell is not in the same row with another cell' do
      it 'returns false' do
        result = cell.same_horizontal_line_with_cell?(described_class.new(1, 3))
        expect(result).to be false
      end
    end
  end

  describe '#same_vertical_line_with_cell?' do
    subject(:cell) { described_class.new(4, 3) }

    context 'if the cell is in the same column with another cell' do
      it 'returns true' do
        result = cell.same_vertical_line_with_cell?(described_class.new(0, 3))
        expect(result).to be true
      end
    end

    context 'if the cell is not in the same column with another cell' do
      it 'returns false' do
        result = cell.same_vertical_line_with_cell?(described_class.new(4, 2))
        expect(result).to be false
      end
    end
  end

  describe '#same_diagonal_line_with_cell?' do
    subject(:cell) { described_class.new(4, 3) }

    context 'if the cell is in the same diagonal line with another cell' do
      it 'returns true' do
        result = cell.same_diagonal_line_with_cell?(described_class.new(7, 6))
        expect(result).to be true
      end
    end

    context 'if the cell is not in the same diagonal line with another cell' do
      it 'returns false' do
        result = cell.same_diagonal_line_with_cell?(described_class.new(4, 2))
        expect(result).to be false
      end
    end
  end

  describe '#same_anti_diagonal_line_with_cell?' do
    subject(:cell) { described_class.new(4, 3) }

    context 'if the cell is in the same anti diagonal line with another cell' do
      it 'returns true' do
        result = cell.same_anti_diagonal_line_with_cell?(described_class.new(1, 6))
        expect(result).to be true
      end
    end

    context 'if the cell is not in the same an diagonal line with another cell' do
      it 'returns false' do
        result = cell.same_anti_diagonal_line_with_cell?(described_class.new(4, 2))
        expect(result).to be false
      end
    end
  end

  describe '#cells_in_between_horizontal_line_from_cell' do
    subject(:cell_horizontal) { described_class.new(0, 0) }

    context 'when the cell is at 0, 0 and the other is at 0, 3' do
      it 'has (0,1) (0,2) cell in betrween' do
        result = cell_horizontal.cells_in_between_horizontal_line_from_cell(described_class.new(0, 3))
        expected = [Cell.new(0, 1), Cell.new(0, 2)]
        expect(result).to match_array(expected)
      end
    end
  end

  describe '#cells_in_between_vertical_line_from_cell' do
    subject(:cell_horizontal) { described_class.new(0, 0) }

    context 'when the cell is at 0, 0 and the other is at 0, 3' do
      it 'has (0,1) (0,2) cell in betrween' do
        result = cell_horizontal.cells_in_between_vertical_line_from_cell(described_class.new(3, 0))
        expected = [Cell.new(1, 0), Cell.new(2, 0)]
        expect(result).to match_array(expected)
      end
    end
  end

  describe '#cells_in_between_diagonal_line_from_cell' do
    subject(:cell_horizontal) { described_class.new(4, 0) }

    context 'when the cell is at 4, 0 and the other is at 1, 3' do
      it 'has (3,1) (2,2) cell in betrween' do
        result = cell_horizontal.cells_in_between_diagonal_line_from_cell(described_class.new(1, 3))
        expected = [Cell.new(3, 1), Cell.new(2, 2)]
        expect(result).to match_array(expected)
      end
    end
  end

  describe '#cells_in_between_anti_diagonal_line_from_cell' do
    subject(:cell_horizontal) { described_class.new(1, 0) }

    context 'when the cell is at 1, 0 and the other is at 4, 3' do
      it 'has (2,1) (3,2) cell in betrween' do
        result = cell_horizontal.cells_in_between_diagonal_line_from_cell(described_class.new(4, 3))
        expected = [Cell.new(2, 1), Cell.new(3, 2)]
        expect(result).to match_array(expected)
      end
    end
  end

  describe '#jump' do
    subject(:cell) { described_class.new(3, 4) }

    context 'when the cell jump in-range' do
      it 'should return a new cell' do
        result = cell.jump(row_step: 2, col_step: -2)
        expected = described_class.new(5, 2)

        expect(result).to eq expected
      end
    end

    context 'when the cell jump out-range' do
      it 'should return nil' do
        result = cell.jump(row_step: 5, col_step: -2)
        expected = nil

        expect(result).to eq expected
      end
    end
  end

  describe 'to_s' do
    context 'if the cell is at row 0, col 0' do
      subject(:cell) { described_class.new(0, 0) }

      it 'should be print as A1' do
        result = cell.to_s
        expect(result).to eq 'A1'
      end
    end

    context 'if the cell is at row 7, col 7' do
      subject(:cell) { described_class.new(7, 7) }

      it 'should be print as H8' do
        result = cell.to_s
        expect(result).to eq 'H8'
      end
    end

    context 'if the cell is at row 4, col 4' do
      subject(:cell) { described_class.new(4, 4) }

      it 'should be print as E5' do
        result = cell.to_s
        expect(result).to eq 'E5'
      end
    end
  end
end
