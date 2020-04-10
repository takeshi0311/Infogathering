class Scraping

  # -----はてなブックマークITーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
  def self.get_infos_attribute(element,main)
    title = main.at(element)
    title = title.get_attribute('title')
    # puts variable
    # info = Info.new(title: variable)
    # info.save
    return title
  end

  def self.get_infos_inner_text(element,main)
    text = main.at(element)
    text = text.inner_text
    # puts variable
    # info = Info.new(text: variable)
    # info.save
    return text
  end

  def self.get_infos_url(element,main)
    url = main.at(element)
    url = url.get_attribute('href')
    # puts variable
    # info = Info.new(url: variable)
    # info.save
    return url
  end

  def self.saveinfo
  agent = Mechanize.new
  page  = agent.get("https://b.hatena.ne.jp/entrylist/it")
  elements= page.search('.entrylist-contents-main')
    elements.each do |ele|
      title = get_infos_attribute('.entrylist-contents-title a',ele)
      text  = get_infos_inner_text('.entrylist-contents-body a .entrylist-contents-description',ele)
      url   = get_infos_url('.entrylist-contents-title a',ele)
      # 検索した条件のレコード（title,text,url)があれば返す、無ければ新しくインスタンスを生成し、DBに保存する
      info = Info.where(title: title, text: text, url: url).first_or_initialize
      info.save
    end
  end
# -----はてなブックマークITーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー


end
