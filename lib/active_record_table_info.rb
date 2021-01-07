# frozen_string_literal: true

require_relative 'active_record_table_info/version'

module ActiveRecordTableInfo # rubocop:disable Style/Documentation
  def show_create_table
    puts connection.select_one("show create table #{table_name}")['Create Table'] # rubocop:disable Rails/Output
  end

  def table_info
    puts (['-- COLUMNS --'] + table_columns + ['-- INDEXES --'] + table_indexes).map { |line| "#{line}\n" }.join # rubocop:disable Rails/Output
  end

  def table_columns # rubocop:disable Metrics/AbcSize
    connection.columns(table_name).map do |column|
      [
        "`#{column.name}`",
        column.sql_type,
        column.null ? 'NULL' : 'NOT NULL',
        column.try(:collation) ? "COLLATE #{column.collation}" : nil,
        column.try(:extra) == 'auto_increment' ? 'AUTO_INCREMENT' : nil,
        column.null || !column.default.nil? ? "DEFAULT #{column.default.inspect}" : nil
      ].compact.join(' ')
    end
  end

  def table_indexes
    [table_primary_index] + table_non_primary_indexes
  end

  def table_primary_index
    "PRIMARY KEY (#{primary_key})"
  end

  def table_non_primary_indexes
    connection.indexes(table_name).map do |index|
      "#{index.unique ? 'UNIQUE KEY' : 'KEY'} `#{index.name}` (#{index.columns.join(', ')})"
    end
  end
end
