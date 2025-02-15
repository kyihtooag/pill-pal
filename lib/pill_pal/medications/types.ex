import EctoEnum

# Enum representing various medication types.

# - `:tablet` - Solid, compressed medication (e.g., Paracetamol).
# - `:capsule` - Gelatin shell containing liquid or powder.
# - `:syrup` - Liquid medication, often sweetened.
# - `:injection` - Medication delivered via syringe or IV.
# - `:cream` - Semi-solid topical medication.
# - `:ointment` - Oil-based topical medication.
# - `:drop` - Eye, ear, or nasal drops.
# - `:spray` - Aerosolized medication (e.g., nasal spray).
# - `:inhaler` - Medication inhaled for respiratory conditions.
# - `:suppository` - Inserted into rectum, vagina, or urethra.

defenum(PillPal.Medications.TypesEnum, :types, [
  :tablet,
  :capsule,
  :syrup,
  :injection,
  :cream,
  :ointment,
  :drop,
  :spray,
  :inhaler,
  :suppository
])
