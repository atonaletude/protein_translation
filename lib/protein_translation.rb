class InvalidCodonError < StandardError; end


class Translation
  CODONS = {
  ["AUG"] => "Methionine",
  ["UUU", "UUC"] => "Phenylalanine",
  ["UUA", "UUG"] =>	"Leucine",
  ["UCU", "UCC", "UCA", "UCG"] =>	"Serine",
  ["UAU", "UAC"] =>	"Tyrosine",
  ["UGU", "UGC"] =>	"Cysteine",
  ["UGG"] => "Tryptophan",
  ["UAA", "UAG", "UGA"] => "STOP"
  }

  def self.of_codon(codon)
    codon_collection = []
    CODONS.keys.each do |key|
      if key.include?(codon)
        codon_collection = key
        break
      end
    end
    CODONS[codon_collection]
  end

  def self.of_rna(rna_strand)
    results = rna_strand.scan(/.../).map do |value|
      of_codon(value)
    end
    results.take_while { |value| value != 'STOP' }
  end

end

# p Translation.of_codon ('AUG')

p Translation.of_rna('CARROT')
