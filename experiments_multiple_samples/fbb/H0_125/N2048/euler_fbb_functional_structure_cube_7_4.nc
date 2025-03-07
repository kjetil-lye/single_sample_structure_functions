CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T111122        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_py           �import scipy.stats

# Uses fbmpy from https://github.com/kjetil-lye/fractional_brownian_motion
# (this is also a part of alsvinn)
def init_global(rho, ux, uy, p, nx, ny, nz, ax, ay, az, bx, by, bz):
    MAX_RESOLUTION=2048
    
    Y = scipy.stats.norm.ppf(X)

    # Note that we skip the random variables for higher resolutions, this
    # is to make sure we get a convergent sequence (there are other ways of doing this, but this is by far the simplest)
    start_dux = 0
    end_dux = (MAX_RESOLUTION-1)**2
    
    dux = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_dux:end_dux]).reshape(nx+1, nx+1)

    start_duy = end_dux
    end_duy = 2*(MAX_RESOLUTION-1)**2
    duy = fbmpy.fractional_brownian_bridge_2d(hurst_index, nx,
                                              Y[start_duy:end_duy]).reshape(nx+1, nx+1)
    rho[:,:,0] = 4*ones_like(rho[:,:,0])
    ux[:,:,0] = dux[:-1,:-1]
    uy[:,:,0] = duy[:-1,:-1]
    p[:,:,0] = 2.5*ones_like(rho[:,:,0])



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_125_dash_N2048_dash_euler_fbb_DOT_xml          �<?xml version="1.0" ?>
<config>
  <fvm>
    <name>
    euler_fbb
  </name>
    <platform>cuda</platform>
    <grid>
      <lowerCorner>0 0 0</lowerCorner>
      <upperCorner>1 1 0</upperCorner>
      <dimension>2048 2048 1</dimension>
    </grid>
    <boundary>periodic</boundary>
    <flux>hll3</flux>
    <endTime>4</endTime>
    <equation>euler2</equation>
    <equationParameters>
      <gamma>1.4</gamma>
    </equationParameters>
    <reconstruction>wenof2</reconstruction>
    <cfl>auto</cfl>
    <integrator>auto</integrator>
    <initialData>
      <python>euler_fbb.py</python>
      <parameters>
        <parameter>
          <name>hurst_index</name>
          <length>1</length>
          <value>0.125</value>
        </parameter>
        <parameter>
          <name>X</name>
          <length>8380418</length>
          <values>
            <value>0</value>
          </values>
        </parameter>
      </parameters>
    </initialData>
    <diffusion>
      <name>none</name>
      <reconstruction>none</reconstruction>
    </diffusion>
    <functionals>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>1</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_1</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>2</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_2</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>3</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_3</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>4</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_4</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>5</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_5</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>6</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_6</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <numberOfH>64</numberOfH>
        <numberOfSaves>8</numberOfSaves>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_structure_cube_7</basename>
        </writer>
      </functional>
      <functional>
        <name>structure_cube</name>
        <p>7</p>
        <time>3.92</time>
        <numberOfH>64</numberOfH>
        <timeRadius>0.08</timeRadius>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb_functional_time_integrated_structure_cube_7</basename>
        </writer>
      </functional>
    </functionals>
  </fvm>
  <uq>
    <samples>1024</samples>
    <generator>auto</generator>
    <sampleStart>0</sampleStart>
    <parameters>
      <parameter>
        <name>X</name>
        <length>8380418</length>
        <type>uniform</type>
      </parameter>
    </parameters>
    <stats>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>1</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>2</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
      <stat>
        <name>
	structure_cube
      </name>
        <numberOfSaves>1</numberOfSaves>
        <numberOfH>64</numberOfH>
        <p>3</p>
        <writeInitialTimestep>true</writeInitialTimestep>
        <writer>
          <type>netcdf</type>
          <basename>euler_fbb</basename>
        </writer>
      </stat>
    </stats>
  </uq>
</config>
          alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @               ?����x3??�V),�W@��i8U�@r�� �@)�,��@4��$��@>����@D������@K�?�L@Q5[c�`z@UE~{��i@Y�m�E|@^�}�G��@a�	�
OW@d���o��@g���О@j���?�"@m�O�ִ@p�gy��{@r_�&m��@t8NfYv�@v%�'x��@x'^)�@z;ѣ%cB@|a;-g�@~���q��@�l�g"�k@��R�X�9@���x�D�@���T㍕@�@�S�1@������U@���N�/@�<�!��t@����W�@��c?i�@��%��2�@��*i��@�<M��U@��=��:@��qI���@����՜@�\7�<�@�,�"�"�@����@��1l9��@���s�:�@���WY?�@�u���N@�Y�>p/@�@�"YgG@�)��e�@�Aђ1@��~|��@��W@�㷎Ц�@��|�K'�@�f�Y#�@����6�@�_��^��@����;m@�\Mſ�1@���tJ�        ?a$w��m�?����O6?�#�׆ϼ?ځ-ޢڼ?썴�W��?�;@A�@����@�w���@ �ˑ��n@+7�U��~@54�Gd��@@����@G�d���@P���@W��]-@`�� @e����@ldA����@raa�Y>@wu|�{S�@}��A�4m@�e�
@��\�"�|@�����D@@���e 
@��9]�@����P!�@����@�Ji�1�@���^I�@��_n �@����3A@�TB&.��@�����b@�I� u�@�+��c1D@�y�g.�@��*"�i@��j��@@�Z�re@�����@�;�+b2�@��+��@ŧ�ds�O@ǂ�C��@�wGb���@˅��D�@ͮ~��8@���S��@�(+2��=@�e���@ӱD���@��
1�@�u/�H�@��?Wdp�@�wR�8|*@��|?�y@ܻf&j�@�w[�6��@�"�S;�|@���6�@�aN1�@��lf�        ?���d?��_k��?�ۏ�,K@ ���ɏ�@�?l �^@�'��ү@$�����@.��� @6��
�@?�����@F>3hw�@O|#�z}@U�ӓ�&@]���Y�@cլ6�>�@j<h$P��@qZ=��^@u�Vm<��@{���ia@�\[�[�@�_�\�v@���j�[@�<��iE@��R���@���Z��@���g�A@������m@��\PQ�}@�\`���@��!{�f�@���94^�@��|���@���O��@�je@�:@��`zG��@����$X@����h@��a��m@�����@���r�0�@�Y�_��Y@�纋���@�0�I[�T@Ç�U�k@��; 6d�@�d<n��|@�꫆y��@ɂ`�kT@�,Am�C@��7#h�@κ,F�S5@�PQ�Ɨ@�Mѽ(C�@�V��*-K@�k��Ǟ�@Ԍ��u�@չ�MW�E@���fz@�;���e@ِ��f�@��wH�u@�e� �C@���F        @}@f�~��@�}��y$@̕$���D@ߖ���q�@뷴�g6@�Q>�|��@�,ܐDhA-S�UJA	傰�#A+{܁A�ZUg�TAIy�>�AE}x�a�A��X=RA!�(�lA$S�}�U�A&��
�1*A)Q'�t8A+�^$jqA.�|#�v�A0�7n�A�A205΁XA3��P���A51�����A6��hԂ|A8[����A9�Ƚ�
eA;�:�A=g1G�g�A?*�Nb�A@|ܪ��4AAi�B��3AB\h8�g�ACT�m�fADQ�a�ͫAETn<�!/AF[�"��\AGg%���&AHv�Y�MAI��q��AJ��f�AK�ݸ�C	AL�r�3��AM�qK!�*AO�J�AP#?>�AP����AQP�}rMrAQ�tCAR���òAS$��L8�AS�ڽ](CATgPƠ�AUuʴAU�,N7AV\o��yAW$J��AW��suQAXf�X`AY�@z�ZAY�Q�DAZ�{:	�A[>�L        ?p��.�?��zA&�1?�)�2ֈ!?֒e+���?���>>�<?��g.�?��mNogS@�{�a>@	E���W@M�uAz&@w��$�<@$��!�@Y�Ϲ@"qG�w�@%>�@(�E9�
@,��É�@0��BL@2��/�j�@5����#�@8�7�K�@<�/��'@?�*dH�X@A����E@CԚj�c@F���@Hs�a��6@J��$j@M�YKڶA@PC�P\Z@Q�)`�@SV.Z`@T�W�J��@V�M���]@X�*^c�+@Zfb�-Y�@\]���c9@^j�|-�S@`F�س�@adLC���@b�|��w@c���o�@ei:��\@fR����4@g����q�@i��X�@j��y���@l�J�B@m���t{	@oD��0<@p{0&Rk@q[���=y@rD��_z�@s6'!�+@t06����@u3Tc��u@v?��\�@wV �WW@xv�[�@y�J.��<@z��f�X]@|{�BA�@}c��أ�        ?K�W�4:?�3a�b(?�����>�?�-a�K-	?��I�S�Q?����D�@'��zol@�-nf�o@�5MB/@#a ����@+�v����@3��ϫ�6@;���7�@C$_�(ˈ@J
w˓�@Qi����@V�ܶ~�@]�8T��@b��E7�>@gu����@l��Mm�@q���@u�1R@y�Q���@}kϠڝc@�%�
C�@�Վi��L@���~F�@��ߖ��@���m�/�@���g�4�@���WDZ@�e/4�@�v���։@��P���@��/7��@���yC�@��j@�X��@�4��9�@�.ھES8@�Jl��@���!�i?@��z�>v|@�5����@��^�m�@���G@�k�=��X@��A��C@��:Bv`5@�Xa��$@�'@����@�h��:@�v�*�@���hY#@����z@�Ʀ���@��:����@�30a��@�}���ű@�֧E�@�=�2�@ʳ� �ҏ        ?ez��:?�k�$J�r?�Y��ELc?֚~�S�/?�,�$D�?�`�E��;@��!2@�p�!@M��zM@"�h*0H@,C	 �ֽ@5�K:�@>�3�t�@F-�dV��@O���g o@V=$A@^�[q*�n@d��a@l*.T��@r���cK�@x�9�m��@�랚 @�G�@�@�7�hb@�C$�6F@�)�S��@�AF����@��|�,1�@��G)Z@@��\P{��@�#�^B�4@����	�@�D��)�@���ԛ@��=�I+@����H@��z�WS�@���b�@��C��@��x� �@��@��@�k:N-�@����[�5@̠�Hy��@ς� �I@�J�0'E@���9{`y@Ԫ��g�q@ց��f$@�tZ;�@ڂq�%@ܬ�x?$@��=��@�i���m@����mh@�?�E�@�-1��'@��T�p@���r@�'[�̣7@�̣�0��@�8���@�N�g{s        @+�&~��@cE ����@���.��y@�mƃ�@��OO�g�@�0��A%@��<���i@����oD@�|�+���@�{e���=@�B�t&W�@ݝ���@���@� �8���@������@���G�.�@��!��2@�{��&��@�{�;z@��1�%@��b����A ��z�A8��A�3@� �Al4&��APʰ�o�Ae��{��A�s,�^�A�pE9kAY�C�4�A;i ���A0m*�!�A7���SAQ	��A{$��<A Z�V�A!�?�T%cA"��߉��A#�s&��A%!�+u�5A&h7��$eA'����UA)k�v�A*r�z,�A+��_Q>�A-U��?HA.׼���A02�s7˂A1 �*��A1���Ŏ�A2��k�D�A3��PL�A4��:�l'A5u�=�A6tG���A7|���A8��7IjJA9�z��oA:� ��A<	���A=H���H�A>�����A?�$?��        ?��H���?�T��*?�+��sH�@��$T��@��\��@��o��@!A]���@'}L�:c&@.��f��9@3v��8@8��h.@=(q�C�@A^C���s@Df0b�@G�UE�#B@K,�{[�U@N�0\a�a@Qo�~/��@S��E���@U���<E@X���)@Z~ڜ�M�@]:����@_�=���@aC�V��@b��9���@d=����0@e��D�6@gvc�8�@i(�2q�@j�r-��@l��K|@n��h�H�@pB9�l�@q?�=�@rB��c�@sMT �?@t^���^�@uw�p ��@v��I<�@w� x"ڇ@x�(�`'�@z%h��.@{eE	8F@|��t�X@}��̼@Y՟w�@�_sb�%@�$�8ǡ@��( N��@��(���/@�Y?�w�@�#�`��#@�����@�ǿOk�@��dx�h@�}Z��E�@�^���Ħ@�C����u@�-*H�@���[P�@���~#@�rǸL        ?Z1�k)�?�V���O?�]_�6?׋@�2?�?�#���eD?�Aq����@5�$�@���J@��J'R{@!������@)U�
b+@2X
��@90Y�}}�@AY5�ϊN@G��;���@O|��N�%@T��%@[Pkʶ@ai�yb��@f)���|@k�h�E��@qkM=u,�@u�UaD��@zm�v9@�sf�|@�k�L*(d@�I���2#@���s�_v@�d`����@�@����@�x�?p�@����*�@����u@�:����w@��w#0˯@�OH|���@�4���Z�@�[U��@��5�w�@���ij�N@���Á( @��'{.�
@�&�+��@��^��@�=�+ f@��y+��@��x��@�Up'c7@��j�,�o@Ơ�$��@ȋߖkd-@ʔ����@̼VʛLE@�@pX*�@ж��`��@���M��b@�T���y9@Կ�o�8{@�>0�P� @��Ωr�@�xzRMw@�6_��@�
8�	:�        ?O�*ѽ?y0H��?C?��2�b�t?���-�/?Ŕ�h���?�����?�S��-9?��"wO@ .Bc�sc@k��.*@���T,�@"�ّ�@+��z��4@5ƀϮ@>��#`��@E� ��H�@N���gt@@T����Q@[�]�'�@bJ ^�bC@g��7�@n4���-�@s�G�<_@w���_�o@}5�QϏ@���W+x@�7>� �@�Fty*�@��F�N@�y��j�s@�N�!�F@�n��,��@���"()@����M�@�S>�ƴs@���LON�@���$E��@�bM��)@�9���@�긇,�[@�wo���@�����@��̨6=�@�~LV��@�V�-"S@�D��a@�I�3g��@�e�}}�q@���
T�-@��o��@�#�/q�@�br��[�@ĭ� �Gc@��v;�y@�l�j�ɞ@���V�q`@�b_X�@��̰�#@͑,LsB+@�>�&�C@�|��1@�bR��m@�Og	�X        @R����~@��b8�@���sS
@�2H���@�L��Qd@�>��#�@���i^.@�5�����@�x�9�@�Wʥ���@��4�I	}@���g��@�<�h۟@�8{�'��@�ng����@���jP��@��ۣ�{�A2��jBA?�ud�Ag�#a��A�L��iA
IJ7A�۟#.�A<�@�A��ݎAu��͂lA��^!��A�4l��lA<��JmKA��yA�2	UӂA�PI �A�fwrA KW�9oA!Ug���A"h��8A#�&-�hA$�L	�1)A%�V��(�A'�#�KA(Zy�U�A)�^B�Z�A+�k7�yA,m&��A-��u9	A/aU�Im�A0w{��u�A1E�� A2gKA2�ļ�j�A3�5�+�A4��@kčA5���F�A6�7�:��A7�@�	�A8���/�xA9�2S�0A:�,�A;�a���fA=@Eq��A>I��-iRA?~��A@]���@k        ?p�.Sa?�e���f�?�=sn�̝?��z8��?����]�g?��`�^	u@�q�5��@
(#�6i@|��wSp@��4��@N�y�)Y@!a!��~@$�ln~�7@(�<t���@-JX�f�@1��A��@3���P�O@6X�|��@9QP �=]@<�J����@?�'�)ks@A����@C�֞;�s@E�
/:�G@H�-��@Jnk���@L����@O�.�@QB����@R�V>9M4@Tb�j�wX@VV4Z@W��ր�@Y��ME�.@[��>`@]�4@`l�%�@a*8d�7�@b[��@c�࣮%a@d���@f5/�>Z�@g�6.� @i%l1�@jִGw@l
��61@m���m�@oS��B�T@p� T���@qw2��@ro"����@ssb��@t�v,k��@u��X��/@v�ݔ�ʌ@x����v@yQ�o�*@z�泭��@|w��A@}���'m@�O*@�Q�UD��@�&p�0E        ?U��Pp4�?�\򲊤�?�3��zg?ے�J���?����5��?�A���@�?�OcC@*P^��V@ϔru٤@D�`"�^@$q�ц��@,l��0�@3�����2@:㬙��@B4�G#�@HS���%x@P1�4��@T�)��9j@Z��k���@`��Gl�.@eB���y@i�Q"<�@o������@s	���R@v��uC@z�I�h4@��n@���w[5@�{%E�j@��5o��@�k7އ|,@�8��	�@�mS)��+@��_���@�{��{l@�Z�B��@�w��o]�@�j��I��@�:���t�@�-����@�C�j��X@�~�L�*�@�߯����@�f�n��@�
��j�\@�v����@��俩m�@����%@�7�
-Y@����Mo@��4~��@��Q�_:@�ʅ�#ի@��e��e}@����@�<�����@�s�~�@ĸz�\6�@�
�䓰�@�kC>Q7!@��ihlW@�W�,��@�� ���        ?B�Q=}1�?{�� l?����?����"T,?�?*r�f?��o�Ν,?�7��H�?�M�����@w$R�T$@]Ī[�@wW�1@(~C@Qԇ@3�0y@<���#�@ER\]\S@N��p�y�@U�&�ʵ�@]�D[�@c��%���@jl4i�@@q;b��@v&���@|	0�h�@����O%@��A~���@��F�6�@�4�[��.@�|��n|O@�<��!@�{��-��@�"#�A�f@��-�3"@������J@�_O�Z�@���`��@�Tq��mo@�}��Z��@�֢���J@�aIn���@��5��@�����@� P��)@����-Fg@æ�nf@Ř�(N�@ǫ1��b�@���#� @�:3�B�@θ�~��D@Ю��E�@��m��)@Ӑ�����@�!�&��@��/ZQ�[@؃��6)�@�W���@�A��)@�Du��E@�/��F�@�I���2@�pQ�4�O@���w/@��A��Q        @!���q1@`Y1(���@�&�BS2�@��7T�d@�F����@�FA<>y@���5@�ǀ��@ϼY#5�<@�[�c;@�Xe�pM@���,I@�d��� @垔wk��@���_�@���1ڐ@�o��C��@�M��@���_ʠ�@�u� 8!.@�0m���h@�&���3A /f�9��A�ɚ�}A�F~ӛkA�{*�YVA'��	A
�A3A&d�D��A�O_�Ai��1h�A�W��A���d	eAN~\�A�t�x_A�̢�dA��}bAU/��A �5��A!.���aA"S)�.p+A#�E��k�A$�{S
�A%���)�<A'M!��A(�~��A*�^��#A+}�|��A,�\����A.���`�A0���A0��ÀmA1�;U>�A2��A��(A3�d��f�A4�
o�A5�Q��rA6���ٍA7�W��-5A8�����A9�/~��A:����wwA<6��A�        ?��E����?����d?�<r�N@�e#��^@��a�z�@!�I�](�@*-�*�J:@1���$}�@7|v9Z@=��%��g@BW�sF��@F&� p��@JH_�N�J@N�Pۋ�r@Q��B�f@TA�9��M@V����@Y��G_�@\��@_�w���@a���{�@cO����<@e0�K6V�@g0��X	@iQB��)@k��9�Q\@m��\�F@p<j� :�@q����{k@r�Q��-@t]���+@u�^(mx@wf?����@x�9(�D�@z����H�@|T p4��@~X�Jv�@�VsJ��@��v�@��|�&�/@��5S��@�����@��51'�@���&`�z@�ЌC��A@�斖���@�U{z@�*�Z# @�X!�Ϛ�@����i-@��#�E$@��>f��@�6;��M@��+j��@��<�&v@�R�B�-r@��Yܦ@��7�@�@��t��v�@�ppˁϙ@�F3���>@�!� �0@��J�        ?��`(�b�?����J�]?��J"�Dw@K�!@�����@�����@%�"s@/�g��@6�����@>#��@D ���@J��D��x@Q���g�\@W)7�Ѡ5@^;(�.@c��Y���@i8���@pIn�@tS�68L�@you*�.@��S[f@�T<�#}�@�|��j>R@�H�9P�@����e@��{��~@���#�R�@��; �إ@��ܫ�@�sEA�a�@�4���@�B�=��@��[t�N�@�X	%�@��'�4�@��ዝ#@�c.�oR�@��,�a@�����@�=-#��@�A�nO�w@�+8_��@��n�H@�C'��q�@ɖA��X@�i��Q�@��� Y~�@��E�M�@�]M��N@��l&�{@�����8@מ��K@٘$��@ۯ��s8�@��*����@���&@�YOQ�#J@�#�p��@�La�!@�p[�L@��SF_@�PM��@�(�)s�        ?���)|��?��nu�5�@	`d#�@z�X�q@+��|�@5�����@>�9���[@D=|���F@I�G�_L@Oi��	P@R�� 5�i@Vj�N�t!@Z_4Z#@^���[�/@b+��g@d����F@hg�U��w@lc&���@p�]���@s,76%�I@vA�v���@y�5��@}�ne�J@�<�L�~�@��A*�}�@�Ɇ���6@��#��{@���^��@��R��@��9���@����,S@�2�!�p�@��\�@�.; ٪�@���
��&@��X�u�@�v��*�@��=�@���,��@��ܶ�Sr@�T�jqч@�صq��w@�<�)�0r@���0\��@��-�,�@�����c@���N7@��KJ��@�3�Lq�@��KA���@��fG2
@�P6�d@���x�q@�y�Ni@�k�n �@�d���3@�c36��@�ia�>;�@�w�K�@ǌĀ@�|@Ȫ���@@��6�D&@����        @o(/���N@����2b�@Ă�T,;@����4@�p/�Ѻ@������@�4���X�AvqA�A�7�+A��@��A9�,0A���߸pAy_cKªAn�V��A ��ʽG�A"�):�A%=���o�A'�ȏEu0A*
��J*�A,���	�jA/:��0A0��\r�A2mN��j�A3�&T��A5z��A7�6�~�A8Ȓ���A:��ddX'A<W=�NeA>6;� a>A@t����AA_%Ա�AB�w�XAC%3���AD9�����AEUT?y�*AFw��f�AG��9w�AH�r:�k�AJ		dk�AKHh�GAL���#<AM�t�X�AO4Emc�|API�DnE�AP��`>��AQ����4ARq���QAS2�~jRAS�u��iLAT���{;AU�C�P�AVb���QAW;��ąAX���}�AY A4�sAY�����AZ��9�|�A[��]���A\��W�VA]�YĠ��A^�AC���A`�Q
�        ?��!ڳ?�n%"�^�?���xʠ@	`iny^�@��w1�@#fJ�$�@,����K�@3��.4�@:E�CJ�@@�9A]@D�O97��@I�G�hN�@N���ȼ�@Rj���@U��r�;i@Ymm���@]��_�@aY��S�@c��v��@fL�k�*@iM�C��k@l�fb?@p�P�@q�Ht�@t�"�@vT���@x���>@{c���,@~7V�7[@��E8��@�@�&��@��8�@��TZ]	@��ͅWک@������@�@�?�@��w|W*o@��p#�@�T���@��Sj��R@��)E/�@��y��3�@��H��2�@�s�d��@�t�Y��@���7��@�f�6{�@��$�>�@����n��@�0����@�u����@���ja�@�^�g�@�����@����l!@�=�`֪@� ����@�jǾ`�H@�^�X5@�Y��f�e@�^X��H�@�k�3ۈ@��%��.�        ?�yĂ���?�}��>�@�i��F�@;���%@0N𜄱s@=����l@GkXޖ�s@Q�O}��@YhvK#<@a��%�*�@g�2G�T�@o�y9qV�@tcΝanv@yڶZ��w@�=�}��@��B��� @��&t�i�@����U�@��`�pg@��f�~��@�q�\P�@��,h)�@��y��K@�j�l���@��6��W@�`��@�2��2�@�E�~.��@��j���(@�����@���U�t�@���%��@���@�~�$�a@�.�;2<e@�
j7���@���!��@�GSJ�z�@����E@�G�T�@���|~@�C��-��@͜ ���f@��xL)�@�bl�o@��y�6�@�OfZ�A3@��,� �0@עEpH{@�v�C��<@�j��� q@݀�M�A�@߻ sOj�@��V��@�SVz�@�gk�+�@�#Ƥ�@�ǳ�Q@�F ɡ��@���vy�@�ѓ���@���d���@���'�XL        ?H~?���??���; |�?�F*20U?̄���?↭ ���?���W]d@2�%�@R�'��@#>Ĭ�Z@0;åsB@9��$R�L@CTc�a�5@K�	M��@S8����@Yޓ���@a�:�@f�ޑϛ@la�,��@q�����@vPU�q*@{Fx
 "�@��[�"�	@�_�*�U�@����r{@��j�[�@��p_�hl@�X�f.@��/�-E@�[�fU:@�.@C��@�u���a@�.;^ibX@��1�}%�@���]���@��[�\�~@��gH	�@��-	��?@�xd�x�@����<N@��d��@��}2��@�٠BX�@��@YfA�@�NU��r�@��z:v@�q��U�@�%��P�@Ѭ�@��@�O��"m)@�#d3�@��8�;@��X�[@������@�cbLR��@��hef�@�;��@���@�K��f�@崼��I@�el�L��@�1���@��_�@@�"#�62�        @Z+Y��X|@�0<���	@�4�r��@�Of��<�@��f�܎@������@��^�K�S@�El:0E�A���#}\A	��mAG����AXӰ%A���A1���aA�,�SţA"��M��A%e�J��A(�
�Ez?A+��I�>A/�b���A1�V����A4��8tA6U��{��A8ғ���!A;{��6�EA>S�٪�A@���e�1ABM�E &TAD��s�AE��v֩�AGֵp{�3AI�ad%AL)����AN��#��EAP�gZ�eAQ��þASQu��sAT�de�AVz�¿{AX7d�FGOAZ4mae�A\V;@�zA^u��A`&���)AaOr�t�Ab�Y���Ac�Đ{/aAe,I��*�Af���e<�Ah�=�Ai��(�AkL8��~�Am����An�->�PApVp�tAqN捏�ArQ�H��As^�~��\Atu���l�Au�|.�6Av�>�b�SAw��{mu�Ay4U���        ?��K���?�+�*ޘg@�w�2H�@����.�@*QCO���@4��ycj@>_=z�T@D�����D@KJ�\+@Q\�[��@U��E��@YA�\��@]��^P�@a`ę�B@c�Z�A0*@f����-@i���>	@l⋆b��@pB-NQ�@q� ���M@s��)ȩ�@u�����@w��y���@z�v�i�@|�G}�@B݀��@���|��@��a�{��@�;)G�@��.L��@��P��o�@��e�@��nTh�@����b�@�u/MR@�7u���@�l�*
�@���\���@���v��<@�O�|�"�@��gEx04@���-�@��ڹ�'�@� ����@����J||@�;�H+�@�\��k`@�5��:@�����@���(���@�鋕d/�@�����@��$jo>*@�ڿH�}�@���;�@������@��	;�@�%��4��@�J旴��@�x>�qv�@���sګ@��3j���@����)�m        ?�䏴i?�.��f�@ C���q@8�w��@K%�EF�@XwGh/�@c�sj���@m
>>�j&@t[��!+�@{q�K��>@����	��@��?V��!@��k��\k@�͆:;+@��Gwwk@����@�!K@�aw_�@������%@��0]��@���2+�E@��8#�Є@����!z@��Op�@��Pk��@���J@�@���Cws@������@��b��K�@�Q��K6X@��l��@�ϣ�ta@��R��@�+�u�[@�Y��@E@�]�0��@�/��} @ِ`ē�@�8)H�Q�@�<�m��@�YM\���@�T-YP�)@唼�`@�.q�@��ތ"=�@��({�@����]z@��݈@��%q9i@�	�V<�@�v��bo@�x9.#@��v�̺{A ޽s�AAf�$׬A I���A�CP�|DA`4OA	#vҀOA
�qAp;�AȜ��_LA��{���AFu6x        ?��~���?�:���8@�4�c�@!.�bw�@0>^�J�@:7%���@CQZ6c2�@K%�;/i@R�ͣ�n@Y~�����@ad��!�@g�ڏz�I@p���aB@u��O��@}����@�Eh� �@��l���@���1�Ĩ@���E@�����@�s6s�@�c� fL@���*�ݢ@��!�n�@�[��;�@�_��y|@�ݙ<krj@���k�;@�W�O[��@�Q�<;��@�r�
q@�]NK��@�La�s�@��nk��@ƻ�;g�@Ȭ��?b@ʱ�tI@��W7[�.@��&wP@П����q@��/A���@�	�1Z �@�R��|# @ի��Wc�@��O��@ؐ�g�7@� �;���@������@݅F�bQ�@�^(:z7k@��]�u@�>j�	@��B�:2N@� NZC��@�C����6@��S�P�@��A��@��FY'~@�=>�j@����c�@��s���@�r��$�1@�і
�A        @� S���@�9,�&@��:�`��@� n��/@�in�O''A"DL݌>A�8U�-�A�V,گ�A �:YUA%���LUA*Ep�.{>A/����A3�T��&A6�B��h�A:3��S6�A>,\�[�BAA6��_��AC|iZ�7pAE���>AHw��AK/�L�P`AN����AP�b�.�AR.Q��8AS�<��2�AU����AW��Fx7cAY�����A[�P��$�A]��D�M�A`%!5�_�AaZ���Ab���$v?Ac�7u9AeF|λ�Af�$���Ah�L^�zAi��Ku�Ak4����Al�4\d�-An=�ᚶnAo�>_��wAp�����SAq���GAr[)�F%�As/Q3�At�Č[�Atۍ:uXAu������Av��3��Awgo��wtAxC���?Ay ��*�Ay����sAz޵�y��A{��y	�=A|�C,��A}�# �>�A~u�`��Ab��2_sA�)S�~�A��RG��\A�uY��        ?�֩�T�?�
>��?ޏ-��?�*���@ �ȡ�o@
�U*v5�@G��L7�@X[��@!=1~P@�@%��Bߌ@+�fd@�@0cD5��@3��.�@7���s@;f,T&i@?P�r��Y@B�;�)@D���ш�@Gm���@J�$m�@M�J��5@P�s4mWs@R���ai@T�Y!��@WQ���@Y}m��1@\L)��@^Щ��h@`ܓ�p��@be�[{�@dX�(�@e�����W@g��W�@i\j�AL@kM=���{@mQ\�C�b@og�3�N@p� (�4U@q�ݒ/�k@s	��)8@t7gn(@um9�,��@v��6�#@w��ܗ�@yKZj)u@z�	��:5@|+�Q��@}�0���9@[�?�S�@���tXx@�q!��/v@�d]�S�@�dmHF��@�rR�ԥ�@��r�*,@����@��g/�$O@�F �($�@�����7@�E�\@����a@�)�װ@�gpO�        ?;�Č�?z�!�Z]?��բ&��?�`�Wey?��ce,H�?�C��/:�?�<>��?�vm�p��@*{�Ds%@2���@#����@.U��mA�@7j�gV?�@A�&��yH@I��M&@Rf-���@Y�4k��@a��R9M@g�� ���@o�j��@t$�!dھ@y�q�#@�0q���B@�+`�]@��QB��@��+���{@��ݸi@�n�A�4�@�DPҏ�@���� ��@�<�45@��`m ǋ@�}�(�Iw@���H"@��%@���@�&V�:f�@��'�@�W1�1v@�$��&3@�e�*��@��B��]l@�M��@o@��s�x�@�a�����@�����L�@�f��C�@����@Ǻ5�/�M@ɂWB>�o@�_dE��@�Q�tQ��@�Y��('@л�&�θ@��+�r	�@���]a
:@�,@ϮÑ@�hJ j,@֯�=���@��mmH@�azΦ�A@����R8@�B*J��@��K�b�B        ?c�s����?�m(S�n?�۠ۂ�j?�pql�x�?�����B?� 5�$,�?��z8�&�@
��l/@\5���	@#���M@0o1�K@:=�Z�H0@DD�Ҵه@NR��S�@V�����@_<ЁW@ecQ��8�@l��%@r��=)@x����=L@C�C�|w@��W%,Ũ@�H�o�u@���牔@�����@��ݤO�@��9�j$�@��p��&@��C=�V@�L�ԋ-.@�[I���@��� u�L@�\�Zz��@�*����}@�RG���@��(jТ@�(��f@��%���J@��_��@�o'Gu)�@�����h@��Ơn�@���v\@�Ļ�p)�@��D�JL@�'���
?@Ί&EQ@І���$@��y��@�@�=$�@Բ�_G@�8(Ez�@�Ϟ��w@�x[�o��@�2H=�9�@��A:�L@��[��@�b�V���@�ac�R`@�h$e��@�w
>`�`@����@�'Gv�        @RίJ���@��L9Rl@�����@���Ts�@����A@��$��|H@����m5�@���� �@깕8ۑN@�nń a�@��qA��@�]���@�E���C�@����<B�A�N��A����A=$�D�A
gB��{A+&C��NA4p�D]A�⇆A�qv�tA��4�FA�HUX�rA�-��jA�TN7��A)�]:A G�(.A!����}�A"�Y��IUA$>!�_"�A%�3C�JA';���V�A(�"sI�#A*�?�*sA,Ko��:A.!.���A0�1sA1�1��A2�6�A3,�{��A43�e��RA5Y[�ͲA6�\):A7�_0�-�A9>_U��A:���oA<Dn;bA=�n,!A?=B��A@~�Ͽ�AAk>{m�ABdZ
uACj-�AD}ǧ�LPAE�?�9AFΏ�$�AH��2
iAIVc��AJ���B��AL|�"p]AM�����AOq�
��        ?�	qB���?����Ø|@5;�7:�@�+�a�@$���}@/��)2�h@6\v���@=�t�	b+@C?}މ�#@He��K@Mv5`>%�@Q�u�k;�@U�X*�&@X�c*O��@\�gbE@`�l��[�@c?����@e�� �#,@h�DM��@k��}�`@n�t)�vp@q8)�z.@sv5΃�@u!��@w&	�Ӆ�@y\�)\�P@{�W�2u�@~)P#ٳ�@�_dà��@���eA�]@�#K���@����U��@�"h)@��F��>�@�TF�k�@����(�@������j@�nDH�@�俋3�@� �H�!@���/���@��0`.+�@��~w/�@�����@��ĸ��1@��Ā�@����Jo@��q�H`*@�����Y~@��|�@�j�K�@�)����@�M�Q�<�@�w�"�1@�S�m�4;@���7E�g@�����
@�.�7(�y@��8��|@�{�`x@�%NN@����u��@��!W�        ?�)��3e?�uV��?�"�D���@��Q;�@���)N@ ) ���@(�~��@1d���@7sřuA�@>��5[��@C��ՙ�6@H�y7�l�@O~��@Sb�A0��@X#h��,@^ ���@b�^�ʱ@g�YJ�@l�,,�@q�ɽPqr@u��p@z�]}��#@�@����@��*�D�@��)�Ɖ@��{]�>�@�8��ҟ�@�����@�O�f�6@���Nd�@�΀2!�@���%"@�����N/@�T�=@�K���	�@�[[�>R�@��X5HI@��PN!@�~��E��@�Ų�i@�.r�}�@�$щ?3�@�H��e�@Ɯ��k��@�#�.I�@����g@������@�6�4��@ҼA$͞�@ԕ2�T@֐ �i@خ����@���n��@�]9*�@��f�}A@�VaZ�G@��YU�w@�T���ku@�� #��@�Q`ǌg@���O}@�k�Y���@�o�,��3        ?tབྷ�q�?�C>cr�?���p|?�C����?�8���_?���Bg˪@�l����@��NU�@�ȿj�E@��j���@#Ь�i�@+���i
�@3�&�M��@;L�30@B�N���@I�|�Oø@Q���	z@V��%}�R@]e�O��@b�C��@g�n��/*@n�ie2�@r�'g�_b@v�\�	�D@{�cg�@��-�<�@��~{"��@���dӞ�@���P�@�5��i��@��|�@���]�W�@�����)�@���gO�g@�3?��?@�TȨ��@��4�
�*@�,�����@��J/�K�@��)��|@����@���r	7�@����x�)@�vpA��O@��Yg�a`@���D�[@���y��@��]�F5@���L���@���� 4P@�j�=F8@��݆k~�@Ɩ�����@�M�b�5�@�����@��flP@�ؑ��@���=_@�)W0'jH@�Qm����@Ӈ����(@��V�	�S@��P�         @w�1��@��=D��@�;��}��@״
_E�@�b��]�P@��H	>:@�o�E��A ���*A�?H֊�A^��'��A��5��Aj�1<��A_F�R��AǙ��E�A �*ي�A#�Q���^A&�����A)����nA-j�˧�A0��PE�A2��Un�nA5W��A7o�?��3A:���A<�E��=
A?��&�70AA���%ACE�w��AE!H-���AGg��8AI@����AK���ͷ`AM��Z
�gAPD�3j��AQ��@G�4AS٤��AT����ޮAV7I��KAW�=��nAY���#|
A[��j/�A]��L��A_��38�A`ڛ�P�GAa��TAc%p���_Ad^<�\�,Ae�K���Af�̚74cAhX��j�Aiǈ��AkC�W�aAl�de3��AndU�\�Ap8sx�Ap��`���Aq��N�u�Ar��Zk�As��-��At��noAuy䟜�Avy�5p��Aw� �%        ?wt'ÓQ7?�����?�p��[?�f��:d?�MW�g�@NQ�P�@	y���N�@��n�@R<��@dj�Ж�@"2�Jj��@&p��}(@*Fq��@.�-I��@1���B	@4���C��@7Y�b�I@:]t	q�"@=����%�@@�5ְM�@BQg�v�@D>�����@FJ�+b�@Ht]E��J@J��G�l�@M.�\G��@O�F@Q>���R�@R��>׹@T8%x�_�@U�=��!c@W����@YS���e�@[6�4�;f@]2�H�˚@_J*��@`��{6�B@a���x@c ?����@di�Rb��@eľ:���@g2U)��@h�H�nf@jHZ�7��@k�I��UF@m����'�@o��¬q�@p����M�@q�x��*@r����|@s���*�@u��$@vM�1�]e@w��M[+�@x����AB@zS�ٵ��@{�w�-@}Qo9�k?@~�hr4@�H(�3@�#�l'"$@��	Y;@��H6��        ?hDӈ:_?��dm��,?ҽ�=�?�_D��?��Cds@������@�fBD�@#�պ��0@-��@�Sj@5�!o��B@?ﰣ��@F��{B�@PZS�^�@Wv�wP;@`	ܷ��@f� ǋ�@m�HdM�@t1@#@z���5�@�N��&�@�N��$6@�e��<�@����C�@�<�M@�b2@��@���|�@�)�v�NK@�#A[��s@��s���@�ߩ{�W@���z@���28�@�f՗���@�@�H�45@�:�iu@Ã�kڝ�@���q�|@ȥ��ay$@ˀpV;�@΋yi��@��&㩱s@қRfB��@�kATҘ~@�S�ei~@�Ud.P@�o����@ܢ��W@��K�?��@�t��d�@��A8���@�3�k*��@䋸(n�@����S@�b�#cE�@���-��v@�n����g@��d7�@��"N�m�@�g����@�fը�8@���@�rWB�t@�l.ω��        ?h��S�='?�� 4�\?�u�w3j#?؎�,�B?��8�)�?��8|�r@I%e=@��1s�S@TF2o�@!Us���@*�q�e�@4`3�j��@>��,�#@F�[G=q@P?��%��@V�S��]Y@_˚C��@e�?���-@l˷MVN{@r�]C��@x`�}��+@!���@�xP��@�!��[v@��K��,�@��;zi�@�r�W"f@�r��:l�@��YBHY�@�o�ʖ��@�)�h�t�@�$U����@�a&���@��痚��@��o�Vm@�Հq{Yp@���.Y
1@�ADΧ�[@���<�@�1>�T�@�٫m�Z�@���E�'2@�D3�Ur�@�Ɩ�o�@�W��{3@���M�@ȣn6��@�]�b�+�@�%PB2A@��#X;��@��>�&t@�����[@��{gPs�@���i�@����P��@�
��n�d@�%ȴ2�S@�Ht�v��@�r�����@٤M��Jn@��x�KKY@��D�@�fc��        @3�Ѣ�&�@p�Nau@�5+;ƃ@���8���@���Bw`�@�n�E:�@��^M@�|j��i@���B�s�@�	΄7�@�\���@�=͒�@�P��h@��{���@�E��?��@���E�'@�e���nA)����^AA�����A{�١�A֗�\j�A
U!9Ui]A�`�(��A�)Opv�AU;��M�A޶����A|j��^A.]:SaA���}�A�	�0�A¯�*�UA�c��UA�@R�ɏA!t��0A"9��X�fA#q�y3BA$�.�$iA&��A'|(ρAA(�Z�F�lA*��T*7A,.�&�A-�,�6�A/�rj@�A0�)Q�A1ˡFVهA2Բ�d
�A3顪=s�A5
�sU�hA68��&`A7s�;H�A8�6vF�A:�4xU�A;x$kZ�$A<�q���A>pCz*�#A@�B��A@����؆AA�
�"D:AB���&�ACy��{>ADk2a� AEcو^�        ?�5���l?�ŢЍC�?�.p1�?�H��1݃?�8�E@U��eN�@�71o�@p���\�@��x-�@#z�O��"@(��¯�@-�R��:@1;��$�@43iÎ˧@7o�+�w�@:�5A @~@>�iNӁA@A�I�1�@C�͸�7@Fcmj#@I*��֣*@L3m3�m�@O����[@Q�x�4W�@S|7��d�@U����8@W�J��V\@Z>,�J)*@\�����@_��g��s@aC��B�@b�!�B�@d}Kr�6}@f?��;�.@h��]��@j7ɢ�:@l#��'�D@nR$*O�8@pN�x�@q�%�;1�@r�5�zĕ@t�[H�@u��h��	@v��4Q�4@x�����G@z v���@{��O��@}����._@Q���@���ߖ+@��2*f�@���\'�@���E�^c@��W)�:@��u��n�@����4��@���x��@�Go�Z�@����.L@�����6�@�
g^#R@�Z�A�@���~t�        ?=�Q��3?y��hz��?��U9S?���H��?�l��䘤?�sgB?��;�ij?�/��@����)@��2k��@ hy�qt�@)�^��@3���80_@<�7w��@D��H*~�@L�鹞�@S]V|L@Y�[)��@`��]�@e]5x{U-@j�qf��@p�(<��@t�[����@y*B]��?@~]�@���@�)\]6w�@���"g�@�b����@��5�c<@�As�Hx$@��K�?�E@��w���@�2�0MǦ@��<e��@���>8�@��u�|�@�m۲�[�@��fR@�ΟI
�@��󟥃�@���]�b@�R�9��X@�8�!v@�B:����@�p/��b�@���@gE@�?ST�07@��-&�@�X�+��{@��m @�h���3@�1�=%�@��$܍y@ɮ�vG��@ˢ��߹@Ͱ����f@��lS7@��Z���@�?l_��B@�~x�'��@�̃�@�)� G@חFh�$�        ?�WG���?�.�̾*?�Z\:��?��ͬ�CL@߈����@��b���@F5����@%fO2��"@.=��}@4�i�!V�@;��uU�@B_�9!��@H���f@O:O�@T�k?�t@Yq)A��m@`
��@c�a�ަ@h���.S�@n:ŉ�'�@rbZ�:�9@v1�o^�`@z����b@�]�z��@�����my@��uZ��@��4�(�j@��\�5@�S�HD�g@��(N��@��9g�@@�#�~X�@��ro��@��%�g@�
��9l�@�p4Թ1�@��e_�N@��� @�
�"�� @����\�@���쿢@��<֛�[@��%�#�@���8�,�@�y�l�<G@�$��@L@��yW�e�@�)����@ê��)�D@�iB E`@�E';�}R@�?��$У@�Z!�A0�@͕�#�@��U�G",@�;j4UP�@ҏc#yW�@����~z�@�rG) w�@��kGW�@ب��C@�cd���l@�5�w�        @@x���96@|I�6jU@����oq@�����{@�)ћe:�@���Ԕ�@Դ�4 A@ܛ��?|@��}�W�@� C6 -�@��~����@�p�[�*@��3j3�t@������@��6Q	�AP���}uA�橏p�A��0��A	�x�Ca�AK�Z��eA�#D�?GA��W���A�6T�7�A��K�A�fcM��AW��:AB���&A!0����A"��ݢv�A$��_A&�	�8DA(�*B㲘A*��C2݇A,�S���A/A�ƹ(�A0�rY۾�A2.?y"�A3����A4��WXA6��Klf\A8�B��A9��V��A;y,���1A=G X��A?(�Tb��A@�+I&A�AA�u��1JAB�a_8��AC�$ⳐaAD����P:AF��9�AGR:a�}�AH��GAI�_*�AKI�96��AL��{��aAN$���0$AO��q{�AP���)c�AQ^mwAR-��2)AS�H�<AS݊�)�        ?o$�)�Š?�&��q|?�`��V�?����J�R?�l�v*G?�1�"��?��V��)�@�KF�X@��i�@Ee:d*�@v�Z���@�զs@<�c�@"m����!@%��aW��@(�4��0@,�Bף��@0a3Ш�@2��IQ��@5�5�O�@7�B-�4@:��J��v@=��
��@@�U;	�@Bc(@�ɞ@DY�2�پ@Fv��Ѫ@H�G�-�@K0�RH�Y@M���,x@PV�%Gȍ@Q�Wf�m@S��h�0@UP�`� �@W;����@YH�f��@[x��d8@]ȻՌ�@`Q�̘�@af�0�Q@b�:]���@d,�Қz�@e�Pȕ�/@g7]�ۃ@h�����"@j�q휔z@lIp2�@n��ҥM@p �4uQH@p�
�R��@r ��@s�j۽�@t"�@uA���@viz�~/r@w�=�VD@x��(��s@zZxx9@{a��_��@|��W���@~���u@y[�|G>@�tg�A�        ?;m�7x?�ք�?�L�bw?�,%�1-?ؖCL�CB?�p�ӹ?�l��]X@�QbH�a@����)�@S��#F|@'jhfʷ@2.�?}?b@;�\�S�@D���Q\@MWQ�\�x@T\T0���@[{*,��@b���OJ@gGI؆;@m`J].{@r7n�!�@v@�Y�|b@z��'��@�8M��>@�ە��@�)�b\6@��!K�^@��x���c@���ͺ�@�]��U�^@���m@������@�6�~�(3@���%%gF@���hOf@�I8�'@�]�$2��@��-N@��*����@��)��o�@�G�j2@��$.m�O@�Ч�Fz @���p`{�@�.��'�;@��2��*@�;��P@��Ҭ؅@��㽙@Û��X��@�N�N�@��ֺ@�	�5)f@�H]�@�;w��@σO���@��ܤ���@�:��7�@Ӑ�GF�'@��A��@i@�q����@����u9s@ٚ�Ա�        ?c�Pѣ�?�р�@�?��d����?��`#n?��:�:�R?����~*?���@m.��@KQ~�g@h�Z9�R@'0ΆD�d@1��~XF@:յ$�N�@C�%NPo@K�=�T?@Sp�c�8@Zf�[���@a�x�`;@f�z��@m;��,��@rcs�<R@v��U��#@{�F�q�N@��ߍ���@�ɂڷr@���ۗ<�@��1��/2@�7k���@�����C@���^Th@��� ���@��R��
�@����`�@���P��@��X;`@�P"��#@�ޡ�-j@���!E@���f�*@��Fѹ)�@��j�$�@�p��J�@�a�C�h@�o�"�1�@������G@��Qde�@�L�����@���bI�@�=h�6��@á�*��@�&(X	�@ƞ�l%@�9Sm��@��рp�@˨���@�~���@�iƱ�u�@д��-#�@ѿai#@�Ә����@��$�V+@�[C��@�K�i�ț        @&��~��@b
e�ɾ@�y~�=!�@�
n�@�L�C�X@�iܿ�;@������@�*����S@�mg��ɱ@�AĎs@�55���9@ؑٻ(��@�]c�k�@�TVY&@�Hђ��@�AM�d@�`����@�s��Y@�/u��@��55@���.=@��l�.ɬ@�v �LA"3��`VA1}���bAjǝM�!A�v�HD*A
ec ʅ1A,�:r��A8�x�XA�K�� Am7�V�:AL5���DAQ��SA����	A���&�@A]+h}�hA ��=�A!�u��TtA#x�]�9A%�����A&�8�ߍ�A(�>��FA*t�����A,r�����A.�A7kA0^>�N��A1���=��A2������A3���)8�A5H7�.�uA6���r�A8�2�t�A9�&b:A;���A<��Sc~A>6�br)A?�`�O��A@��ְ,,AA�	A��AB�Q��-AC�֦��)AD���;�z        ?�5��֑�?Ɍ�v�?�ט_&n�?��hCY��@SC�G��@�N(���@"0`֚|�@)!Y�+Y�@0�$�@51Elw@:Ԟ��@?�SN��@B�h�>�@F�ۨ{b@I�����*@MXU�^�@P�u��@R�(�ec�@U'����9@W���ŗM@Z.y�P�0@\�����@_�.�^ɵ@an�)SU�@c�3��&@d�M�[�h@f��h�@h���sn@j� �F0@l��K�@oc�W�g[@qF>�J@rk��ˆ[@s�G�t�@u~p ���@w'�h�D@@x�h��!@z�_����@|�l�_3)@~��![�@�Sh��s�@�eM���@����`�V@���E �@����[˾@����@�\Q�f\@���7y��@������@��P�`S�@����Q?�@���5aJ@����f�@��-'[i�@��mĘY�@��`����@�k�1�@�R ���5@�=ť��@�/1�� �@�&*��]1@�"�Sp��@�$1����        ?�&���?�����?��7�'�m@ �e�j@Z8{}Y�@��5"@(����o�@2���?�@:�h�'�@C3��ZO@J�^����@R��9�@Y�	W*n�@a7}L��?@f�o�j@n�-�D@s�u6��@x�Qµu�@eR�d�Y@��>QD#2@��P�@�=�Չ�@���Y�A@�jj��@���W��@�2K�ToX@�������@������@�o�2�ҏ@��ǟ��@��`�*�@�$(�H�I@����Om@���捼�@�	��.@�9��zuI@���k�J@��\>��H@���۞\@�5�V@����@� SU3�@Œ�]H�@�:~اD@��z7<�@�ϵ��Qg@̿�| ��@����}F�@�x'��Є@љ��_@���+��?@�ad,��@�\&���@ֽ��1�@�0��dg@ٳ�M�f|@�I��GXD@��Ï��Y@ެq��6@�=�kV`@�-�U���@�'�.7�@�,
����        ?w�kX�)�?�.�|K??�9�v��?�Q�OE@ ���@��_z�@��)ݕ�@!x�v��@)8RK	k�@2v%Y,qN@:����@C~�	ӳ@K�[hW@S��r�Q@[e�{r�@b���G�6@h�i�#z@pF��j�@t��A��@zJ�9�@�HW�:�8@���E��=@��~ο@���^U��@�иi�\u@��naf@��ܺRDm@�XO�h��@�4��X�@�8"h�B�@���L5�@�
��T�@��$��6�@��� Ċ�@��ږ	�@������@��έt:�@��[��9@���C�@�{BN�@�tW>��@���s��@�F�k�R@��F�g�@�"<���>@į5��i@�Q��Z�@�
I��-&@��\ĳk�@˿rz�x@ͽ{�#@���2�<?@� ��wt>@�$�m���@�V��'@ԕ��K��@��-�|�@�@�x��@حVG��@�*~�^��@۸�e�Su@�Y#G�@�#���y        @Q>��1�@�k�Wڹ@�o����m@��8PY��@�3���.V@��;�ݏ�@�84+j�f@����9@�Zį�w�@���G���A k@�iA�|�f��A^���]dA���c=AX��?`Az��6�A#�>�A %ȕ��A_�5�AZ��ՋA �'�x��A"�|Ӻ�SA$�:KFA&�徴�bA)\�D�A+k��ѿA-�U�A0L�S��A1���p��A3A"c{��A4���VA6�E.�xWA8v�F"D�A:ls�~��A<���^`A>�m����A@�a���AA�׿�zAC��̊�AD`�iF�AE�E3T�AGHjm=AH�ד�'BAJtoγ��AL$e�% �AM���AO�K@��AP����'�AQ���gd�AR��\���AS�w x%AT���(��AV$�isP�AWT--	�AX���X��AY�\&�A['��f@+A\�0.�#�A]������A_g9D�[rA`tbG�~�Aa:p\27nAbvH�(�        ?����@?ә8�J�l?�!�s"H@�rV��@�UK޷N@��ު�@&�a�4-,@/dL�j��@4�N}��@9�/Z�@?�����@C:���0@Fò{�,@J�QPr1�@N�����w@Q{�p�u�@S���P��@V4<�_�@X��U�.�@[l2JNxu@^6Β�@`���9H@b�2`@c�	�v�@eH���e�@f���@hǀ�4��@j�u>ZsI@l�=� c+@n�~3w�@p]Z�-@qw%��@r����Q@s�6���@u�j@vN��䪅@w�8_��@y3by@zo�t��7@{�,�f�@}x!�U��@����@�a;�f�@�@��,q/@�*MR��@� C�r@��i���@�$�Ad@�9�~Kg�@�[�3��@���� �g@��g��@�iK�Օ@�e�M�\�@����nߩ@�<�g��M@�_��^�@�)�c��\@���l��@�ױ��f�@��D~�U@���
�t@��_�P��        ?;l-]�h�?x`t�	�
?��g��?����?Վ�F�,?�o5D���@�c�n1*@��4�n�@#n��S0@1��,��J@=��i'�@G�TR*��@Q�uE���@Y�l%[��@a���L�t@g���N�@oKf/N:@s�9��)�@x�hr�c@~��E�@����	;@�Cc_�GL@�a�h��R@��ª���@���p@��4W��:@��G��;n@�;͒�.�@�����@�e���7@���~ǐ@��q�z�@�6��@��P���"@��I��@�?
���m@�̅oF�@�qLĺY#@�.(�`6�@��'5�@��x��p@���aI/@�$:��+�@�gpE�@��`��"Q@�$�yd�@�u>��u@�֭��@�I����@�Φ��V@�fs��@����m@�д�̃r@ΤS�
P.@�F�����@�E�B쮡@�O�&�<�@�e�;�h@Ԇ��GI@ճ�{��s@����
l@�1�i$�F@ك|_mJ        ?�=d�npu?É����?�4:07?�`F3͠�@	��ľ0�@��7}��@ �V��M�@(��+�@1�,@��,@95��8�c@A�si9�@IMjwy@Q޽���@Y��u��@a�t[N>@h1�p���@p�g��{@v9f;�~@}�e2�J�@�R����m@����SE@�˒�E`u@���h�A�@������@�t� B�@�w��;�D@�'��.�@�M �YT�@����i�@��:D(@��7��u�@��&�/~@��eН@�����'�@�����@�]��!�@�a4�@�1��D�@�g��%�@˳m*0�r@�NFX�@�C�#Tw@чQ2O5@����D@�,����@Վd�h�q@��ϥ娮@�r=0��@��7�ſ&@ۄd�6z1@� ��E#�@��hd9�@�Ax��ݭ@�%�'��@��.@mA@���wF@��l�S@���)@�J�jv@�8�����@�^��8�w@�P>���@��GjH?        @X\�*o8@�{����@��W��@�������@��f�qD�@�lA]"e@歙-�6�@����Qn@�N�{�@�iOu��@�I�7q#JA��7PA]�;��A
!�9 (AA'JûMA6x8�OAy�6Aۖ�ߚA^���A�|Lq�A�S���A XB���TA!�b��%A#vb��A%!��UA&���{w\A(�s�O�A*���RyaA,����A.���(E_A0lPA�e\A1������A2�r��u�A3�D]oA53�7�A6�P���A7��*i��A9M��8�vA:�(1
A<R�ՐZ�A=��'^�A?�T���A@��"Y�AA��@�AB�83ƎAC��%t� AD�we>�AE�6j,o�AF�p��s�AHly�YAI]IBiQpAJ����AL�)`+AM|⑹��AN�t��JgAPB���.AQ߂�{SAQ��N	��AR�ّVHAS�&o��AT��]JJ.AU��5&�AV�H6Q�q        ?�o��?@!6ғ�@8$g"�@H��6��@S��҅c@]ϐ-V�Q@dȌ�ۊ@k��oM�1@q����x
@u��P�%@z��]#��@�`��͆@��VD�U�@��^,ꐼ@������@�Rܩ�2@���X8Hr@��Bܕg�@���W�@�����S@�含��@�)hkt@�_�zd��@��?}��@��x�+�v@���Cj�@�%�f/�@�{�V@�\@���|6P<@�C%Δ[@�����@�,�<��@��2O�!N@�4f8���@���~�5@�*jBf��@���6��@��	I�@���\�R@�h}B0+@�=o�
�@�H�A�@��3)�~@��T��*@����@�{^P�q�@�YFK=�3@�8���b-@���'��@��0-��@��7�t��@���S"�@��M3�(@����O4;@�Lt�*�@��K��x)@�D�P�v@���n��@�Cqb�@��ȀV�@�J���K@��gBM_�@�ZjM6�        @ �9'�h]@0%%5�KD@IE:
���@Z�fP�:G@g1�]�@q�Dn��@yǺ>p�A@��,?�f@���_�@�z��&1@�o*�d8K@��pQ��@��K��y@��|����@��<�4�@����r�@�*l9K&�@��c�ZIi@�r�T<�@��w��#@�e�_#]@������@���Y�V6@�@����@�-Q܂�@�kc��#@����LBq@�����@��o"��@�XJFC�e@��2��q�@�Z�2��_@�"u�]5@���#H3@�g����@��n�42@�q�����@�.�ݽf@��?y@�(N��+�@껠���@�K��� Q@�����@�[@����@�ks�c�u@�$d�b�4@����@�	�t@�./Q�b�@��T|g��@�l:ʯ@���m�\@������o@�����@���E�@�k���@���_�K@�-;�*@�rT���@��oV�@�Nb�3��@��j�S��@�+�����        ?�^����?�TVy%�o?��=r�?��f�>/@s,u�}e@\�e���@%)�a��@/��t�
@6Ͻ@�>�@?�E撆�@F��W�@NC�|u@T[(
�\�@[RN�?p�@b-�)��7@g�h�s�@oFmng+�@t.�����@y��7ҋ�@�9����@�4º{@�۔_g(�@�:����M@�-q�N��@���?�@�~��-
�@�ȑ�ib@�B:嶆g@��	~�:�@�����`@��:��]�@�.qV��
@�jn ��@�bKӖ�@�����@��8/�@�-w1��@���7/�@�w�
\i5@��3�qr�@�0����@�ɐ����@�w&�}�@�9��z1@�^�D�@� 7��y@���.�@� �����@Щ�2�o@�ϗR��@�����`@�@8RMq@Ջq��@���}�J�@�IC��-@ټ ��={@�<w�g�e@��Vt�o�@�e�X�[@�D���@��Q��
;@���W�Ar@���]R        @�R��8F�@����KQiA��|�	2A%q2��A2gS�dA;u�JP*AB���S�AI
�&�AO��h@L8AS��4�AWބ���A\M�!��PA`���t�Ac
��MWLAe�g�T%�Ah�Ρĺ�Akx���An��z
Ap�G"8��Ar����SAtVݓʮ�Av)r*���Ax����Az����A|^�wq�A~%q��I%A�)�D��A�H���}GA�q�?P[A��9+��A������A�$����A�q�A�tA��Ef0�mA�#�9 w�A���� /�A��Q/c�A�a�6���A�װCC�A�����aA�jA�f�A�-#�
}A��Ö�A���Y�hA����8��A�R�y/j�A�#.���A��eo�[A��ܡ��-A���o�&A���%\AxA�f�v=*�A�M!�`KA�8��M�jA�)<i)zA��ME�A��爙�A��cؐA��F�/�A�`�Y�1A��`��6�A�1@E�A�����A        ?���}D?֜i;Ϭ?�sa��Y�@���MP@n��9�@"5��3U@*���|�@2��~4q^@8�'���@?�h�tVO@C�l��L�@Gʘ��5|@LRD7���@P����D�@S9���@VUk1s@Yb�Sɜ@\+W���@_�o���@a��i�@cfek-�@e_\��-�@gt��c�@i��"�0_@k���d�@nd�YTj{@py��֏@q�N�E��@s9-�UH@t����M@v;e��3@w�b����@y�X<δ@{M��@},oЉ�"@%���|@�����t�@��?��&a@�����@�d �F@�S�>uݦ@��k}t�>@� ѡ�Ku@�kʐ��U@��YQ�@�jq�q@��;�1
@���:@��Xr�l@���c?u@�k��>��@�X�+,!@�Ljĸ�@�G&.C:�@�H�m{:�@�PC׌�@�^W�&@�qL#��@��z���@��]�S@��_�!�@��+�@�����        ?�=�jb�?�1!�	�L@
��]#��@!�{즞7@1P�H$�@<Vw�i�@DÖ���F@LakʌÚ@R�b��@W�/�C)@]Y�����@b�ý[�@f+�$ <�@k1���V@p��  �@t�	G\H@x����@}�;�H^�@�����9@�����@�{�m�	�@���dt@��N_ZM@�җ�K!�@�̀�@�	M�_@�޶~~�@�l�W�@���C�@�؈�S�@�8��."@��ڒ��?@��-]9�@��bl�>:@�=:Z��3@��F�_�s@��q��@��V���&@�U�Z�m�@�p�͠�@�髂��k@��^Ř�@Ѷ���@ӈ}J�Qp@�}o��U@ח,�y��@�׆���Y@�@Z��6@�ӕc�@�ɚb��M@�@�:�Q�@����1�@�xf���@�;@���@�s�eg�@��ٳ^L@�+����>@�a��t�@�� pX�J@�'}@�_/y�@��$�$�@�#�@?Q�        ?�S��O�@��kV@$N��k۶@30	��@?/H�;�6@G8��u.n@PC�Y"�@U�MV0��@\�%$��@b����@g�cM&@no���tW@st~DOiK@xۅ�"!@�Ɨ�Y7@�%�m?[@�v8׈b�@����:�@��G��v@�u�~l��@�ג�V=@�	a���@��?>�y�@���`�7@�D1Ñ#�@��_�6��@�����@��8���@�b���e@�Q���4@�Ґ�K�@�14�LA�@�ǵ5��@ə�'�@̨C��N�@��x8�a@��l&���@ӴUb)ʖ@�Ǫ�G=@�0Nv@�e��r|�@��GcbH�@߯ʹ��@�M:�J�P@��=g$"�@����@�E�m1��@�$�Un�%@� � ��@�:���@�sO�i�c@�e�H���@�*��I�@�����@�L���k@��M�VDu@�={P�^f@��?��'@�wx���@�1j����@���G�"@��w^^�A �����        @����F@�=��T�@Ƶb��B6@ڰD�P�I@�ݪ��@�Nq�zh@�I�P��cA �)rnA
3@�p��A�tV� �AQ_��Ay6��BAf�A �~țA#�����A&�b"wW�A)g�EA-4!6��A0x�m�A2~7�0�A4����wJA7���D�A9��S�A<p;��A?v�EV�~AA]�A���AC!4�{�~AE@�u�|AG��&��AI7�Ƅ �AK��/��qAM��C�lAPC���	^AQ��w�d�ASo1��AT�oR��!AV��k�AW�/;[VAYmO[�nA[2�����A]��A^�YCg�A`{���Aa�Ye���Ab��Ϭo�Ac�Ҭ��*Ad�Gf�!�Af!��{LAgf8	ݎ�Ah�Yf�qAjM�	6Ak�+猻lAl��[�An| 
�ApU_JApԓg#�SAq��!�.�Ar�8�"�Asa8M�+�AtEisAu.��n�Av���Aw\�C!        ?�4��'�l?���'��?�ϗ���0@�	�_LO@�e����@ �D&F,�@'�?�<vM@0�K�	�@4˄��@:[��I�@?��gj,@B�iӿ)h@Fc�"�B@J
<�vcn@M�v�g�@Q����@SB��� -@U� �J#@X�����@Z�8A(P@]^�S�X&@`Ʒ"�@a�׿��@c !Y�
�@d�C�C@f`�z*n�@h����J@iک�{l�@k��T��Y@m�8�|�@oy�Lt��@p�Y��(|@q�����@r�E��Y�@s�w-91�@t�սx�@v�Kθ@w4]'8h"@x_29�'�@y��E�Zb@z��m4�$@|4�ԾJ@}N���չ@~��>���@����)@������@�[֊Cؐ@���_p@���^#'�@��y��@�WR����@�"�=o@�����@��芈��@���pK�@���_�@�t����]@�eV� �}@�]Jxs��@�]+�{��@�e���4�@�wVb��@�����"        ?@��gu��?����1#�?��Q��?�oW��?��R]0�?����.?����)$c@	��|�;�@���\�@&=v9�@2��%N�R@=�PH�*�@F٧����@P�����@XB��Uf@`�	u}��@f](<PU�@mu˕_a�@sq���"@x&� ,|�@~1�E0x @�����t@��p�_�@�[E����@�S��R@�O�3��O@���iB.S@�\�N��@�u�jE�@�z��c@�����@��b�|L@��o�VF�@�����@��'�@��Ğӊ@�ʂ����@�啢�$�@�) ��3D@���f�oB@�5<�E�%@�y���@��X�~,�@�%0y&@�� V�@@���� �@�ƛo�q#@��e���@�='��e@ϴ��R��@�+��	@ғ�u���@�S�d@ի��Χ�@�^)��m�@�+�2���@����@�7�}��@�E�e��!@���Я�_@�����R@�Bw��*@�m35̹        ?����k?�� ��?��w�n��?�,��׵?�O]So�@b���7�@��'�@ ����Ԧ@+;ęV��@5�K�{@@�$<�ǎ@H���ũ�@Q�XdEx�@X'[!Tt�@`8��6�@eE����@kT�`7#@q?�+0N�@uo�C��2@zKZ!�@���:A@�'*���S@���̊kI@����[t@��aE���@��M̎��@��1u��=@����CS�@��(�d��@��|"W @���|fY\@�w�'rc@�Q�ư`�@�m�BG%�@��Bt���@�6�Q2Rg@�)�7E��@�>rO1��@�u���@��꼭�-@�P��ꌞ@��N���@���c��@�]U.��]@���@Ŗ�H��@�V����@�/��o��@�"�h�[P@�0��/f@�[��.��@���H���@�0g؀�@�Hs��dB@ԜF��V;@�\7��@�xpDG�R@�J#�@ڟ��b�@�Q�Դ��@���)<�@���z�=@��ɻ�        @]�_�/@�����5@���8���@����Э@�m݊@�Ɠ���@��TZ	��@�kQ%�#@��騇!�@��93,e�@���]t@@�����@���@��aA�4N�Ajr��A<=4�GA
;�<""lAh"0j�A`�kf�A"���A��j2�pA��<f\�A�Lm��A��w�A'� �A�Ad5)�V�A Y���0A!�����A"�z� T.A$��nA%P�<��A&��7�5A'��c-�"A)`�����A*�M��~A,>�t�A-��A
��A/;��\�A0c�)��LA1."n;�A1�H�Y�A2�iXP~A3�0����A4��,��A5m��bt�A6XQ�FGFA7I�-�B�A8A��Z�A9@���A:G�b�A;VQ���A<m9�&TA=����bA>�z��A?窦�ԈA@����AA5FǇ�}AA�48AB�ϣ)*ACB[\F�UAC�}x)�zAD������AE�DP�{        ?���b?ȓ�Z[ɽ?�@���?����+��@�����@�FA<�]@vW���!@!�弡��@&��nQC@,5l�L� @1&�S�9@4Z���@7��i��@;��\cd@?�_��y'@A�zrH�@D
�J@Fcq�_�@Hϧ�J�@KU��ď@M���n@PU,:��^@Q���a�@S.0x-��@T�0��_=@V6FIt�@W��qO@YpǛ�};@["J����@\���l�@^�&�"@`F{^��/@a<+Sh�X@b9c8��@c=����@dHv�H4@eY��q@fr����@g������@h�ƺ��
@i�#���l@kD��@lP���I@m��V�@n�L`��@pMd��@p��VO��@ql-���@r��	H@r��F��@s�XlC%@tG
�)�@u�2VR�@u�.�y�@v��y�~�@wV�Z\VY@x#Z0�&�@x��,1\V@y���#&Y@z�"�[0�@{�		��@|b��Fz@}J�%P�        ?����?�Sj�j�?����g@zU�4@aL�08;@ I,�}e@'�#��@0����@6R�j���@=h��A@CO���b]@I1�P69@Pk��)@U_ZY��@[�f�QY�@a�(�x�>@f��KU�@m(?��y@rO��;RQ@v�K!D�@{��0<�l@�߫ӗJ�@�0a�c�8@��l�R�h@��L�d�/@�,/��J@��Oеa@�@=U?�@���w-�@��|�(�:@���O!@��: �M@�J��R�@� ��6@���n@�!/���@�Oݑ��3@���2/�@����qU@��>��?@�>�//�i@�����W@�M��
/�@��H��L�@��p����@����o��@��dw�H@��!��@���P�@��h�@@�9�@�i�aT��@�׶>G�Y@�Y�m�@�����T@ʚ���ɹ@�[�d/�2@�2s@)@�r���@�H*��@���?�@�8�)��@�]�XE�        ?O�9��?�6���#Q?�Ba/y�4?�������?�{ߧ� ?��'�0?�P��5J?�'C��l�?� 2m�H�@jqrOT�@h6��ʷ@ *3U	DX@)���!wS@3��ɠSM@=�]=���@E{ħ���@N��@T���K@[E��^$�@a�r|�@f����@l'_�2Vy@qE��.s@t��`6�@xܴ�(l!@}C\�,��@�	��f;@��y�F|�@�Iv�9@���<b_a@��T`���@�7#���@� j�z�@�-B���@�_�}�~�@��
	���@�;�&�%1@��R쇪�@�a῏A�@��q)S�@��L�H�}@�9n����@�	��ӗ�@���6j}�@����Gqt@�#>�ccc@�g~�n@����-'@�(�3�O@�|�V��@����Nd@�[�/���@��$e�@��gk��8@�B�)Ƭ@���_�@���a�3�@�{�:xX�@�����C�@¥m�V@��8�׆@�
�6�v�@�V;k��\        @X�}�F��@����AN@�y�Ag@�̒��:�@Х����@ٍ���@��Ͼ���@�ŀ"$d\@�,ڣ�4@�'�d�6@�H�V�D�@�?#.��@�p]�6YAm#����A���nA)�D�A�dCl�yAR�e�j
A	��ҽAvP�.�A��yL�A~B�l�	A�b��eA�E���A�|
d�wAN����A.��DA���-A ���oA!����A"3T?�6�A#R�5�]	A${�:���A%�7��A&���z?�A(.�3��A)|��rA*��J��A,/�YQcYA-��3�QA/Wc�PA0<Q(0��A0��sRA1�2�tEhA2��7գ�A3M����A45��A47ΩA5�j��(�A6�Sh}E�A7o�V%A8b�	`�A9J��lbA:5dʑ>A;$��c�A<=�#�vA=����$A>wi�oA?��E	A@	�(�A@�A�[%AA�q��AA��Ƽ        ?�v�{�J!?��z��@]�GQ@!�x�o �@/�X��R@8�Ao�D@BL%���@HË�z�t@PB3l�@T��s֌�@Y�݉@^ԧ�|V�@bLPj�L@ed8n��9@h�xq�u @l0E)P@o�>��	@q㰲E��@s� J��@v9��@xO�%hQ�@z�3Z�P�@}ڱͬx@�:k�n@��Y�OU@�q��V�n@�֜᫟E@�Fg����@���N�@�F5���@�ձQY`\@�o3Lw��@�t���X@��,/N��@�:�`O�7@��w��U@����q~{@���8���@��P
�\�@��4���@����<�s@���y�@��b�{	@��
?Z��@�����'@�ˀB�1@��l�!@��iD���@�Q\H�@�4�uO�0@�-�r"��@�¢��K@�Y�����@����x@��lGoT)@�)��B}@�Ǚ` ��@�f���<@���O@��zl��@�L��K!>@��LƲ��@��!�^z?        ?rM^���?�J>��$�?��̝�]?��%�: U?�@fx��g?�?�lC!_@gb���@ﶺ@�w@�`"�+@#�f}TB_@/�ΠD��@9��h2@CYqW��@M7k0��@U�!�Ń0@_�۩y�@e�Hc��@nX�E�mn@t����y�@{r(�@��mj�T�@�<�lA�0@����Ȭ@��m�C�_@� gq�@�SSd�e@�4�8��<@��Z1�T�@��1�<@�?���4x@�0s��P<@��ЬM@�N�|��S@��"�M��@��<O%�\@���7z�@�2�����@���
��@���gه�@�VN+���@Ђ�C��@҇�!|,U@ԽfC2�d@�&="��@���}Bg�@ܛKB��@߫���Mj@�{�0q�@�@uމ�@�#�J�j�@�&��A@�I5a�B@�-Z"�@�춵��M@�6����@��S<f#@�框�k@�U��z�@���"���@�a���M@��2��@��t�*�_@�_�1        ?{���H9�?�MT�4\?˅Q{r?�/^XY��?�t�ao�?���I�#?��;|
�@C���@Q���1@��jȡO@�G&S@$�����@-'E�%S�@4�1B&@<��Î��@D����@K]9���7@Rq�v�]�@X�Ml���@`"N�@dĻXM�@j����@p��'�'@tֵ�)��@y���w�>@b�faW@���X�}@��*��@�ZX�*@���,��@��2�u�(@�����v@�#�_��,@��g��-@�{��5�@��2�}�J@�#�*O@���E�`@��D�@�������@�k~��*@�#����X@��Jq��w@���d��@����@�k���@�Z�Sa)j@��V%J4@���:q�@����m(@�Hu�o9@ĵ�=�@�2�3���@��S ��@�^�2�i�@���?�|@�η"�p@Ρ���q@�Ct�g�@�?�>�c�@�EVA��@�U���n@�n��ݣ�        @p��8�yM@���G&@ĭ�ޤ}@�̝�[�@�u��
�@�6*���P@�^�C��@�D�v���A��>{��A�'���A�6�A�GRV�A�9�AXF��c�A���Dv�A���
>�A!���R�A#�9]�lA%�tʥ�XA(E��	6A*T�����A,��dP(hA/4���_�A0�駜�A29?U>A3�2r�� A5��~ۗA6~~���A8��A�A9���J4GA;(s3��A<��'��%A>z ��@A@9��r:A@�����AA�B,4��AB�+SQ�AC�@��AD��<:2�AE��O���AF�/Ui�AG�Fn�a AH����AI���<}�AJ�s�Hr�ALG!��
AM5V�C;�AN`�<G�AO�1�vFAPd�C!HFAQ��F�AQ�EY3KnARI�K� �AR�"�!AS�!���ATFD(�AT�U���%AU��]�W@AVWY��.AW�F�WAW�s7���AXz���AY4�h�        ?��%�?�TY�au�?�?�T��@
T�E�@�/�r�@!�}'9�~@)?��
d@0�7m��@5���k�@;+��<�@@~c�!�@C�cSҎ@G#����@Jߕ�E�@N���#�@Q�늧�@T
�}�7@V��ͨ@YnmԐ��@\|g�O(@_η|�]�@a�R�<zn@c�g�{�@e���k7@g���~�T@jieJ`,@l���kƸ@o��4݊@qL+��@@r�T�P4�@tj�,�U@v#4��@wه�
=�@y��u���@{�Ƭ� @}�	ş@��7�(@���D
�@��xM
��@��68̓@�7w����@�bz�&n�@��
��`@�ȫ~pd@�T�@�A�d|:@�����_7@��d���@�$ez�@�h^-�9B@�^���w�@���:{�@���r!�q@�n�0(�@�%]i
�@���LSH@��^A�F@�]�gy|�@�"��P@���J��@���A�[b@�����%@�fZf^p�        ?yiEQ��?�b�yp?�G'�Q�?�]3f�A=@���(�@��_'�@*�%r�@$��Ne W@.)��/@5=20���@=|n-���@D;Z8�5B@KtF@�B@Rh:����@X^���X@_ս���I@d�`�;q@j��J��@p_.�:�@tO����@x�]�d�@~FVl���@�:�)x@��}4��@��O��?�@�jq|���@��l��@���˿�@���P��@���xF��@��}��P�@�?��*w@��ut^i@����|��@�����@�Y�p�x@�k�Q��@�=�Y͸!@���$��B@�$�ϊ��@���AB�@� Ѝf�@��Uh?w@�|vd��o@�v�-jԒ@Ɯ���B@��y�R�@�x�J�@�5r��c�@Е����@�.��r�]@��<g)�W@������B@������@����@�6k�%�@ޫ��C�@�^�"�Y@�	�((��@ヶt\�@��S�f@涃U��\@�n��]o�        ?�z��`>?�*)�(��?�a��W�?��F0��@	oq+�7[@��H��@"��B��@,��%¹@5�R�!�@?��Ҵ��@G<�\��@P�4Bdp@WۦH�[@`�?�DZk@g����@o.�����@t��v�F@{+�{%i�@��E���@�?�s�U@����Z�@�B ��R@�<1�@����w^@��*���@�32g�O*@�r��I@�+��<�@�'5����@���e�#@�S�ab�@��%,@��F<�@�X��mB@��Z��1�@������@���u@�*��y��@Ȋ���Z@�U��f�@�Ĝ���s@�O�Ѓ�@��{��~�@�j�,=8G@��|$�"@���@ @ط�D�pX@ڨ��w��@ܰ��|�@��5�%Bp@��u'%ko@��!"@�����=�@�N��@�[b,E�@歿"�4�@� ޿<]@�sv�>�8@�泩���@�d�|�8�@����Ę;@����@�Ou#T�        @o�n���I@�M��۲�@�:HH���@Ѿ]�X��@�%>���	@���ؘu�@���{Ş@����+4�@�/�A�^A/ڂ1�dA(���m�A
�;y�ARCz�AI�`�A)):��AN�L��A�Ȩ�A��2p�FA!ѧ��@CA$e�vA&��5�0�A)G�,UA,;���5A/rl8�A1v��E�A3X�~�_�A5`��6}A7�4I��HA9�Ĉ�+A<e����9A?�J�$QA@����ξABs܁� HAD:��|�AE���5lAG}<� �AIW�0AKF��|� AMJ��v�AOc���AP�#2y�AQ��0*WjAS_�0�AT=tS�AUu�Ƈ�cAV�z5
G�AW���^
AYOL�v6AZ����\�A\˛��A]k����A^��K*�A`%��S]A`⹕��mAa�i�\�Abg��['uAc0M�*!�Ac�jlAdζ�M�Ae��.C�Af�3ᬪ�Agg�9�_AhT���c�        ?�����?®�v��?����L�?��+U@��Q�@x���{�@���bɦ@!$L�F�@&�&�4�@,��q�\@1�\�W@5�gO�$@9�xK�)@>=���F@A�f��0�@DA�q��@G(��!f�@JK�[�9@M����t�@P�,+�C'@R��_�=@T�����@V��4��@Y&ɉ�7�@[����F@^;'*?�@`~�b�Y�@a�O��K@c{��3@eG'y0@f�E���0@h��ʚ� @jh̴#!@lV�v�%�@nY� ��@p8�+p�@qO����@rrK�};�@s��>j�.@tۺdo@v#���@wyE�M@x�,i��{@zLkps�@{ɾu��@}SȤ���@~�!dR�-@�F3\�%2@�$n�nM@��Ɠ@@�@���S[�@��ӑ���@��� [@�����r@���@��.��[�@��N-�q�@���
+�@���r��@���&@��*�M�#@�ٟRRϛ@��1M{��        ?����Y?�{�c�?�Di�ƒ?����/��@!�|�sV@=�o�" @"����?@+���&��@3��8�d�@:�a@�˶@B\���<@HՃ�Ύ@P���q��@VO�W洏@]�gX�7@cyV�û@i\�:�UR@pU�a9�y@t�Z&R@z-���	@�GK3�@�Yb�_@�R#�M��@�>ԟ�v�@�g���5@�����^@��� �*v@��I��^@��?]S`�@�C�5h&<@��̙bɩ@�fD�S�@�E O�@�Z���8�@�Tp8�(d@�uORG[@���ٝ�M@��IT� @�)΋�A�@�tj<�7P@���-4��@�y�މ@�v�Jk�@��)�O@�W�}��@Ŷ;�4C�@�lN��@�:�����@�!�?�Ӝ@�#r���O@�@Cd��@м���5�@��0k�
@�#���@�n(���@��Xp��@�7K-���@ض����]@�Hk���,@��L�ĝ�@ݥ���3:@�r�-^@�w	��F        ?tx�y&A?�^[z���?ϖ|*H�?�+�/�?����?@�e-�@;�~���@�E>��@";	�d�"@,��8�,�@6����:,@A�9c}3|@K?��(@T��Gp��@^8���Wu@e��~*��@n�Gs{�@u�$ �@|a�`:�@��Է���@�b;>��@�( �@��)�|�@�Q��~�@�ǡ�'!�@�e�B$@���S�@���i�7#@��^Q�ց@�qS4X�U@�"/��@�zQ�'�@�@<�	�@��V��n�@����KZ�@¨��d�@��i\I(@��1�Lػ@�X�-�@��d�|��@�rh@��@З��w�@�c��@ӄ�g��w@���Hb�@֯��(@�\��,p@����@���]�$@ݾҴ�;=@ߩ�va^@��Z�uZ@��7R���@���.@���U��@�A}k��@�G�FY@�{,~RF�@�B����@��uh$*�@�Q[��@�R�a@���2�        @Fč�B@���o C}@�';.zW�@��4��@��ۈ?e@է��Q��@ߣ�۫�@�8$�D@�:i��ت@��_��@��C�d@��7�"�@�����HA�u��+MA�$��R�A	F4�z@uA
�D*�WA�])�ƽA�J^XAEu�Y�FA�lGm�AҮ΅A��f���A �So,�A"�l%K-�A$�wkK�A&��W��A(�V{B~7A+h�A�7A.�٭4uA0h��omTA1��gHA3p$(eA5Uh�qA6ȣ�rh�A8�e��jA:qۿ�^0A<f)k(�A>q8\���A@J���AAg�']k<AB���g�zAC�VAᲠAE+�NٹAFS3��5�AG�WQ�uAI{1�AJf���AK��؅TIAM>��v�>AN���]�9AP��l�AP����/AQ��݄��ARWL�9�AS.�)7�AS�I-1��AT��Q*&�AUx���u�AVG��AW��6�jAW�����AX�o��,        ?g7f9K1:?��	o�e�?�� !�?��\�(b9?�L��-�?��L��i=@ l�~�,@;�*L�I@at�_h?@y��6+@E�fI@ )�捜�@#��#�L�@'���O@,-1Y<��@0�b�nIG@3=޷^�@6/��c�c@9cMm��@<��J�j@@L�moX�@BQ�T��N@D~+��E@F��j�@IW(� $@L���<�@N�P���@P�<O�em@R�K���j@TV���E�@V+�D�J�@XB�V�t@Z&� J��@\P r�L@^��+��@`���'�@a�!$��5@c�i��@d�{��@e�>ax�\@g����@i&��z%@j� ��"@l�j�?zm@nc���@p$&_�v@q"�^��@r-"����@sF�yl��@to�\#t@u��lPZ@v�_f��@xZAߧ�*@y�k�SK@{^r�K&p@}bX���@~���oU@�C�Ǻތ@�4$?��@�.5+��@�1Nr��
@�<�#�S@�P�񲩣        ?N�����?��_�AS?�L�l^!�?ơ���J�?�g}��7$?�. G�
?����&�c@��ْ��@p����@\t�V`�@$��}��;@0n��ω�@9o�ֺl�@C'�8��3@L��&�@TQ���I@[�'��!B@b�s�Q�(@i0��@�@phioa��@t�H�Dy{@z^�@�kZ@�RhWiש@��Wعغ@�)�f� @��*��WQ@��_��@��h[@���T�5�@�HXoX�x@�y�h�g@�
*�y@�>:a	m@��/�? �@�2����@���J��@��x�z��@��X�4[@�E�~aϾ@���7�-@��� �@��}47@�Jw���@��*�S�{@����p"@��, ��9@�:�$��u@ñ��l�@�</+4~�@��QK�-@ȕ\B���@�eNee4S@�N7U�<�@�Q7�R�@�7��or�@�U%����@ҁs��n�@ӽV@�X�@�	�j��@�f�@�x�@�՝��XE@�Wr��q@���ߑA"        ?<q���F�?y��x�0?��vh$5?��i��v�?�c�M��?����e�?�;�?�`���i�@-��OB@��/�ƺ@IM*�@"�d��g@,�@��@5����@?b�i�B@FIpHj�i@N�%S��4@U1��@[�F�1#@bB��Pe@gp��R]�@m�p@yc�@rp��t�q@v��D�T@{�'��8�@��D�n�b@��
��W�@�-���Ox@���@�qf��@�*���@���l��@��5�?_^@��g����@�0A�Ŗ@�����r�@��)���@�!92���@�yy�2B@� m�_��@���]���@��tM�@�d$���d@�Ѹo�-@��6]�@���f @��w�b�@�C���!@�n��w�@���V�'?@�Qm�@¿mo$&@�E�բ��@����^l@ǟ�����@�v7�!��@�i�D]�@�{��uU�@ϭ����n@� U�}Wd@�:�B���@ӇX(�%@��O��D        @D3���?@Z6�;�`�@}�x��Š@��Hl"(@�q�t�U@���[]@�+a��@��6@�F�X�(�@Ї lU��@� �l�K@��2C�@��a��)�@�	3J@��g�J@ꦤ��Q6@�|�چu@��G���@�Q��n@�oX��@���_�E�@��v�o�A �Xp״�A���Ÿ�A�G�,� APZ���A	π�%��A{ε��AV=BJA/��ltAˬ �)A�^�zAME���A4n��yEA6�;8.AU�<�ByA��<5dA w�D�v�A!��
R� A#Q����A$_�8�_>A%��
��A'@���`A(Č[-jA*T��Y�A+�CmO$A-���BFA/_�'=�EA0�x�\�A1�p�zťA2�כo&A3�=�[�A4��˨�cA5��5 �A7!��A8m�L��A9�3@+*A;5��h�A<�X����A>:��o�A?�5� XA@�����AA�(��h        ?hz��t�?��/r�?����a�?��/�7($?���d��f?���5?��$F�m@[�*�U@��~��@�T)�9@����@��L�!@�X�ȟ@��|��o@!5�%�T@#�ae�o�@&=�m��v@)�r�5@,��`&@/B���@1`I���l@3A"�@5C��Gs@7h	�D7@9�|��ٻ@<L���@>�EMW�@@���w�h@A����@Cm1g(u�@D��<*�J@F��8�@H%-��o@I�"d��@K����!@Mx�+fG(@ObG���@P��br@Q�«�@R�v��!@S�|��
�@U�z�+"@V5����R@Wri7�Y�@X���h@Z�V7d@[u�؄�2@\�Al��@^f����@_�����@`ȷ���@a�*f!��@bz�����@c^����@dI�bsx5@e;�d��@f4���@g4��p£@h;�M<�@iIʛE��@j^�%�/<@kz�}�*�@l���X
        ?#c�/=`?c���`?��;:��?��"h�n?���ڷ�?ͯ���~?�&(ӧ�-?�:;�]@ ��*�@��DD�@�W=^��@%srb@1$���[@:jB�Tp@C��<W��@L�7�@T0F�`��@[�bUm�@b�����@i!�[���@pn�<'2\@u)�����@z��?w@��P��@����1�@��{��h�@��i��x@���B�i�@�b��0T@�@�o�@�ǹ<��@�� ���@��;��9@���
�|�@�%&���@����`a@��sn"�@��ӣ�@��T)+��@�Yc��b/@�q�rbsB@���Pԝ@�a���@��gX�Ɓ@���B��c@�T9�Ҳ�@��J9��@ͮ_c��z@�W�7��@�����U�@ӵ�C4�@Օ�.�F�@ט����@��5V�!]@��cbY�@ނ�9J�/@��T���@��x�C��@�noV�׳@��߾�=@�qŋ}s@�eϢX @�=�C��        ?;�ũ�5?t��d�Ny?�¸����?��~�yv?��K╷h?Э�4�j�?��r�SZI?흨z�?�Ѽ˙�@q��/��@���{@@�i��u[@(�0Z@2m�- @:���j��@B�
�Vā@I��[oL�@Q,8���@V~����@\�����@bJ�siXb@f˩��w�@l�x��5@q�0`�@tu�@Γ:@xV�Tը�@|�c�}�h@�~�-z@�nK��@�\ʭm@��T^'[@�`�{�@�b�0��y@�f��<�@��*4bv@����G�@�P8�\@��Sq��3@��m��R@���S��@�L��S�0@�峱���@��"�*G@�Rܕ��@�%��%y�@�Hȳy�@�	y23@�q��;@��iWr�@���LB!�@��Vz�Uf@�+/@�X��F"%@��GG��@��U�Q|@�aK��@�ӝ�$�@�S�A�F@��W2n"g@��c�@��bam��@�t�(��@�[�͆�        @���pD�@XW�A�@yA^D��@��m�Q�@���eۭ(@�UF]`;@�ܱ�.�@��u�@����@�-�"|(�@��f��T�@ͼ�wJ�>@ѐ��]Y�@�y!���@ךjP�Z@��;��h@ޖ�V�i@�?R8�WU@�]�u�!_@�U��P@�+����@�߰��2�@��p��!�@�n�Ȟ��@�1�P@��e!D ]@����J�@�xty��@�n�`%�@�yY�$�@�����k�@�̻�YzTA,�	}�A;"��Avuj�{�A��ۯ�AJ˽}=Aq��XA���J�A
Z �>�A�kaj�A{ב���A#�W�=�AnR��ASP|���AAh|v=A94b=�A:�_�q�AF��� A]���AU��ǢA�L��A�-�>A(a(-pAw�&;�BA�Gb��pA:�p���A W��ۼA!aՇf�A!���׎�A"�87dv�A#��)?.UA$`��21�        ?��C�~�<?��� ��V@�g�l@%|N"�b5@2��s`Q@<�d�%�t@D/��u�c@Jπ����@Qxhe��@T������@Y%��ş@]��+P/@a�#pZ�@cu�x@e�_�Q@h�"��ˌ@kF�տ��@n�^�b@p���\��@r�IؿS@s��#}0$@u@X-$�@@v���̾@x��g@z�o?08�@|���˟!@~��ưw@�M��ظ�@�e��<1@����~@�����UA@���S$|@�<����@����;M@��L�Gq@�XP��@���ޤ�Q@�C��V%@��6��9@�&�_.�@���O���@��<y��G@��+���@�W\"H��@�,m4��@�>Fc@���ԥ�0@��cbRT}@���Rg^@���S�\�@�wQ*��E@�hleW�@�]a��I�@�UT�>��@�Om�&�@�J��oC�@�Gv�j@@�"5;˱�@���h��@�Y��[@������@�X��@�����bk        ?���|@T���,�@��L,z@-��Pi@8.l	��/@A�{:iy@G��%x@O	SEZ@S||j�̠@W���ߚ@]�A&i}@a����}@e�){�@imF�j�@n��5�nQ@r���,�@v��Wz�@{5�z��@�ŰAl�+@�t ��cm@��Rո@�1T$�&@�9����@����W�@�^�j:@��o\7�?@�1��� �@�C@^�hn@���[A��@�z�E�E�@�T�y�,!@��3�*��@��Ȕ�@�њ�VJ@����^�@�٣僠�@��|���@�]�A@3�@�?s�f��@�=�G��[@�X��&��@ʒ�w��@�����o�@�ae�ך@��\S�&�@�Xχ�@�ù�Ƞ�@�?/�]�'@��)u @�d[��W @��ϡ!@�Œ�)[+@݌N�m:@�a�9�@࢒q2�@�`6w|�@��o�#@㡏��~�@���ۢ�@���}J@�����~@���s�9M@�%��ԕ        ?�VJ1��@��9?��@3�O�☐@F�pngp�@Ti�G��@_HT��@ed��6u�@k��)�k�@q���d@t����K�@x/a��&�@|sE?ݒ@�/����@���1-�@�0�z p�@�2)�ض�@���L���@���[�0�@��N3�@��%�'�@��y7�@��y��@�Ł��>@���}�@�ڱ� �u@�sCV�3�@�L��5��@�i�0G�@��)�_��@��}���@��s��@�������@�s�R�@��cf���@�(����@�����*@�n1�a��@��Xd	�E@ġ~3�`@�^=˧b@�36$D�@�!�"��@�(�鍠/@�J���H�@�DV�Ի�@�q�=���@ү$�-�J@����<NK@�\��+
/@��7�K@�U�r��V@��)8��x@ۡ��8�@�g-{��R@�B�?�?@��-��@��s�[@�p�=�@��r,n8�@���V�H@�y1��@�GB���@臂d���        @�c|\*�@�?�~;��@�FQ���A ��Mҩ[A��_�A�=�A�A(��{��A#��/�A(7�wJ7A-��M;�A0�����A3ygy���A5�� ��A8yX�B�>A:�o��9�A=��ZK5A@���!AAQ�s&��AB����AD 0vt��AEh����AF���1gAHlg���AJ�
��AK�6]��hAM�D��~tAO����AP�U-c��AQ�QQ2AS,5�hATq��XoAU����AW:���� AX��ynO�AZXw��mA\�B3!LA]���<�OA_��	��A`���kKAa����m�Ab�9�=�(Ac����;Ae�+hAf?�/��Ags���JAh��-��Ai�����Ak?�\�GAl�@Y_Am� N��AoUV:�2�ApaT��VAq[�]�7Aq����7�Ar�[ՙ��AsU�(MG�AtV�At�F�<�tAu�:���TAvU��0��Aw��h�Awѐ(�kiAx�6_�@        ?a�y17G?��9=�?��mG�?�]>��}�?����%�?����"/?�`=��@ϱ�H��@�2�حt@u��}b@�� t@���'X@"�h��@&M4,��@*S���+�@.���g��@1��?�l@4W(�@7 �-ǝ9@:�W���@=S�{j@@`��FY�@B4B-���@D%_k��#@F4A'3�k@H`��7�R@J�H�9�Q@M
�э�@O��p��@Q���
@R|]��r�@S�8�$�@Ufz`9@V��+R@X������@Z1�!@[�Z�t�@]��|���@_{�73�@`�g��l"@a�����@b���\��@c�H �f�@d��~4�@eۿ/v��@g ���=@h14���@imm���@j���J�u@ljS�)�@mrɕT8W@n�7�<=@p5�|��@p�`2"2�@q�4�U#�@r�*!>mB@s�]��2�@tw�/�@uk����@vgS(��@wl1/J&@xz��5�@y����F�        ?>����e?�cI��,?��"�i��?�o?~3j?ӱ�2�"�?㫦s���?�����@.�c4v�@㌕m�@��"�@&��u@2Jă�Y�@<z����2@E^�@9s!@N�*i�@U�ffD��@]�T��I@c�A7g@i���1��@pG�Xȩ@tN�͘O @x����@~��m@���0@�)I	��+@��'�@��UT?4@�W���@����;�@���cưF@��l
m�@�;P?f��@�s��C@����6�@��s���z@�PxIt	�@�1R`�@��#��!@���D��@�Ѯ�1�@��8PΣ�@���]i@��X�$2�@�雺qM�@�,Y���@�~@��@���]�Z@�RiKt��@��/��I@�l(���@@�'[dY@���i��@��|�[�\@��:|	
@��ۙ�W@��
�Ҷ�@��1hX��@��6 @�6�7�@�r�P=�@Ƚj�nX@������@�|ꋳf�        ?PV!<`��?��У�^�?���+(?Ŀ�a���?�0Ξ��?�z��ـ^?�%��:@-D[fY�@o�6��@�Gz@"(q1@+�)+X�)@4�����@>��R�,@E�
��=@N�_fO"�@T����%@[�e��@bY�%���@g��J��5@n!��%�@r�?�+Wp@wR��ˀ7@|xc���@�.��[�>@���Eϛ�@�J�{:��@�������@������@�,yNO{�@��!`�@�"��u"@���#�-@� ���bO@�$��@�S�f��6@��m��S�@�<���'@�����@���g�^�@�\쳇@��le$B8@��ߒz�@�{i��P@��	�wQ�@������@���JX�@��Ε�q�@���hx@$��<@�~/��@Ş7S�i�@�MS��8	@��#��@����b8�@���X�_@���#�@Ф,�r��@����W(@����@�S��1�@խz��e @��9�,        @ Q���@\��@�#���l@���F�@�yP>�@��J�:xk@��6��FK@�Z"�I(�@�jM-���@�ȈtѐK@�j� ��@۠��ּ@�@j!�@�첐:�*@�sBrSڀ@�M��O�8@�~)(}�@��^ì�@�u�{��@���@���(NcY@��?�G�A ���?A�"^��A�
���ZAwad&m4A} �Y)jA	�����A��3�yA@
�o"A_�޻�A�T���#A���zA�`��5�A�����A��u��AD�z^�A���}�A�ǖX&A���V%A _��#A!k�6���A"��@�A#�fz�=�A$�gt�pA&�8��A'n�s/A(�R��+(A*C+�'��A+�I@gv�A-`b�P��A/����A0eʱ�cA1O��?A2Cƛ�hA3B!|�#�A4J����1A5]�:���A6{/n�mA7�!l��@A8��!��TA:����A;\��Z        ?�RV�
[L?н����?�4oɥ�@O�.ˌ@!��?�@�׺�l@$;7!�Z@+�uQ"2@2q���$s@7����l@=�Qe�@[@B}m��@E��쀽�@Izw��!"@M��M/��@QR�#�@So6�#�@U��v@X��Ů6}@[X7�~��@^<�u�#W@`����W*@b1ГTe@cѕ��@e����@g9M%�O�@h��|>��@j��u��@l�A��/@n����k@pG��A@qH����@rN^�]@sZ��uh@tlu�Ϩ�@u�@%ʇ�@v��D���@wŌ��J�@x�!<��h@z��.S6@{Tx�9@|�}K�ǆ@}���OG@��:�@�3d[��J@���q��@��ȹ�.@�=\�.�@���0d%�@�����9�@�kq��x@�/���@������@���}���@��PZ�	@�}�Fw@�`p!�'@�J����@�<9���@�5�?��;@�6ʋ���@�@4�K��@�Q�q���        ?W�3-җ?�����?���3��?������?��F���?Յ[jcB?������.?�&J�@6A�[t.@6����E@�����@&�7g"�@1��|�	@;a��z�%@D5���@L��#[�K@T;G��wm@[�����@bg׸sU�@h��SB@n�(�d�D@s��w��d@xe?d��(@}���3@�7�#Wo�@��;��˻@�ЈU1@����U@��F�Q�@����m�@�����P�@�{g�1�@�M6�$\@���
�;@����8�@�qD�@���W@�쓅!� @�� �H��@��F��@�ـ|;ag@���iq^�@��zE&�@���
\�G@���;���@�C�1��@��MF�
l@�&��D@{� y@��j�G'�@�m@s�)�@��lC6Qt@Ȣg���@�Y�@@�$�~sU@�ծ�3@���7��@��qE�@�l�c�v@�0$�?�B@�Y�=�3@Վ�� �Y@��n��a�        ?�Rp6X�U?����@��0o�w@��vy@@*��>�(�@6.'�|@@t~#M��@Fٳ�՟-@Nf� F@S��<��4@X���ۗL@_E�m��@ch�h�@g�T�jb@mI�{]v@q�@4U�L@u�Ɠ�@z���D�@E�����@����\�@� ̼�:l@����@��J� �x@��V�Ώ{@�A���@���>qJ�@������9@��P��@����I.�@�Ni?�@��]ۈ��@�����@���g��@���ڪ>�@��_�!�@����l%@�u0ҥ�@��h܌X�@��P���@���Fڿ�@�ZaEg�'@�m�N*t�@��4Ɂ�@��0��@ć�l���@���#��@Ǐm_X@�+5���@�כ5��@̕%S�\;@�d^�\�@�"�%/k�@��K�w@� ��}F@�.�3�@�GL��E�@�j��W��@֙�L�o@��l��~@��%���@�p�u�Q\@�Ӡ�<Q�@�EWϴ�~        @\�e�w#@��w�Q�3@��V���@��D+��1@�㺈���@���]��@�CAJD�@��ӈQO@�����@�о'��JAVP�A��ALԄ��A
rOGI%AT�ɨsAj���"oA�AR!A>��fAп*�y�A|\&'7�AA�����A �b*E~A"�$��A#���B�A%+���p�A&��j�A(|7��o�A*6r[V�A+�y�6TKA-�HA�A/����A0ʼe�IhA1ŋ$A2�s�٪oA3͋1c*A4��7�A5�q�A7�<�fA8)���H
A9Q���=#A:�]ʙO`A;�iRB́A<��HZA>8��-A?��fB��A@mP��RSAA�dOI�AA�aIG7�AB�:�d��AC@m��aAD Zp��AD�TV�W�AE�<1ai�AFZ�p���AG-G�f}AHz�5�AH�z8�RAI�E�
�FAJ���e>LAK�$H���AL�fFAMs����jANk��S��AOh�1        ?�pK�I?�hG����@Qq��3@aDu~�R@$g�;o@0�p��\@7:����@?r�6�ą@DZ(��@Iv�Ћ�@O{D��m@R��̏c&@U���3�@Y�Z
�@\�̧d�@`BńPy@bDZV��@d`1�U*�@f��	$/@h�8�:�^@kM3-Q�@m�v�P�@p2��F@q��)��@r����P@t[��� @u�iBi�@wV�Q/>�@x��/�M@zu>�zuy@|#�M@}���栣@Z	�\h,@�� Okt@�^.�rh�@�;%���P@�����@���[(sw@�����c�@�ʶ�+��@����t��@���@���!�|�@�~���\�@�p���aW@�d+���@�Yˀv�q@�Q��o�@�K��Q��@�HڱC�R@�$Z0:�.@����Osr@�(��G\@���`�A�@�3Ʋ�[�@��rV��@�D��0g�@����U)@�Z�����@��J�Z;@�u���e@�����j@���Y�1b        ?ib�z�g�?��?�^�?���*#�:?�~�?Z�?�Z�L�K�?���S��?�T\�J5@����%o@���I�@wS7|G�@"mL�f�@+]`����@3�ߐY\�@<�i���@C��NԦ@Kd�F�@Rf^B� @XAr�x�m@_k4�6�D@d��~@i&�N�@o*lQ�@s,��&@w���m@{�����@�o��_1g@�\��	W@��iG��@�M ��i�@�]���|@�n��2��@��{�ӽi@��\�)�M@��n�7;@��N5��@�;����@�-��z��@�LC%DP@����q7@�����@��5�z�p@����*�@���&P��@��?9�]@��2�![7@��xL���@����Y@�V�r_@�{�,Vo)@���g�S@�u-B6@��Z�Ƙ@će���@�5Q*��@���2)��@����z�i@��9 ��4@�����q�@����P�@�G+���@҅���c@�ա�^@�8TS�s�        ?�gg�&�b?��:,�1�@E8kq�x@W)�rx�@&qp1P8 @1#�ݎ�`@7�t�!\c@?}�2^�@C�G���@H���� �@N���@R}u�_@U�9g�M@Y�U3��@^~H��y@b0j�hU@e@�s#�@h��U��@m:�@,�@q,�&�{@s�9T��@v����"c@z<�t��@~~���z@����[P@�g�[x��@���A�@��x�f@���"Yq@��K�N�j@�5R�1�@�0r��@�X]���@�B@j���@��EE�t�@���P�w@��ʯ]/@����[�@��@�`�@�������@�G����@����'��@�z25^��@�F�4��@�'��:{�@��b5�@�%<�p�@�(Ə�Ր@�G�q�і@�s���J�@��<���t@���n��@�K���?�@��ˀvX@�('����@��Q��@�G�H	@��r����@�Wʑo@�?�G�cW@�1쑙�@�.)!�@�4���	�        @�_�_���@��l�,�@ц��f@䓷�#a�@�_�@�V���A�Mq�*A٠��A�>����A��R�72Ap@`C�A1m��/A"��@A$����A'w8;���A*O��QN7A-CY���A0(=}�[�A1�_��_A3Z��HfA5S��=UA6��Z���A8��ܺg;A:O�Js;A<(t:PRYA>�`8.A?�u.ZCA@����v2AA�*\��AB����y�AD��YXAE5��AF����AG/Qh�AH@v�ڌAIR��-t�AJe�CЫAKy�;=��AL��AY�ZAM��!L5�AN�_����AO��ZL�APs3{T�AP��,>w�AQ�]xW�ARF�p��AR��n�8�AS?wKg�8AS�v��<�ATl7�N|�AU��h�AU�nk���AVG����AV톧�QZAW����g�AXE��9�AX�����AY���ɒAZk!���A[+Un fA[�5Q�[�A\��Z��A]��6�        ?�%��w۔?�cASv�?�'��M@Vh��Ew@���S�@!�63\j�@*�`��k�@2����ܜ@8�V('�@@#\Z/�@DP��v<�@I	����`@NT�&�E@Rㅧ��@U\�^�@X���Rݬ@\��%@`�����-@b�e�ϫ�@e0���/@g�`,o�W@j����+@mi�W|�@p=k+�vl@q��l�?@s��%�!@uY�5O
@w:(�`�@y0��H�@{>܉�}t@}d��6�@@��o@���3�v�@�5;�D2:@�z����Y@���2j@�-=�f?m@��t�xj�@�m4�F4@���:�@�B��~�@��ɓ^j#@��V�&�@�à�t�@���ls�;@���O�e�@��/��zj@��dɴv�@��ύ�@������@�s�G�3@�M[�e@��Ⱥ�e@�\#e�@�	[�/��@�Wڤ9��@�����@@����%��@�7�3�n�@��MQV�I@�����@�b��U=@�!"rc`�        ?�ǀ�D?Ȭ�#�.�?��8��E�@kк}�@o��S�@8x��J@'���b�@0�b�r�@6��\'�@=����@C<^�	�@G��}q�@M�����@R^�lf�v@Vv�A[�@[FE+m�@`qG��y@c��Q��@gk�w�W@k�$x�@p?��
�@r�6���,@u�����@yawG���@} ����@�� |�@����e�@�ah;�V�@�y��@�'ֹ�H@�9��X@����;�@����c/�@����\-@���}?V�@�1=0&F5@����כ@�S�l��@��F���@�n��[Q@��\�Iq�@�f"���@�5�Av�|@�!����@�*���@�R/����@��^�@� Q%D�@�D�hÖ@���Y�
@��@���@�}RZj��@�
��";@��D���@�b�7��@�,�O�L�@���)�@������@���vm@��
��@ý��Nt@��8l&@�&DC�        ?ѹ��m�3@JUE��@1`?A��y@F���V��@U���c@b&&\�u�@k y�@r��k�9�@x����l@�H��G�@���h9B@��o tH!@�n���2@�v4�Y]�@�4]�i�@�ص.>3�@��e�6�@��<�j\@�hw.�UE@������@�j�9&`(@�p��m�@���|��@��J?X?@�A8L�@��M�a^�@��۾ȵv@�+�8MSt@�����D�@�H�dHd�@�����!@��:��b@��S��@���2j��@��c��x�@���6�Ca@�˻�nL�@�(
Y~@�o��,<@��b��@�cŸeʘ@�����K@ʭ�9�V@�u�A��@�TW�!@�%�o*1@�-��)}p@�B�Kp�:@�d���MU@Ԕ���@����(�@� �U�@�|�0R@��:w���@�h��@��!K@ޞ��>�@�+�V��]@�5���x@����@���>c@���-@�(��P��        @{��ɸA�@�~D�MW@֯u�|�\@��O���@�A���A(�s�esAHϐ��A[�:�CA<�'�BA"nnn��A&��wp�pA+PQvTA/�^G�A2�T5H\A587߹cVA8�N��A;�;Л�A>7 G}�nA@��j/\ABo�&l��AD0u?�m�AE�ق @AG����̐AIʭ~�&AKƬ�=y{AM�$���AO�H^��AQ�dy�AR)kTuGASN�.s�AT{��&AU��s�#uAV�E�D�AX6P���PAY�2�!��AZߊS�`�A\B�oԽ�A]�Vն�A_(�v��A`V?�O�Aa�O@gQAa�p�HAb��O�=aAc�>B��eAdwy�QNAe\��/�AfG`��sAg7���ZBAh.�uw�Ai)��L�Aj+%��Ak1�sϸ�Al=�{��AmN�^��CAneJ.T�Ao��q��ApPm���0Ap����VfAqw�b_�xArQ�c�Ar�����AsDO�r�qAs�N׍E        ?����s�?�,"��\�?��0s��@	��k�I�@��C�γ@$z\���?@.�R��_@5ro�If�@<�n�C@BW�H�a@F� w��@K����@P�g�r,�@S�4hF�@W(T=\��@Z�+���J@^�h��D2@aX�4oR@c��v>��@e�؅�h�@hX����@j���3�2@m�� ]�~@pNOإ�w@qӭ��@sk���@u�N�`@vէ���@x��G���@z�.�C�:@|�9V��@~�P���@�e	�`�@��� ��@�����@��r }��@�/�M���@���KĵM@���6ڋ�@�NE�v��@��?]�\�@�Ut��$o@��R"ω�@��Fp�m@�����.@����(Y@�|��@�q����@�n��QN@�si`Բ�@��k��$�@������@���_�pn@��^(��@�͏t'P@�;~D��@�w�-@��X5�s@��:�Gk@��,��U�@�Y�Y]M�@�	���ɦ@����q+        ?�;)�O=<?���[��?��,ċY�@8Ņ�s@�I�:�@&�[���j@0������@7?�H��5@?!����@D`TjyY@JP˿W��@P�Ԣ�"g@U��ܨ�@[x�����@azռY@f.^��vr@lc���@q��ѫ�@v ��<:�@{�]�ޔx@�-ͷ�2@�������@���Qm�a@�*8���@��Y�B�@����r��@��︚�@���)�@��<o{u@��ԣb�@��	X/�\@����?��@�,Ng���@��Z���o@��J��@���	#`�@�1���P�@��*��ܖ@�c��@����<�@�e�f��@��ܳ	@�e�P�@� 
�Z��@�����̤@Ӱ���#�@ի��Q@�ʛ�́�@����S@�wDC�N@�']��@�߫*�j8@�Pf���@��U�nk@�r
{#�'@�$pŉ�@��4����@���9F��@�����[@���+��@��h���@�`q�@��1�̠8        ?�-�!��?𓗱�@s�����@&��N>A|@6VKm9�@B�覀w/@K���Xl@R�v�ݮ�@X����,@_�1vĦ@c�I�ğ�@g��?�p0@l�[o�&�@qO�s@t+�,� @w��*q�1@{|=�B@��+ux�@��⽬}@�]M�4Л@��`���@�6�e�:@��4v�@�U��n�@���z��G@�e�Z���@�=�q�zn@�K��C@�F�I4��@�FB�o�@��n��ۏ@��sG@z@���h��F@�Mnh�@�m?�ճ@��Sؘ�&@��ߒ�ũ@�-�Z�k@���>�D@�H|�[@��t,M@��ש���@��/��̤@��ߴ۝�@�R�y���@����m{�@�F	jH�@ý��p@�Q�M���@�g�eW@��_}vDQ@��E���@���$F7@�2_��@��@A�3�@��i�K�@�|�Gu�@��z:�=@։�E@�5杗z@���R�@��ȁֵ�@��;�D        @x�](Ш�@�r�g��@�4:>ct-@���Y�Z2@�UʔO��@������AU�Z��3A�m<��A�m�$�`Aօ���A�>�]A"�k��!A&5�-fA)�O$�K�A-�Z���A1 �5M[A3ja���A5�w�Q^A8aݬ%{BA;e�Wl�A=�����A@f��4@MAA�~S��AC���iAE/��ŐAF�|&�uAH��I�AJ����KALq���M�ANkHޏ��AP:�=�|�AQG�~&m�AR]��ی�AS{����5AT���llAUЌ���AW]�N_AXFMl �AY�F�ue�AZ�C��A\3S�d�A]��z�EA^��NւMA`4��z`A`�o<H�Aa�	�i+�Abs{h8)0Ac:����Ad�u��Ad��H\�VAe�����Af~�,K3�AgY� ^��Ah9	�~Aiw�0Aj�E��cAj�WIOAk�C�r�Al�a����Am�t��z�An�M�5��Ao��6}ʓApVö��        ?����-��?���sy�?ظ3@ٺ?������?�֎Ta
t@	�����!@Dԣ��2@��v�x�@"�_��i@'0���@-	3q�V�@1��Uʟ@5_�["�@9O��Cs�@=�)SIoE@A?%���@C�,4r�@F5c���@H��w��@K�1X3��@O�]�m@Q&�җc@R�Ob]��@T���@��@V��ZӐ�@Xv�a�])@Z��m�ƚ@\�z�-p@^�AC9=@`��N�-@aӎ�8d@co���@dn�
��@e�w�*
2@gD��L;�@h�0pqk�@jTMh�}�@k��=O�@m��R��@oXs��ռ@p���� @q|�^�!@rpiC-H!@sk����@tn�$�S3@uy���Rc@v���ŇY@w��s�K@x̓Iz�(@y�$7'��@{1���@|p�3�@}���#�@ ���@�/�y;�@���L�3@������7@�G��0�G@� �xO'@��fsJ�;@�|�H$�@�?I�$V�@�z��qC        ?{�~XN�T?����m+?��	l'-<?�y���C�@���P_t@a�	;@"�v~�pT@+S��{� @3ANq"�x@:�mt�@B9mv5�@H�*�N��@P���D!@V:���@\�u+Ê~@b�n� �U@h��yO,@nV���8@r�pm��@wG��`�-@|O����@�S��x�@�<E��i@��2�A��@��H�u@�U?m�@�n�ž�@� ��v4�@��R�+��@���A<�@����O�@���m�>�@��0�PU3@�v*Ą�c@���U�@���x��@�4����@�w��@�@�ijg5@�f=_<f@�ٵ����@�cJ���@��@�$q@��l"� �@���]��o@��&+��b@��$L��@����Y@��ĺ|@�T)#gq�@è
r��-@�����*@ƒ"hTWe@�*���(@��M���0@˪�ߜ6%@͓����@Ϛg��B@�߹���h@��
ƈ@�4��;m�@�wʹ�i@��6�6W�        ?���1K&?�j�;8��?�ΌYH��@�����@ť	�R-@&X��@0PC�}��@6�.�-�@>A��&D@C��+��@IK�$5��@P"ϑ��@TfV�U~@Y����w@`3�t�~@dNCh�f	@iS��F�8@ogɾ@sX|b�[r@w���Ic�@|�Ľ��@�S.&�aK@��~0��X@��i�1�@����C@��|�o
@���f8Y@��0�"@��%:&�W@���G��@�i��;c@����T�@�dl�t��@�<�h�6�@�U���ޑ@����a@���Z��@��)f�C@���q|j�@�	Kp�l@�z���@��A^Q�@���f�@�pX�_�@��ލ�1@ķk�t@Ɓ���"z@�f���"@�h1ڒ�@̅�'�f@��(jF�R@Ћ��@���Єi@�����@�jM��s@���PVO�@�KE�L��@�ӂ���@�k��Ӝ�@���d�F@��lW��@ߕF�xo]@�V�
E�        @GdA$[�f@�A�d@y+@���ë@�5T��V@��f��@�¯�^�<@�u"�X+@�n�Tj�@����{{@�&�E�[�@�7�%M�@���*�a�@����w��A�mOfaA�V��A�?��#A
�\�M:AU��A��un?A�<�'��AoJ-K�Ae��:[�Ao&_i��A�6���A�����A��
�|A �@��FA!�Ѯ�3A#Q/��ZA$`��w�A%�=i�:vA'U~@��A(w�\�,OA)�!���A+kebZ2A,�A8��:A.�n3���A0�g�A0��[�%�A1�;>��
A2�@V%O�A3�Z�ٽA4����A5���!MA6�Ǔ��A7��i�=A8�_�qA9�����A:��8�dA<�5ߖ�A=I[K�6A>�N+���A?�n&!A@�9d|AA2�H�%AA�W����AB���ǜ�ACB�����AC�� ��pAD����AEl�RiqAF)�F���AF�,���        ?~x���$?��$L�?�J<7{�?��F�p�
@�f�B6@��;�Dm@dz	ѭP@��R�O�@%W�;L�@+��]�#@1Yҡ�@5�*.r�@:0�%-�@?H]���@Bs����@E�U}�{@H�,?Y�6@L���7W%@PRh�`��@R�QEx��@T�墣v@Wv�o�%E@Z<V�ZZ@]6V�D@`2����@a�EFxT@c���=5@e����*@g��+)�@i�7b�@k��/��+@nS�hBρ@pe�RۆA@q�8�F�f@s�W/��@t|d�6$�@u�˙8u�@w��~�@y=A�{�[@z�,˹Z�@|Ӛ-F�@~�3���@�cK[�-@�r+�W)	@����A�@���3uy@��p7en@�,���'Z@�{��S�@�הz��@�@.-�@�����te@�5��z@��Z  @�+T��@����ʒ@��ԸC�;@��=#���@���?�cM@�d(u�3]@�H���@�0���L!@�6�S#A        ?g���TK?�̸ky%�?�Z7W4�?�U�7�?��@��@���@Y��@!�@�-�|@$�D�gM�@.���*��@6*G<�ܬ@?�)�WmS@F��3?�@O��G作@V>�����@^�s��@d�՛ʲ�@k��fE��@rM���A�@w�$��@~��pdSJ@����!F@��4�@�����0�@�ȮN�A�@���j@���sD@���ܥ��@��H)���@�6��,2p@�0p�Q��@��J(o@�K �U+�@����2I@���o@�aBK���@�\jT�@�~]�JZ�@ç���X@� }���@ȋ�	^c|@�Lok��@�E�ȵ�@нU��@�w����:@�Se�Ud@�R��Ӕ�@�w�Z���@�����G@�9�>Ů�@�۔��S@@�U�E\P�@��o���@�nk�\�7@�!�Mcm7@��Qc��@��z2�%@��>�JS�@����d!@�)[��E@�]%�(�o@���@@��ӹe        ?>fqww�d?v���?�вǨ�o?��#Z�+?��2��I?��1	 m{?�T�	ߪ�?��y{�H�@�+��=@��*{7@'uJ8@%9�g�@/����Q�@78��-�@@bD"W�l@F����@N3��xlX@S�K|5�@Y�����R@`:��$�@dJq�P5w@i
Kg�@n�����@rp�ϡN@v�+�;3@z*@X��@~����@� �^9@���(���@�$_�@�����k�@����Q@����N�@�]_f'<6@���8�@�����w�@��e��\�@��P˯�@�Պ��w�@��<w��@�ϣ��j�@�y�^��@�c�9�;�@��h��8@���.�E�@�@��ED[@���k׼@�lb6]�i@�)��;@����@��! �!%@�hx��q@�@�)��@�K��@��2��@��"�$0z@�?���o @ź�aq�@�Li\�
d@��jvg�@ʹ�O�;@̗�
�P:@Α��        @5�@.�X�@vQ�u���@�l�x₌@������R@�թ�@�<�!7�@��0��0�@�
�qV�@��XE�@��G@�@�n.��g@�c�9�@��Ȟ��@��u���A�k�TWA�%N{%�A�y�VAC�O�A�����Ad��EA~Oj�+A���,O@A)��.OhA�P�өA~��A�A 6q.���A!��� J!A#k�e�p�A%+L�|9!A'O[�I�A(����QPA+�`%'�A-0��L�5A/yfֺ�zA0��:�A25��_\A3�o�PF�A4�й�u~A6r�_]�A8K��[�A9����A;fٲr!�A=8јB�bA?!1���A@�K��t�AA����8YAB�����AC�<����AE	�0n\�AFG��&6`AG�R����AH�t��[AJP�1
rAK�Ȁ�tAM=-]O�(AN��u�vAP+�30��AP�Ew���AQ�
�q�AR�󳼠�AS�� �ĚATh%�_��AUPv��ή        ?r�t8[N?��$��f?�`�R�M_?�.f�}�?��鰙A?�E�3�n�@G	�(-�@Ału��@{17@p"�{�[@ �l�a3@$�;N�X@)}��w+5@.v�}@1��~V��@4���ꂴ@8F()'�;@;���R@?�/l�1
@A�v�U�@D-򔐙@F��+]�P@I3��Ⱥ8@L #���p@O"'��A@Q\�/�U@R�'��2@T�h��3�@V���[�@X��t��@[C��ر@]��
3s@`A�T�ʻ@a�CD.�@cDwe+��@d��X+@f�gJc @h�I��#�@j�z¤��@l�S�PЊ@o@9Ōf�@p��%�@rM��&�@s��E��@uf��@wVM���@x����r@z��� �@|���M�Y@~�o�[@��+��b�@���,�|@������@�$C͂�@�Z�n�"@����@��Qu�@�l0��l�@��6��	�@�[�oRҌ@���C��@�{�֘L�@���`B"\        ?���S�	?Vv�����?~���Y�m?���4I�?�n�����?�>�(�^�?���?�sՌj`@I�d *,@�Z�O�n@"��E��_@/�C�e�@:��#�@D_5v��X@N�����/@V,�a�l�@_"!�@e:!�s$�@l1a[:�X@rH��*��@w8�G��@|𮅨�Q@��T\M�C@�s��{ @���eo�8@�N;:�@�Ú@�6�@��(miP�@����.@�zhś�0@�lA�V_@���4_�@�@b���@��u�y��@��<b��@��}��F�@��ш���@��Vv�B@��7�G�%@��8��$@����#g@�F曾�@�g���[L@���l�¿@��ƫ��[@�5���@ð/S`@�=��L>�@�ު��Â@ȓ�5©5@�^���@�=�S1�?@�4Ii���@�!��g�@�4D[9+@�S���.Q@Ӏ�&_�@Ի%!g��@��.�r@�\�|��@�Ý���@�;�����@�ĉD,s        ??H7An0�?u�͘ϼl?��ĺE��?�WM��2?��;�(Mb?�� ��n?���Y?�{��hO@�8�!@\@;���M�@3u��� @'�Q`�#�@2�����A@<���Ng@E+�-@NfS�b.@UC@��k@]	a�i��@ce'���@ie�(�Pl@pU�*@�@t�5I��A@y�d� ��@�uW3@�S ��F�@�G��6*�@�ȗ��,�@�p>����@�Mg�nH @���Fι�@�&��@�+qr��@�3��m��@��v�v�E@�>��[�@�!�*�$�@�F�D<q@��ʎ:��@��80Ղ�@����@��`�j|�@�0ا��@@��TFɢj@�]�j�"@�.���@��䑇a@�DQ+Ύ�@��y�p�B@��.?��@����}�@��mXD�4@��kk�@�:�!�P@��x��Y�@���4R@�_(˲��@Կ�_�)�@�1%�
o�@״UӅ)@�H�*b�@��x_�*r@ܫJ'DH�@�y�rw�        @%�i8H�@\��e@EZ@}¿���@�4��7@����@�CV��W@�LlcFz@�:��$@������@@�[�U�� @���Ǚ@���+(�@�}/�p;�@���j�f�@�4K�U��@����@��SE���@�/��Id�@��E�@�6"o�Q�@��� �@�$��@�}Q\dgA�-a���A�%�}A����=A�`�&q�A
�oDAC*�c��A �
l��A��Q�1A��FƁAkk8}߸Ax�`.�bA�i�6�A�@,ݫA�B�*z�A ��n*�xA"*��uA#�\72�A%~�s�A'YnJ
MMA)W�v���A+x���N�A-�����A0#��f0A1T_�Z�A2�u�3\{A4
����A5|9&mοA6��G�A8�S���A:0v���nA;�HV�q�A=����S2A?qr�"�qA@�Kf VpAA����6AB�v�8�AC�ӽ��AD������AEɩ�(6�AF�F��