# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    nlines = "\n"
    tab     = "\t"

    rows = tsv.split(nlines).map { |line| line.split(tab) }
    header  = rows[0]
    records = rows[1..-1]
    @data = records.map do |record|
      next(record.map.with_index { |item, idx| [header[idx], item] }.to_h)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    nlines = "\n"
    tab     = "\t"

    header  = @data.first.keys
    records = @data.map { |record| record.values.join(tab) }

    ([header.join(tab)] + records).join(nlines) + nlines


  end
end
