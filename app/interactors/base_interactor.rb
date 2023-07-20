# frozen_string_literal: true

# class validate context
module BaseInteractor
  def self.included(base)
    base.extend ClassMethods
  end

  # method to validate mandatory attributes in context
  module ClassMethods
    def requires(*attributes)
      before do
        args = []
        attributes.each do |attribute|
          value = context.public_send(attribute)
          next if value&.present?

          args << attribute
        end

        context.fail!(errors: "Required: #{args.map(&:to_s)}") if args.present?
      end
    end
  end
end
