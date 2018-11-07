using Random

@testset "testing Ancestor(A∞) functions" begin
    @test ExactWrightFisher.log_akmθ(0.75, 6, 4) ≈ 8.026285751157305 atol=10^(-8)
    @test ExactWrightFisher.log_bk_t_θ_t(8, 0.2, 0.75, 6) ≈ 5.072288573098844 atol=10^(-8)
    @test ExactWrightFisher.C_m_t_θ(5,0.2,0.75) == 3
    res = ExactWrightFisher.S_kvec_M_both_logsumexp([1,3,5], 0.2, 0.75)
    @test res[1] ≈ -0.2155481972208509 atol=10^(-8)
    @test res[2] ≈ 0.4997661919804376 atol=10^(-8)
    res = ExactWrightFisher.S_kvec_M_both_logsumexp([1,3,50, 10], 0.0002, 0.075)
    @test res[1] ≈ -999287.7254125872 atol=10^(-8)
    @test res[2] ≈ 855577.1585386565 atol=10^(-8)
    res = ExactWrightFisher.S_kvec_M_both_logsumexp([1,3,50, 10], 0.0002, 75.)
    @test res[1] ≈ -5.0203078807598144e54 atol=10^(-8)
    @test res[2] ≈ 2.913127881696057e54 atol=10^(-8)
    @test ExactWrightFisher.S_kvec_M_plus_logsum_nosign([1,3,5], 0.2, 0.75) ≈ -0.6936149059655459 atol=10^(-8)
    @test ExactWrightFisher.S_kvec_M_plus_logsum_nosign([1,3,50,100], 0.2, 0.75) ≈ -0.6945637479851614 atol=10^(-8)
    @test ExactWrightFisher.S_kvec_M_plus_logsum_nosign([1,3,50,10], 0.0002, 75.) ≈ 125.40882239903411 atol=10^(-8)
    Random.seed!(0)
    @test ExactWrightFisher.Compute_A∞(1.5, 1.) == 2
    @test ExactWrightFisher.β(1.5,0.05) == 0.0125
    @test ExactWrightFisher.β(0.,0.05) == 0.
    @test ExactWrightFisher.η_of_β(0.02) ≈ 0.9900333331111149 atol=10^(-8)
    @test ExactWrightFisher.η_of_β(1.) == 1.
    @test ExactWrightFisher.η(1.5, 0.05) ≈ 0.9937630207994219 atol=10^(-8)
    @test ExactWrightFisher.μ(1.5, 0.05) ≈ 1.864268029836541 atol=10^(-8)
    Random.seed!(0)
    @test ExactWrightFisher.Compute_A∞_good_m_start(sum((1:4)), 0.05) == 38
end
