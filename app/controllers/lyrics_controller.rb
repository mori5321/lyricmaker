class LyricsController < ApplicationController
  def index
    @lyrics1 = Lyric.find(Lyric.pluck(:id).shuffle[0..19])
    @lyrics2 = Lyric.find(Lyric.pluck(:id).shuffle[0..9])
  end

  def random
    @lyrics3 = Lyric.find(Lyric.pluck(:id).shuffle[0..9])
  end

  private
  def fruit_params
    params.require(:lyric).permit(:word)
  end
end
