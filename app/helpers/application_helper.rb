module ApplicationHelper
    # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "TWESUME"
    if page_title.empty?                                        #page_titleが空白の場合
      base_title
    else                                                        #page_titleが空白でない場合
      page_title + " | " + base_title
    end
  end

  # 改行を<br>に変換する
  def newline2br(str)
    str.gsub(/(\r\n|\r|\n)/, "<br>")
  end


end
