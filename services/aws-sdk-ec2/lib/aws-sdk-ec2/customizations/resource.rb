module Aws
  module EC2
    class Resource

      def create_tags(options)
        resp = @client.create_tags(options)
        tags = []
        options[:resources].each do |resource_id|
          options[:tags].each do |tag|
            tags << Tag.new(resource_id, tag[:key], tag[:value], client: @client)
          end
        end
        Tag::Collection.new(tags, response: resp)
      end

    end
  end
end