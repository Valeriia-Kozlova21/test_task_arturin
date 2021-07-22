module Posts
  class CreateService < Service
    class Input < BaseInput
      attribute :title, type: String
      attribute :post, type: String
      attribute :social_networks, array: true
      attribute :schedule_time, type: Date

      validates :title, presence: true
      validates :post, presence: true
      validates :schedule_time, presence: true
    end

    attr_reader :input, :post

    def perform
      # TODO:
      # 1. create SocialContent with title and post from input
      # 2. create as many related SocialPosts as many social_networks you have selected
      # 3. care about data consistency (Please read about ActiveRecord::Base.transaction)
      # 4. You must not create any SocialContent and SocialPosts:
      #   - if schedule_time in the past
      #   - if social_networks is empty array
      #   - if post length more then 250 symbols
      #   - if title length more then 50 symbols
#binding.pry
      if input.schedule_time >= Date.today
        if input.social_networks[1] != nil
          if input.post.length > 0 && input.post.length <= 250 && input.title.length > 0 && input.title.length <= 50

            #@netw = input.social_networks
            #@netw.shift
            #@netw.each do |social_network|
              #@post = SocialContent.create(title: input.title, post: input.post)
              #@post.social_posts.create(schedule_time: input.schedule_time, social_network: @netw)
              #@post.save
            #end

            if (input.social_networks).size == 2 #в input приходит ["", "twitter"]
              @post = SocialContent.create(title: input.title, post: input.post)
              @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[1])
              @post.save
            else
              if (input.social_networks).size == 3 #в input приходит ["", "twitter", "google"]
                @post = SocialContent.create(title: input.title, post: input.post)
                @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[1])
                @post.save
                @post = SocialContent.create(title: input.title, post: input.post)
                @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[2])
                @post.save
              else
                if (input.social_networks).size == 4 #в input приходит ["", "twitter", "google", "facebook"]
                  @post = SocialContent.create(title: input.title, post: input.post)
                  @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[1])
                  @post.save
                  @post = SocialContent.create(title: input.title, post: input.post)
                  @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[2])
                  @post.save
                  @post = SocialContent.create(title: input.title, post: input.post)
                  @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[3])
                  @post.save
                else #(input.social_networks).size == 5 #в input приходит ["", "twitter", "google", "facebook", "linkedin"]
                    @post = SocialContent.create(title: input.title, post: input.post)
                    @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[1])
                    @post.save
                    @post = SocialContent.create(title: input.title, post: input.post)
                    @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[2])
                    @post.save
                    @post = SocialContent.create(title: input.title, post: input.post)
                    @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[3])
                    @post.save
                    @post = SocialContent.create(title: input.title, post: input.post)
                    @post.social_posts.create(schedule_time: input.schedule_time, social_network: input.social_networks[4])
                    @post.save
                end
              end
            end
          else
            errors.add(:base, 'Error! Title length should not exceed 50 symbols, post length should not exceed 250 symbols')
          end
        else
          errors.add(:base, 'Error! The field social_networks cannot be empty')
        end
      else
        errors.add(:base, 'Error! Invalid date')
      end
      

    end
  end
end
