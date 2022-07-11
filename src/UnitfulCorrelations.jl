module UnitfulCorrelations

using Unitful: Quantity, ustrip, @u_str

export @ucorrel

macro ucorrel(f::Symbol, in_unit::Expr, out_unit::Expr)
   quote
       function $(esc(f))(x::Quantity)::Quantity
           x = ustrip($in_unit, x)
           res = $(esc(f))(x)
           return res*$out_unit
       end
   end
end

macro ucorrel(fblock::Expr, in_unit::Expr, out_unit::Expr)
    @assert fblock.head == :function
    fname = fblock.args[1].args[1]
    quote
        $(esc(fblock))
        function $(esc(fname))(x::Quantity)::Quantity
            x = ustrip($in_unit, x)
            res = $(esc(fname))(x)
            return res*$out_unit
        end
    end
end

end
