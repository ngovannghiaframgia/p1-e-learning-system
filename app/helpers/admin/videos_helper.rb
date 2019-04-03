module Admin::VideosHelper
  def format_link_video str
    if str.slice(0..6) != "<iframe"
      return str = ""
    else
      i1 = str.index('width="') + 7
      i2 = str.index('" h') - 1
      str[i1..i2] = '200'

      y1 = str.index('height="') + 8
      y2 = str.index('" s') - 1
      str[y1..y2] = '200'
      return str
    end
  end
end
