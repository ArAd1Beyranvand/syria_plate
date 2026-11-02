"""Port of syria_plate/lib/src/syria_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re

from plates.core.validators.plate_validator import (
    GatedPlateValidator, PlateEntry, PlateValidation, PlateValidator, is_digits, is_digits_of_length, restriction_verdict)


_LETTER = re.compile(r"[A-Z]")


class SyriaTransitionalValidator(GatedPlateValidator):
    gate_group = "serial"
    reason_code = "The code is two digits."
    reason_serial = "The serial is five digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        return self.validate_fields(code=entry.group("code"), serial=entry.group("serial"))

    @classmethod
    def validate_fields(cls, *, code: str, serial: str) -> PlateValidation:
        if not is_digits_of_length(code, 2):
            return PlateValidation.invalid(cls.reason_code)
        if not is_digits_of_length(serial, 5):
            return PlateValidation.invalid(cls.reason_serial)
        return PlateValidation.valid()


class AanesValidator(GatedPlateValidator):
    gate_group = "serial"
    reason_serial = "The number is six digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        return self.validate_fields(serial=entry.group("serial"))

    @classmethod
    def validate_fields(cls, *, serial: str) -> PlateValidation:
        if is_digits_of_length(serial, 6):
            return PlateValidation.valid()
        return PlateValidation.invalid(cls.reason_serial)


class AanesMotorcycleValidator(GatedPlateValidator):
    gate_group = "serial"
    reason_letter = "A motorcycle plate starts with a letter."
    reason_serial = "The number is four digits."

    def judge(self, entry: PlateEntry) -> PlateValidation:
        return self.validate_fields(letter=entry.group("letter"), serial=entry.group("serial"))

    @classmethod
    def validate_fields(cls, *, letter: str, serial: str) -> PlateValidation:
        if not _LETTER.fullmatch(letter):
            return PlateValidation.invalid(cls.reason_letter)
        if not is_digits_of_length(serial, 4):
            return PlateValidation.invalid(cls.reason_serial)
        return PlateValidation.valid()
