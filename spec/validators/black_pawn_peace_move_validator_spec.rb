require_relative '../../lib/library'
require_relative '../validator_interface_spec'

describe BlackPawnPeaceMoveValidator do
  let(:board) { instance_double(Board) }
  subject(:validator) { described_class.new(board) }

  context 'when BlackPawnPeaceMoveValidator is a child of Validator' do
    include_examples 'has validator interface'
  end

  describe '#valid?' do
    context 'when end_pos is not empty' do
      it 'should return false' do
        cell1 = Cell.new(4, 2)
        cell2 = Cell.new(4, 3)
        allow(board).to receive(:empty_at?).with(cell2).and_return(false)
        result = validator.valid?(cell1, cell2)
        expect(result).to be false
      end
    end

    context 'when end_pos is empty' do
      before do
        allow(board).to receive(:empty_at?).and_return(true)
      end

      context 'when end_pos is not at (-2, 0) or (-1, 0) from start_pos' do
        it 'is invalid' do
          cell1 = Cell.new(6, 2)
          cell2 = Cell.new(5, 1)
          result = validator.valid?(cell1, cell2)
          expect(result).to be false
        end
      end

      context 'when end_pos is at (-1, 0) start_pos' do
        let(:cell1) { Cell.new(6, 2) }
        let(:cell2) { Cell.new(5, 2) }

        it 'is valid' do
          result = validator.valid?(cell1, cell2)
          expect(result).to be true
        end
      end

      context 'when end_pos is at (-2, 0) from start_pos' do
        context 'when end_pos is not at  row 6' do
          let(:cell1) { Cell.new(5, 2) }
          let(:cell2) { Cell.new(3, 2) }

          it 'is invalid' do
            result = validator.valid?(cell1, cell2)
            expect(result).to be false
          end
        end

        context 'when end_pos is at row 6' do
          let(:cell1) { Cell.new(6, 2) }
          let(:cell2) { Cell.new(4, 2) }

          it 'is valid if no piece is in between' do
            allow(board).to receive(:no_piece_in_vertical_line_between_2_cells?).and_return(true)
            result = validator.valid?(cell1, cell2)
            expect(result).to be true
          end

          it 'is invalid if pieces are in between' do
            allow(board).to receive(:no_piece_in_vertical_line_between_2_cells?).and_return(false)
            result = validator.valid?(cell1, cell2)
            expect(result).to be false
          end
        end
      end
    end
  end
end