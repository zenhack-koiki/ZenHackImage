json.array! @categorings do |categoring|
	json.url 							categoring.talk.url << '?language=' << @lang_code
	json.img_url 					categoring.talk.img_url
	json.published_date		categoring.talk.published_date.strftime("%b %Y")
	json.length						sprintf('%02d', categoring.talk.length / 60) << ':' << sprintf('%02d', categoring.talk.length % 60)
	json.speaker					categoring.talk.speaker
	json.title						categoring.title
end