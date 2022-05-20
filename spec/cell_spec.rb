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
end
