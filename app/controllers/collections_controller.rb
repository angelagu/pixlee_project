class CollectionsController < ApplicationController
	def index
		if !params[:search].blank?
			tag = Collection.find_or_create_by(tag_name: params[:search])

			result = []
			data = Instagram.tag_recent_media(params[:search])

			if not params[:start_date].blank?
				start_date = Date.parse(params[:start_date]).to_time.to_i.to_s
			else
				start_date = DateTime.now.to_time.to_i.to_s
			end

			if not params[:end_date].blank?
				end_date = Date.parse(params[:end_date]).next.to_time.to_i.to_s
			else
				end_date = DateTime.now.to_time.to_i.to_s
			end

			tag.update_attributes({ 
				:start_date => DateTime.strptime(start_date, '%s'), 
				:end_date => DateTime.strptime(end_date, '%s') })

			begin
				data.each do |ig|
					if ig[:created_time] >= start_date and ig[:created_time] < end_date
						result << ig
						photo = Photo.find_or_create_by(link: ig.link)
						photo.update_attributes({
							:media_type => ig.type,
							:media_url => ig.images.standard_resolution.url,
							:posted_date => DateTime.strptime(ig.created_time, '%s')
							})
						begin
							tag.photos << photo
						rescue ActiveRecord::RecordNotUnique => e
						end
					end
				end
				data = Instagram.tag_recent_media(params[:search], {:max_tag_id => data.last[:id].split("_")[0]})
			end while data.first[:created_time] >= start_date
			@instagram = result
		end
	end

	def create
		redirect_to :controller => "collections", :action => "index", :search => params[:search], 
		:start_date => params[:start_date], :end_date => params[:end_date]
	end

	def show
	end
end