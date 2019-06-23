# frozen_string_literal: true

json.array! @hints, partial: 'hints/hint', as: :hint
