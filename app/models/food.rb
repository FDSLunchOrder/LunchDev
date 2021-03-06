class Food < ActiveRecord::Base

  require 'roo'

  belongs_to :restaurant
  has_many :accounts, through: :orders
  belongs_to :food_type

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |food|
        csv << food.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    accessible_attributes = ["restaurant_id", "name", "name2", "active", "price","price2", "foodType_id"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      account = find_by_id(row["id"]) || new
      account.attributes = row.to_hash.slice(*accessible_attributes)
      account.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::Csv.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

end
