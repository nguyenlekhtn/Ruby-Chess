# frozen_string_literal: true

require_relative '../lib/library'

describe Cell do
  describe '#self.for' do
    context 'when give a valid input' do
      it 'returns the cell instance with correct row and col' do
        cell = Cell.for('A4')

        expect(cell.row).to eq 3
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
end
