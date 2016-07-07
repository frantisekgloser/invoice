require 'rails_helper'

describe MathUtils do
  describe '.factorial(n)' do
    it { expect { MathUtils.factorial(-1) }.to raise_exception(ArgumentError) }

    it { expect(MathUtils.factorial(0)).to eql(1) }
    it { expect(MathUtils.factorial(1)).to eql(1) }
    it { expect(MathUtils.factorial(2)).to eql(2) }
    it { expect(MathUtils.factorial(3)).to eql(6) }
    it { expect(MathUtils.factorial(4)).to eql(24) }
    it { expect(MathUtils.factorial(5)).to eql(120) }
    it { expect(MathUtils.factorial(6)).to eql(720) }
  end
end
