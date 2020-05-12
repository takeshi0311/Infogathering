class Scraping

  def self.get_infos_attribute(element,main)
    title = main.at(element)
    title = title.get_attribute('title')
    return title
  end

  def self.get_infos_inner_text(element,main)
    text = main.at(element)
    text = text.inner_text
    return text
  end

  def self.get_infos_url(element,main)
    url = main.at(element)
    url = url.get_attribute('href')
    return url
  end
# --------はてなブックマークIT-----------------------------------------------------------------------------------------------------------------
  def self.saveinfo
  agent    = Mechanize.new
  page     = agent.get("https://b.hatena.ne.jp/entrylist/it")
  elements = page.search('.entrylist-contents-main')
    elements.each do |ele|
      title = get_infos_attribute('.entrylist-contents-title a',ele)
      text  = get_infos_inner_text('.entrylist-contents-body a .entrylist-contents-description',ele)
      url   = get_infos_url('.entrylist-contents-title a',ele)
      # 検索した条件のレコード（title,text,url)があれば返す、無ければ新しくインスタンスを生成し、DBに保存する
      info = Info.where(title: title, text: text, url: url).first_or_create
    end
  end

# --------Developers.IO-----------------------------------------------------------------------------------------------------------------
  def self.developers
  agent    = Mechanize.new
  page     = agent.get("https://dev.classmethod.jp/")
  elements = page.search(".post-container")
    elements.each do |ele|
      title = "Developers.IO"
      text  = get_infos_inner_text('.post-content .post-title',ele)
      url1  = "https://dev.classmethod.jp/"
      url2  = get_infos_url('.link',ele)
      url3  = url1 + url2
      info  = Info.where(title: title, text: text, url: url3).first_or_create
    end
  end

  # --------サイボウズ式-----------------------------------------------------------------------------------------------------------------
    def self.cybozu
    agent    = Mechanize.new
    page = agent.get("https://cybozushiki.cybozu.co.jp/recent_8.html")
    elements = page.search(".m-card-v__inner")
      elements.each do |ele|
        title = "サイボウズ式"
        text  = get_infos_inner_text('.m-card-v__ttl',ele)
        url   = get_infos_url('a',ele)
        info  = Info.where(title: title, text: text , url: url).first_or_create
    end
  end

end
