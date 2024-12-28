#-------------------------------------------------------------------------------
# Color utilities
#-------------------------------------------------------------------------------


class Color():
    def __init__(self, input: str):
        if len(input) != 6:
            raise ValueError('Must be 6 chars.')

        try:
            _ = int(input, 16)

        except ValueError:
            raise ValueError('Not a hexadecimal value.')

        self.hex = input
        self.r = int(hex[0:2], 16)
        self.g = int(hex[2:4], 16)
        self.b = int(hex[4:6], 16)

    def to_hex(self):
        return self.hex

    def to_css_rgba(self, alpha):
        return f'rgba({self.r}, {self.g}, {self.b}, {alpha})'

    def to_rgb_int(self):
        return f'{self.r},{self.g},{self.b}'