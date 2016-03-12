class String
  def whole_space_to_half_space
    self.gsub(/　/, ' ')
  end
end

class LyricMaker < Mechanize
  @@phrases = []
  def self.get_each_lyric
    url = 'http://j-lyric.net/artist/a000603/'
    links = []
    agent = Mechanize.new
    current_page = agent.get(url)
    elements = current_page.search('#lyricList .body .title a')
    elements.each do |ele|
      links << ele[:href]
    end

    links.each do |link|
      get_lyric('http://j-lyric.net' + link)
    end
  end

  def self.just_deviding_word(lyrics)
    lyrics.each_line do |line|
      block = line.split
      block.each do |phrase|
        unless phrase =~/["#$%&'()※△\*\+\-\.,\/:;<=>?@\[\\\]^_`{|}~]/
          lyric = Lyric.new
          if phrase =~ /　/
            new_b = phrase.whole_space_to_half_space
            array = new_b.split
            array.each do |phrase|
              lyric.word
              lyric.save if lyric.word
            end
          else
            lyric.word = phrase
            lyric.save if lyric.word
          end
        end
      end
    end
  end

  # not used
  def self.separate_english_word(lyrics)
    lyrics.each_line do |line|
      if line != ""
        lyric = Lyric.new
        lyric.word = line
        lyric.save
      end
    end
  end


  def self.get_lyric(link)
    agent = Mechanize.new
    page = agent.get(link)
    lyrics = page.at('#lyricBody').inner_text
    #separate_english_word(lyrics)
    just_deviding_word(lyrics)
  end
end





# LyricMaker.get_each_url(spitz_url)
# LyricMaker.sort_words

