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

  def ads_responsive
  raw('<div class="ads-responsive"><script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
  <!-- responsive -->
  <ins class="adsbygoogle"
   style="display:block"
   data-ad-client="ca-pub-5354980582576230"
   data-ad-slot="7648483672"
   data-ad-format="auto"
   data-full-width-responsive="true"></ins>
  <script>
  (adsbygoogle = window.adsbygoogle || []).push({});
  </script></div>')
  end

end
