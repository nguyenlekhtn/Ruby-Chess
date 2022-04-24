require 'piece/bishop'
require 'piece/black_pawn'
require 'piece/king'
require 'piece/piece'
require 'piece/queen'
require 'piece/rook'
require 'piece/white_pawn'
require 'piece/knight'

class Board
  attr_reader :board

  def initialize
    @board = create_default_board
  end

  def create_default_board
    default_board = Array.new(8) { Array.new(8) { Piece.new } }
    default_board[7][0] = Rook.new('black')
    default_board[7][1] = Knight.new('black')
    default_board[7][2] = Bishop.new('black')
    default_board[7][3] = Queen.new('black')
    default_board[7][4] = King.new('black')
    default_board[7][5] = Bishop.new('black')
    default_board[7][6] = Knight.new('black')
    default_board[7][7] = Rook.new('black')
    default_board[6] = Array.new(8) { BlackPawn.new }

    default_board[0][0] = Rook.new('white')
    default_board[0][1] = Knight.new('white')
    default_board[0][2] = Bishop.new('white')
    default_board[0][4] = King.new('white')
    default_board[0][5] = Bishop.new('white')
    default_board[0][6] = Knight.new('white')
    default_board[0][7] = Rook.new('white')
    default_board[1] = Array.new(8) { WhitePawn.new }

    default_board
  end

  def get(cell)
    row, col = cell.position
    board[row][col]
  end
end
