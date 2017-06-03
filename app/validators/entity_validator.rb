class EntityValidator
  extend Dry::Initializer

  param :params
  param :periods_count

  option :schema, default: proc { initialize_schema }

  delegate :success?, :errors, to: :schema

  private

  # rubocop:disable NestedMethodDefinition
  # rubocop:disable AbcSize
  # rubocop:disable MethodLength
  def initialize_schema
    Dry::Validation.Schema do
      configure do
        config.messages = :i18n
        option :periods_count

        def one_of?(values, arr)
          arr.all? { |value| values.include?(value) }
        end
      end

      required(:name).filled
      required(:sum).value(:int?)
      required(:statuses).value(one_of?: Period::STATUSES, size?: periods_count)
    end.with(periods_count: periods_count).call(params)
  end
  # rubocop:enable NestedMethodDefinition
  # rubocop:enable AbcSize
  # rubocop:enable MethodLength
end
