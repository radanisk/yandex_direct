# frozen_string_literal: true

class GeoRegionsItem
  attr_reader :geo_region_id, :parent_id, :geo_region_name

  def initialize(attrs)
    @geo_region_id = attrs['GeoRegionId']
    @parent_id = attrs['ParentId']
    @geo_region_name = attrs['GeoRegionName']
  end
end
