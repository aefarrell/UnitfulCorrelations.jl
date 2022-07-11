using Unitful
using UnitfulCorrelations
using Test

@testset "UnitfulCorrelations.jl" begin
    
    foo(x) = x^2
    @ucorrel foo u"m" u"s"
    @test foo(2) == 4
    @test foo(2u"m") == 4u"s"

    @ucorrel function bar(x)
        x^3
    end u"m" u"K"
    @test bar(2) == 8
    @test bar(2u"m") == 8u"K"

end
