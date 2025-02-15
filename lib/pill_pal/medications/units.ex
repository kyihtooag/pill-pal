import EctoEnum

# Measurement units for medications.

# - `:mg` (milligram) - Common for solid medications like tablets.
# - `:g` (gram) - Used for larger solid dosages.
# - `:mcg` (microgram) - A very small unit, used for potent drugs (e.g., hormonal medications).
# - `:IU` (International Unit) - Used for vitamins, hormones, and enzymes.
# - `:MEq` (Milliequivalent) - Often used for electrolytes like potassium or sodium.
# - `:mL` (milliliter) - Standard for liquid medications like syrups or injections.
# - `:cc` (cubic centimeter) - Equivalent to mL, commonly used in injections.
# - `:drop` (drop) - Used for eye drops, ear drops, or nasal sprays.
# - `:puff` (puff) - Measurement for inhalers or nebulizers.
# - `:tsp` (teaspoon) - Approx. 5mL, used for liquid medications.
# - `:tbsp` (tablespoon) - Approx. 15mL, used for larger liquid doses.
# - `:oz` (ounce) - Approx. 30mL, rarely used in medical prescriptions.
# - `:U` (Unit) - Non-standardized unit used for some drugs like insulin.
defenum(PillPal.Medications.UnitsEnum, :units, [
  :mg,
  :g,
  :mcg,
  :IU,
  :MEq,
  :mL,
  :cc,
  :drop,
  :puff,
  :tsp,
  :tbsp,
  :oz,
  :U
])
