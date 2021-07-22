module Posts
  class FeedFilter < BaseFilter
    def perform
      # TODO:
      # 1. apply all filters that come from input
      #   - filter by title/post contains search_text
      #   - filter by social networks
      #   - filter by date range (date_from, date_to)
      if input.social_networks.present? && input.search_text.present?&& input.date_from.present? && input.date_to.present?
        base_scope.joins(:social_posts).where(social_posts: {social_network: input.social_networks}).joins(:social_posts).where("schedule_time >= ? AND schedule_time <= ? AND title LIKE ? OR post LIKE ?", input.date_from, input.date_to + 1.day, "%#{input.search_text}%", "%#{input.search_text}%")
        
      else 
        base_scope
      end
    end

    private

    # NOTE: this method can be modified

    def base_scope
      SocialContent.all.includes(:social_posts)
    end
  end
end
