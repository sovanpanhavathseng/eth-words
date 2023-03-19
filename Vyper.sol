# SPDX-License-Identifier: GPL-3.0
import vyopt as opt

@opt.freeze
contract MyVyperContract:
    value: string

    def setValue(_value: string):
        self.value = _value

    def getValue() -> string:
        return self.value
