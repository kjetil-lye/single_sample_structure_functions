CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T102317        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              @f�g��@Pw�p�� @o6Ҁ�7�@�,9q��@�	�(�N@�	j\��@��~��@�vr���@�j�����@�e�Dax@�B�GL�@���ų	@�#��ac9@ǔ�c�m@�RCd���@�[����@���pt�&@�)y�Ɇ@֟]�Ȍ@�::'�<@����
�@�ܵ�޷@�����
@�Lឫ@�$Un-c@�����J@�ُ@�TU��t�@�$+����@��@FݍF@���b��W@�h�(��@�f���X�@�l�8�@�z^Ï��@���G��C@���d:��@��d]r@�	�Q9@�E�>��@��A��j�@�����@�:>p�:@����W�A $s�L�A �<���A��KI�AE�yG5A�mb��A���|EpA��C}�A�KH5rAm�n��WAS��n�$A@�U=A	2FI���A
*���L�A)F�ۜUA.$0�A�A9�X���AL��NdAgR�A�AER��"        ?�?O�}ȁ@6�9��@Ws3��)@o�A��@����8I�@������@�j��Y�@��
���/@�M`���@��.8�BB@�����!�@˥��~p�@Ұڷ.�*@د�O�y�@����@�WKx���@���{�Q@'�2@�A��H�-@�Et#��=@����HN�A ��u|A�MB�A���CA
� Az�Aθ����A��5���A]-���AB@_) Au#��3"A��ǣ�A �md���A#	dܯ�A%V6�3'�A'�QĮA*����8�A-h*b/�A0?yZ�={A1�K6�A3�Y�N�iA5{z�aSA7l�*�?A9v63�yA;���w��A=�Y+�CA@,��#AAEm�B�lAB�r<AC�3���AE(��j�=AF�\վqAG�C�-}�AIq�x��EAJ�@���AL���!��AN/D��AO��roeAP��wpAQ��NgAARv%�AS_ɱ�J�ATPk|�.AUHfe��]        @CLQ��@u��;�x@��4o�f@����h�@�mg�=�@�㇤��@���{�;@��F@ɝ�*<^�@і����@��l����@�)�zZ�@���r%M@�B݋/c�@�L��AN�@�f�|��@���g�dA�s�EA��$b�-AG�r��A@mE��xA�rN��wA��)'fA�7\�A!����A$~$�4A'�D{#��A+\|�q�A/H����+A1�Y���xA4!)�#A6�Q%�.�A91\�楶A<��0RhA?�����AA�G�ABʴ���AD��%hcuAFse�g@�AHl�^��AJf����AL��R�ɕAN��.�JvAP�?�L7�AQ���{�AS ��Y�ATm�^m�AU�N�	q/AW&��-�AX������AZ��X��A[����A]���9A^������A`)!?��7Aa�-CڇAa���LAb�t��HAc�)�ǁhAd�T���Ae���]��Af�1�=Ag�oK�         AMrvk)TAE���(fAbwջ6#At�{��m�A�(,`?n6A��!L7	�A�`�賛A�f╨jA��z�'^A��Q�Y�_A�M����dA�b�E3�HA���PC�7A�0O�]��A���L5MA�8�SZ�=A��d(tS�A���-^UA��o�r�A�u��SepA�Qy�(qA���i��}Aơ���k^A�~��V�FA�h]	���A�Zmo"�A�P{ђA�#�f��BA��A�6A�@��UA��w��A�(
8�dA�;��K�4A�[����A׊�7��>A���!v�A����[A�m�;��A��e�g�A�F8i���A�µA�!�Aऽc�c�A�mq�PvA�9����A�oϘ'YA��v�i6�A�Y��A�w"6܉A�Z��9�A�n��[vA�b8�=/FA�]!�w&A�^�����A�gPs���A�u��9��A�اx\A�41A�%�]A�m�.��9A����4�A�1�}f�A�%:'��@A��i���        @D`p�e6@F��s@c$��Gw�@u�x�pmq@���L�e@��Ho�N\@���ӥ�@�K�^ƺ@�.��L�@�`"x�l@�B��m�@���� NA@��ޯ s@���}K @íW����@Ƙ)�@ɪ��>�@���v1�@�)I�U?�@��Q%��@��[�7�<@��G,��@���KG�g@�1�r�E@�{ߍ�	�@��_-]��@ग़�ُ@���&v>@�/�HM�9@䁜,5�@��'Ƚ�@�C�~��@�M�`��@�8Dk��@��j;��5@�v��@n@�9����@��)םlS@�D���x@�sN�>�@�֯g��@���Rq@��	pI��@�b���@�J% P@��p��!�@��M�j��@�Z���@�s9�!5@��B�CA =��A �g��~A}4:lx)A2jo��A���1*�A�ʜ��3AZ#T�h8A�t��AѮl��A�ΘDAPj��:A�&��Aם�p!�        @���k�F@@����c�@]঻��@p�����@}�p����@�l2�:"z@�'���@�j�1�@�0G��@���@��]z
4�@���{xD@���x2@�#6�!E�@�",33&�@д(:�vv@���9�M@�C�Uۺ�@�1�F2�@�ŭ˨6�@��.�+L@�mK�,@�T4�Ir@��(�O@�X����@� J��@���=�ϪA��B�<A��Am�
|A	����A��^v�A���,t�A!�َLA��1r��A�_�J�A����8�A�iX��A�e�FAS*�E,A�� EA! �J�OAA"oU�ºA#�S��_A%243J�A&��[/A(*�s��A)��>��A+^oP獧A-�)�
�A.��2gA0Q���82A1C}��@A2>TH3_sA3Bb�gJLA4O�G�>lA5f�H&m*A6����0A7�%���QA8�8~q!�A:#�z�[�A;i�h���A<��j���        ?��"/{h@(B0�Z.@F�i��#9@]9yn	yI@n�qxyC�@}��Բ�@�ae�M@��Al4�@��N)/Y@�v�;:�@����
�*@�5�	��<@�%��"]@�87Ɛ��@њ�'O�@�)/�@���K� @�𴤾�t@��{t@�䮌��@�m�p�C@��7�{�Z@�TNU�QI@�8-6x�A 1���Ai�dXpcA�*��#AA�O�BA	�Y;cA��Ѵ�QA�vڴ�AX��F�HA�t�S��A�Ao�A�q��$|AoM���SAt��x�A�'�3��Aӎ�A;�A ��q�ƘA!�(��~�A#��LA$t��y}A%�)9�?�A'R��7�A(����	iA*lGZk�AA,N����A-������A/�D�'Z9A0��\�yA1�|i��A2� ܰw�A3��B�8�A4��W��A5��hV7A6���J�hA7��H�M A8�ur�nA:ǡ!6MA;E�����A<�M~��A=��_�p        @�_�IP��A%@!ļ�ACR����vAUϰ�+lAc�k�ė�An��|l0Av;�?�SOA~K��4�A���V�>FA��t�GA�WA�i�A�&��kA�Ro�+�sA���{��A�6�P*@vA��֙�A���"s�A���ZE�A��8�}|A�:7�*�A��/8VuA��bV�s.A�V�&A�A��?���A�:
��A�������A��w�}�	A�@?���A����ؐ�A��a)�A�})C�<�A��a��s�A����]yA�A�1A�^Q߈j�A�<k���A�&>T<H�A��PC�A��(��A�/7b��"A�JD�e�<A�o�Ԣc�AȞ�W|�A�֙�O�A�h�a-�A�]�5w��Aͭ�\4A�;`�C{A�0z9gA��Fy���Aє�3��A�JA��d�A�7��w"Aӹ��|��A�s���k%A�/}���A����&w3A֫�:s	A�l� /@�A�.�Y۰sA��E��F�AٷK���A�}�}�$N        ?����>@0�͝�@N����@a�U���@pl�a@z��zT�@��D�`X=@���7dM@���r�?�@��e��@�U_>�X�@���I�t@���kO&�@��Z=�@���A���@����vU@��i�<�@���R�MZ@�,�sȱ�@�����@�䂂�:@����y@�'�U�uS@�r-��@�םB�@�W��w�@���R�@�S;ݬ�@Һ�]r��@�/v�hq@ձ�d'�@�@����@��ߡi[�@ڈ��Q�@�A2�$�@�mF�$@���R/@���'�&@��lq�@��|�]/�@���!�c@��A>*�@��(N��@�����~@�6��PQ@�^�<h@ꋫ��Q@뾘����@��Z`a8�@�2�p|C�@�s���!=@�\��s^\@�Ğ7�@�ړc@�XpR��W@��$�3@�$ږ�@�tlF�Z}@�/�He[�@��;s��l@��_��%e@�yd�b�Y@�DN1=��        ?�d@�q�@'7�`��@H��O�>^@`m�lDL@q�*����@�;|.�D<@�y`��� @�kP�$�2@�㻢��
@�`J����@�~����@�fv��@�)�)BP�@����@�>�v֊@�:A69 �@�h���I@��/��@�!@�M�^@�����@��W��
-A�{��-9AEM���hA
p�9liA4/��A9���9�A�c(C�AK���A�⨏qA|���s�Ae���UA ��/��2A"LP��^A#�,�nA%��[�A'i:��A)>�%�M�A+%��b��A-d�=d�A/-�\���A0�
����A1Ǡ=BX�A2�7��A4-�a�lA5v�E��A6�}��1,A87�~0#A9� #��A;5��j�A<�J���5A>k��%rA@x1�A@�"��*AA�c�7�AB��K���AC�J5%�AD�w�I�AEq+>�@AFd]d��AGY��uAHQ����AIL��AJG�oPT        @�@K@�_��@iʞPĀ@N@\C�@�ǽ�C@��n�Cs@�����?�@��P��@���"o��@��i�XP�@�2ȸ��@Ɨ��ۍm@�8f�2�@ҟ}H��@�jmn^�E@�0�˿�@��=��@�.���@���J3�t@�I�B�@���Û0}@�鰛O@�(��I��@���+l.�@��)ZbA�_Y�+ZAL5��A�Gm*�A	�7S��?A��DybA��V��A�X��6/A�>�WCA�^d TA&A�2��A�ʀ�dAG,�o2�A ��,�A!�oh�A#G�D�EA%�ƹaA&���n��A(�@4��/A+&�F���A-l�Aw��A/�ϒh��A1*���tA2{�WA3�K�9~6A5L��X*A6�8��9�A8`�-��>A:m����A;�p�(�A=��|�ZA?^D9�4_A@�F��\AA��0��AB�2�xLkAC��Vdj�AD��B��AF�~���AG6�L"9�        @�(����AAl��ǲA$s:Z��A7��'�/+AE�s���AQ/&P�AY��i�AaK1����Af�D�B8Am2�`�dAr3!�ͮAv=)\�q`Az�^`=_�A�8x�A�����q�A�����A��B��A�r>��A��A��A�&����A�M����A��[�K��A���7ox*A�z��A��.beA�l��8�eA�ٺ�J>BA�T��ۑ�A����E6A�r
R��A�tZ��A��H^NA��� �P/A�M��hA�(����A���6�`XA���$֍�A��]"d��A���?�?A���GٗA��'�r�YA��z�?nyA�AY� A�E��zA����vb@A�����>A�X�A�m;F�6YA��N��`A������$A�C�
�,tA���v�w�A¬F�2&KA�db�
�FA�����A�ޔ�ѨAš?(ܥSA�gܺ�+A�2�a_6A�F�d�A��(^$~�Aɫ,��LAʆM�N��        ?��5f���@#-�0>v.@B�lJf,@V��|���@e�ô8~�@q׆ywxN@zӊBo^�@��Q?��k@�\�8.G@�m��h��@�� ���@��¬�WT@��
L5�@���h��@���/�$@���xӈ@��;�M|@�2�њp@���p}x@����~��@�x�>6�@�_q<�@�P�t��@������@ƻ�Q/��@����(t�@�Qsp��y@Љ9?��@ғx����@��>�vu@�'�^Ik:@ٲ1x�6z@�g��P�@�H��QkO@�*���&@��̼�s @�z�����@�BwS1]�@��M��n@��[Y�@�S���>@�&�TRa@�&�!�@�As)���@�d����C@�+�'>�@���m�R@����B��@�6��Ѽ@�z���z @�Ĝ
�̷@�.��_@�i_E>A�@��ˎ�\@�$���A D��9��A �R���eA�PI�Aic 8cEA$�� ��A���QA����
Ac�f��        ?Ҙ=kZ�<@V5��.@=]����@V�v�.Ut@jǖJں@{a=�>�@��sd(� @����f�@�2p��@�>H8h6�@��A45�@¾�����@�ȁ"1�M@�	���:@�'�����@�Kaݕ�@��xF��@����N�@���6O@�.�aa�dA ˆ�q[Aq�~���A�G��E�A$�����Aa�%@}A�,l�rA����A/l�A8A�ʜY��A �y����A"�{5MȾA$��< L�A'�ym�A)|OX�3TA+�#�pA.�1��A0�5wO.iA2M�r��A3��g�;A5#j��t.A6�"1� �A8i�4mֶA:#�z��,A;��m�+oA=ų�)��A?���L��A@��AA�% ��yAB�;P�{AC�����KAE�?��AFC�a�bAGu�� u�AH���@
AI������AKF��~�AL�	AN�=�|AO{i�<:AP}�T�AQD"��,%AR엔�AR�Ý?�h        ?��4�!�@W��@A_|�Mb,@]�yk��@ucFvO��@������@��,7�O@���]��@�~�NB�]@�y�Sre@�sL�I�I@�C"1�е@�;"���@�c�(~@�Ww
�b@��et��@�7�ߛ1@�7s����@���-ė�@���(_O@�H��Jz�A_�u�A��5���A	L��;��A� ��AF�r/��Af��A/羃�A��g��6A`�~�@A!6h���A#aF��A%���_��A("@���A*��twA-y5��A01	(cA1��\(��A3^F��x�A5Rd���A6���C�BA8������A:�!��8A=P��{�A?U�!�'�A@��/��AB$P9��DAC|�MH�AD��^�7AFjp]�vUAHx"͊AI���Q�2AKv��� @AMUYLQrAOL2��ftAP���]"7AQ�>;�AR��o�LAT����AUI���peAV��o�z�AW��sW�AY?�Wg+�        @��Lvˤ@�'~��]A����A*�!�A+L~�}A6r�+L�A@������AG�D���AP2}O���AU*LW�$AZ����X�A`�]/��Ad��#qYAi;��}�pAn^CU1�*ArY[��AuiS�CM�Ay!�V�pA}Q)���wA� �����A��`s���A�|K�m��A���ž�lA�
o�רWA�]dy�wA�Zta �A�~���ZiA������A�H���;A���.৙A��p�ۚqA����ԾA�����$�A�Q^�n��A�%C*qI!A��T=E�A���a�IA�#ܗ?-�A�J<���A�@ݢ6�A�d�:�1A���:8~"A���i�I�A��!��2A�8��ʹUA�|վM
7A��TX�CA��7�4�A�h(s�ϬA�����%rA���O�A�{3�nA�n�X�F�A�!��-A��xB��ABa�crA�?��:MQA��L��T�Aĭ��~��A�e���[A�?@_>A���X\�Aǖ���+�        @
@0�ϵ@@ �+�@]K�@8r@p�fI*m�@��h%�@��ʦ%�@�1n��d@���Qtd@�z�+�j@������@��qч�@�p_n~7p@��$�f�d@���a� @��S�o0�@�l,%�"n@��P.���@��<߶�@�8��=�@Ǡq�s[d@�$�/�%@��\@��8@�~�_c@�)���N
@ҡ,x��@�$�=�Z�@մ��(i�@�Q���z�@��v���@ڲ���@�x�V�@�L���f"@����i@�9���e@�^�z�w@��L[��@�.E`/#	@�J|�hK@�o��g�@��J�~@����9��@�!A���u@�s����@���?'@�?�M	�&@��rX�@�Ǥ�G�@�o�;��H@�EJƮ��@�"�Σ��@�	P#B@����w/�@��]r5�@��UV�U@��`e���@�^ֵ=�@��E�V�@�7�9���@�\���@���qjr@������@��p�v��A �XM ��        @'A+����@a�F@S| @�a�u���@��|R��
@�K� ��@�x��� �@����1��@�	v���O@Ǘ��!s@���W��@� k�$�m@�F��?-@�vɧz��@��2԰�@둘�ޗ>@�⟘?�@��B�:Hj@�µ5�O@���7��A���4l�A�����A9���Aq�(A+��� �A��{�&�A*��z��A��
�sA<�p�fHA�:z��A!80�e�A#;��sA%aB�u~ZA'���DA*�S�!JA,������A/a��+dQA1 V)@f7A2��|�Q�A4;hO��A5�%�c*�A7�mj�A9{Sr��
A;c�a�A=`����FA?q�;��A@ʒn�X�AA�
s���AC
��e&�AD8.K*�AEn9��lAF�_���"AG�'5��AI?6*"M�AJ������AK�u��r�AMS�0thkAN�4w���AP�~�1APڟ����AQ�E��:ARi ����AS8R�E�vAT�FwhV        @s�[X�m@La���r-@k�,��s�@�*9�7#�@���!;�@�aМM=@���o�h@�\ɬ�5@��OJ(��@�hWiet@���;+�@����@�h��	�@�Z���e@����֧$@ٝa��ڪ@��u��@�쓣�@�1X��@�@!R�G�@��Z?��U@��v?JO@��d +@��r�F�@�u��%W�@�Fo�:vA�~�%��A�f<��At2�qМA	��?��AǄ���A!��ƞA?)dX��AV|�GANF���Ag:=�A_�����A�f�v$Ag�0�D�A ��*W�>A"`x8�BA#����ZGA%Xx$�$�A'�F�%�A(��p��A*�⽗A- v���A/'W-�eA0�Eu��A1��>%@A3 `�A4lʤ/��A5ɨ	�ةA77}�/cPA8�1}���A:I¦&��A;�:�)īA=��ÙКA?|��5гA@�����AA�����AB�����ACќ0�-�        @��?���`A#�;R�;AB��31�*AU��f�KAc��E�AnطaSkAvL6R�3�A~U�� ��A��� SA�ے���QA��dV��A�TB�CA�A���:��A�8��A�|J�,�A����� A���M��MA��D�L��A�v;��!A�kYc��A����@uSA�v��S�PA����r�A� �����A��[�lA�dE�2A���Ҵ�A��bzۥ�A�a����A�S���,yA�Y�<!�GA�9���C�A�N�4��A�lQ��rAÑ��V�Aľ�h�kSA��
`a�\A�2,0�#A�y�|�A�ʥ�Y�A�&F6�HA̍�\�YA���#m:qA�%�E�EAІ
��]A�S�Y��A�)OO�;A�-�k�A��<R�A�؁�2�WA����>�GA��u��fA��� ��uA��@�Y,�A��r�A�
/A"�A�*�N<�A�QzD��A�}�cX�A߮��P��A�r�{�hA���B�A����        @B�P	��@nKD8��@�-����@�]�B��@���A�y@���E&j@�*�c�F@�D�/X@�dY���@�x�'�@ʸ�d��Q@�h�8f@���kv2@������l@�;!*��@�zٺ~��@ڽ<oE�@�?�IǱ@�[;)���@��v[P�@�:�3Y�@�d�, �@�D[U�u@�n!wq@����?�@���t;��@�}E�Un@@�����@����.@�b���@�	�N@�w����@�gJi8@�`�qE3L@�e��u�@�v�{��L@��!���@��R9�9�@��h�jX�@�%��V�+@�d��(N6@��{xK̾@��W���9@�K�����A S��HAJhqs�A�T� ��Ax�N�o�A8�0NA���cAA����B�A�Vd���A[����fA)W!�n@A��nH:wA��8d4$A	��G`gA
l�/u�NAF�VE�A&�R�$�A�6�V�A�`�q>�A��Dѣ�        @Q�md��@�S�n��@��
@��7~�@�Q,��@�@�u����W@ñ�),��@�6�^�m�@��
�t@ճV�h֐@�UeԂ��@��漈e@�����@��d���-@�
7vgl@�J�쑈@�^z�	_@�2� �bSA �\?ALu��_A/� ���A�ש_z�A߀�^�A���6A�`*�h	A���L�jA���ƝA!�1$ȫA$$��2�A&�6����A*�7��A-~���A0��F�wA2����;A4��\UA7_Ё��6A9�;5ÿA<�NB7	�A?�b3���AA������AC5%��pZAD�����AF�&h�AH�@��]oAJ��'�ΤAM���3�AOU�ĵ�kAP�H5<��AR
��#ASH�Ϛ�AT��6��AU�ȕ@?AW<�IlBAX�~�:�AZ�[9�rA[��=h 2A]J����A^�P�!�jA`�N�MA`�<�N�(Aa�ܴ� �Ab��Ż~�Ac�ǲ��        @5�b��h@_�r��RA@w7�ͤ��@��k"nx�@����֌�@�a�Z-�@��!j�-@����*�@���h@�W!cR��@����M�@��9;=d�@�P��l�@ԫ�4K�@�0`VRf@�bqV�H�@�>�4�0@財���L@���ｑ�@��-�d�@��}|��@��4��+�@��HصS�A �?����A�0f��A��G��A���P�A��ןz�AU>Q��A����gA����&_A��)x�A�,!	�AfU���jAm�r�A����"�A!e~��'A"�%s���A$� ����A&y��gEA(a+�
��A*f��F�A,�RԦ?A.�E���aA0���m�A1Ё�A3a<��A4v$�&��A5�?�-��A7Q�J�"A8��oof�A:\)�Ƌ�A;�-��nA=��u}I\A?;@b/+�A@v�UL{IAAT�W���AB6�Y�,CAC�\�=AD
��y$�AD��)�?~AE��?��AF��ވ^+        A:Lv̖q�Ad�y.?$�A����A��w�[4jA�PҢ~�7A�}~��fdA���/���A�b���[A��WM�
�A�A@��zA��=`�A��xW'xA�f�e���A������@AɎG;�[A�>�NA�����A��!O0�A�s-ϜV,A�����AեT�YVA�X8��*A��ys�lA��`ߑH�A��]�<�A�ۤi��A�wD>��fAኾ����A�����A���Z�A���z��:A�7/��@>A�{L���A�ʣZo��A�%a��qA��s��kA��dV�<A�m�}��A��͆��KA�	�
�0A�h�3� �A�"xU �oA��h�g5A�AȺ�A�M��I��A��#�q�A���I�*A��K��	A�G<	-cA�q�Z�=A����^��A��l���A�n�ao.�A�E<���A�#V�A�
x�m%�A��'�0�A��b�L-�B �'���B �l2�WB"����cB��M7�Bc1        @� �[@Dsq��h�@b�@r)T�@u{j����@����K@���9�t@�M3���@�I=3�Ff@����t�@�B	�x��@��隘l�@���=[v/@���93%@����n�]@�����@�"k~]�@Ƹ�j���@�k���@�<��G@�+���!^@��ۺ`;@ҳӤ�@�\>@<�@��gro@��O:��a@���\&��@�ƞ+9�@��{��]@�	�Ӭ#@�4I�b4@�oa{0�z@���x�@�=�GG@�&�%��@�
��!@�q��Pj@�:e9jp�@��@re�@�' �4(@�1����@�h���v@�	��=�@�����.}@���U�}�@�n3�@��?�@�=�{I2@�8g<���@�X�$bd@���7a@���)@��Dz�?�@�,��+\@�z��tBA ifLqzA�6v�OA��p	!�A������ATX��r�A-F��A�DG�A��q4�A�|�)��        @��#z�s@C��$Ho�@hD�T�@�N�Kq/@�Jw��w@�5�}4��@�����m�@����<�@�:�+�/@�)$O0�@՛�QM6�@��VJ��@�{�;Zx@�f�͓�@�jSX��@��6�>@�_�d~�R@��a)o]�A))�k�HAO��A�s�/\lA�5���ANG~�ZA�+���
A�3�xbA�k�j��A��b��A�Ӑ���A ��2�+�A"{�X��WA$��_�ʩA&��P�A).�vAA+�Y��'{A.:���A0�9�v�A2��1SpA3�,�Q|�A5h�nY&A79��6$A9$!�XF�A;(k��GA=F�X�v�A?~�����A@�^��
AB�����ACb�)$HAD��jd AF� 1�;AG�>.^�AH��@\oAJ�4���AL3Ȋ��AM�W��3�AOa0�,AP�rP'AQl؁�<�ARR٦��AS=�'�1�AT-�To�AU"x �AV�X��uAW�z��$        ?��I�m��@/�T���
@R �qi�@j!q�޲Y@}צ�w�v@�w_�	�@�/����@�� 2�|v@�ct�#@�xP\wf@��G�F�@�͟�e�@�q�N�"@��ʆ���@��Z3�a@���1���@�e��ޛ@�QP7,��@������^@����W�@��l�ԟA5߻���A��o�2Awإ�1�A	tx~�WA���C��A���9AV#��A$G�@�Al���}A�N%}JA��]�A��݅5A �;�aA"~�􉐩A$GW�f�A&*��'�A((ic3}�A*?qQ1��A,n5�A.�Bl�eA0�V��<A1�&b#�JA3	>�|A4X}�'�A5��M�ԻA7>j��A8������A9��y��A;w ��A<�EB9A>��%eq�A@j]�T;A@�%:Á�AA�p`O��AB�GD��ACw���hAD[}N@�AEC��.L'AF0���ZAG"�AH�FA��AIh�6>m        @��� hA :u�V�`A>�!�w�AR|�'��A`�����Aj�wͱp�At�w���A|X���]A���0ћA�Z�s'�A���㠵�A��@�S�	A�����A��o�� A���*$�A���@c+A��Ox���A��N=�!A�YR��A���d	HA�(�A�,�A����Ls�A��,��o�A�5�ih��A�����A�u���8�A�Dه#�4A�5���~eA�I�v�ilA�Y~��A�ժ}��'A�$��i�DA�k�T�:Aý���g�A��4ɹA�{���:mA��w����A�T�K��qA���i�y"A�B5�'%A���V)�A�FG}���A�iX����A�3\G���A�4>�A���B�Aӧ�7gAԀ�����A�]49\�A�>DjD��A�$��G�A�@��A������A� �`o��A�����A��m�58A�6��k�+A�]�kѸ�AߎBT�#A�c�F�J[A���3I�A��l�~BA�SP�:�        @%Z�/uڎ@Z�'�?�P@wHa�o�@�а����@����]�@�ܷX.]�@��#�!��@���Y@�8g�[l@���	={.@�i�x�7�@�y5�ʴ@�$
6>�@�Ea`�<@��=Y�]�@��mɵ�@�f�l���@�Cl�D@�����6@Ⓑ���_@��58H@�C�O(�@�I۵e@�3���VQ@��4�@���݂�@�8$1J"@�x��g@�R��4��@�E����@�P:��}]@�r�`�}@����GA ���+A��(�m�A��t�`AQ�H�A��̃:A"�>[�A�'�@(wA
2�,��AՍx`�|A�9hMAWy��A�у`�A�RgM�NA�~��j�A����4�A긧�ieA(8�:]Ay�um�fA�݇��A]mA�fbA�X���A��|̟AP�pEA �k�|wA!}�epA"u/��A#tJ���A$z���ϵA%�X%�HpA&��3���        @(���@c����@��C�!�m@�T��-w@��`��M@�|�
FN~@�m��P~@�m���@�GY�@�J��u�@�]��hA H����VAR�@�XA>v:�ӘA�w�OCAd=@�EA#0'$5��A(���IQ�A/#�l��NA3iӦ��6A7承�]�A=�C�&�AA������AD�Z��qAH�\��jALĭ�'m�AP��ߑ�AS%���AU�A�ÍAX���N2A[���c��A_ V�Q�Aa;m�h^�Ac*ј��Ae	��hAg���CAiU&g�YSAk��&��	An)��Z,{Apd �]Aq�x��DkAs4����AAt�Q&)"qAvA��P�Aw���o5Ayy�D��A{�Է��A|�N��W-A~cһX�A�
�P��A��W�d�A�y���tzA�&���.A���eA^aA�V��i��A��8yL��A�Kv��A��� �CA��%)A�U�)^�A�����A���\!�*A��nF��        @^:=c��
@�Φ3��@�Y?�#\@�Jx| 5@�I>�H@�5Ck�y@ޓ0���@��O��˟@�AQ���@�4wKlך@�Z����2A ��+�sA:W���A
Uz޻IA��,�SA�����A`^���Aɔn}حA g�P~��A#B~���A&~�¬�A*&����A.@(3>fA1i�5�#�A3�g�B�6A6�)�مA9��&�A=����A@Yt���ABQΪq~�ADy�_��AFՈ/�kAIiz>ŸaAL7��X4�AOA����AQE�E'�AS
:1rAT��q�AV������AY2.��A[�Tw2A^���^A`c�U�Aa��8��AcVSԀ`?Ad��G1�sAf��HWs�Aha�T]��Aj3�ٓ��Al���AAm��z<��Ao�t�Ap��ڠ�TAq��Q0�Ar��&(As�f(fp�At��SP�Aug���gAv<��t�"Aw
�&��Aw�ua���Ax�k���AyKa���f        A���ŏ?AFc�+�-BAd��6��Av�%�b�'A�2��:A�ک��A�C�nr�A�$��2�A��~�zA��1���?A����]�A���W�JA�WH��KKA�{�4}*A9	�AŰ�k�OA��W�AA̼=jlq�A�P��E�A�_:���AԊ*��>DA��/I�A�Ak.��A�ֈaM�Aޖ��1I�A���í'A�N�-s`A��ݛ���A�>n�"WA�v9�y[A�V��m��A�I�g�A�O
q�<A�fX���A����6�A���MW5A�0�72LA�5��4aA�lC��VA��3�?�A��8��A�Q��OA���_��%A�'�3z��A��,{�>�A�8��
EB mj�
c�BH6�=�B-�0.`�B �#�B Q���QB01MIBQ:2��_B�L=<��B�H[&!�B
T|\�+B�aG��B�W�[�|B}��lB4Wu�-B�}���B�����B|Lٹ�        @A{��@r<�^}�@���4���@��t�>�8@����h�@��gz7fj@��[)�`@�\�U��s@ǒ)�T�@�i)��ܯ@�����5&@Յnm�
@�nX���@ݭ�3�G�@� �.7``@�VF�@�.2H	�@@��G�"�@���Ӌk�@��m[r�@���� @��ج@�s�*@�<%��i�@�ɍ}�]@��,��@����C}�@���l&c@����Z�A ��X_�A��A�^��)A)MuLU2AD�#'�&Ad�pioA�8]��+A�.Ԅ�A	�k���cA
���kA<G\��Aq���A�=j@V�A�2���A����CACnq�A���A�`[i�AX���A�{�(A���}��A�rF#�8Ar.�
�\AMt?A1SX�\A�L�i�AW�-�NAO��L1A��S�Ao�V?UA+8ÐWA=�.KAA *��h�A ����(Q        @"�8�)f@Yz����@xR��(@@��u��D
@�k�8g��@�kǷu@�Ej�H�M@����0�@�E]����@�js�펹@՟=��@�'CL�	@�N���f@�-w<�Y�@�/�T�l	@�DС@�����k�@��@���Aq%��A�m��uAA!�;ǚ�A�5
8�)A�G�4�A�dy2C�A�^��1A�TÎA!�LO��A$�?U"�A&���;A)��Vl�A,Ԕg/��A0 ��l�A1����LA3���
��A6�9O1�A8B���P�A:��D�A=���A?���]��AA4w�CAB���>AD>;:AE�E�>Y�AG0�4#r�AH�I6���AJ��J6g/ALA�7�7�ANЏ��AO��y�@�AP�E��AQ��0i�AR�I����AS�Er���AT̞$
�AU�?x��AV֍���AW��q=�AX����jlAY��.{A[�Z�ߤA\'+�׍A]@���AA^\/�2�        @F�(���v@~��S��@��thZd@�G���q@ö2�@�f����@��ȵŗ�@���hr��@���:�@���婉@��g}�@���X��A�م;�lA��N��A|x�1�AI&6ҁ�Ajo��1�A(�a|UA BF@b�A#?�ɤ�A&���%�A*#��58�A.U�DA1"@��w�A3j�
�� A5���l.^A8�F��A;sLS��A>������A@���ơAB�8�\5�AD�WuY�AF����AH�n�%��AJ��zˊAL�_�^��AO%�Ӂ�AP�U�Z5AQ�Iu��AR�:[�M-AT�H	C+AU@:� tRAVh3����AW��k�CAX�!��AY���紩A[Sc1A\9��ۿA]_cT��6A^��k_�A_���`cMA`_/�1{-A`칄�(VAazW���Ab�`�Ab�� l��Ac)$S6�Ac�1f�>AdT\��Ad��u�(Ae��/���Af.z����Af�oB%        A%��~zAX �: /VAs��}��wA���;Q�VA�� t���A�Md�nQA��6dr/A����kA�3�J�A�����kA���(TJ�A���ɱ`A����{A�Qe�8�A��(�IA���2��UA����|O�A��~?�JA�DD)�ssA؊��:�A�ߡ����A�C��T�A߲Ҙ.XA� �9kA�W�7WZA㝟ڠ"�A��q�+�A�8��HHA�].���A���c;�^A�Q��d7A�j2mA�1��-�A�>L&�A�bI���A�َ�@;�A�{k�VA�hԮ��A�3=UK{�A� �d��2A���A��A����&kA�v��N��A�L�:w,�A�$�M�A�A�����APA�؅���A����7�A��� \��A�~x�[V�A�oU���
A�l���6A�x���83B J!b��B ��7��By�	�W]B�(�B��Ow�NBc�i1��B� �bwB�y��-Bl4�D<�B D�\\�        ?����W��@.[�� �@L�ǰq��@`�9��`@o	�_�8=@x��y	TK@������@��G{��@�#��09V@���HCY@�e�Ï]�@���D5��@�u��&[@�ϒ�,�@��P���@����-�@�f&P�@�m�1�G@����|�@���.D�t@����_��@�=a�7l@�_����@�=�`�=�@�8����@�Q`lG�4@Ɉ�Q#�@��w�H2�@�Zu
]�3@�|z��A@��C�	/�@�V�"���@���o=:@։���Q@�F?�[@�+ݿ�_@�|j5l<@����	@�	��9�\@��ͣ�@�4��v��@�X"��@�UQ�/@�f7���@�,�ۃ�@�Q�3ſ@��c���@���:�@�cH|�@�&���p4@��1;��@���Ɂ@�XL!�@򇬏���@�{h���@�v����@�yZyX�@���pV@��AstT@��U��ʧ@��o��@��>dI@��r��        ?��-�<@%3��e�@H,n;ԓ@`:����@p�W��k@}���@�Z~����@�'L�7��@���(� @�[mfW��@�����@�7����+@�Ɨ��pa@�2���@ȴ�7�9@�h�gm��@ӡ�u�9g@�0���@�s���'w@����K@�6@�1s@�,0��p@���q��@�g��-�@�KZ�ul@����h�@�(|ypu�@�.ũ��A��g���A@�ލQ�A��iV��A	�J��A��o1�A#jd��UA�Dx�@A�x����A�+M��A�<_��A:�'?��A��.��A�
��A �5��CXA"5�E��A#�΍[��A%!��͘/A&����8�A(M�l"y�A)�=��GA+���T�A-}|w���A/R�d%�TA0�y��jA1���9��A2��EA�
A3�J��PA4���I{�A5�<����A6�
6��A7�Q�AcEA9 T���A:*J�vW�A;[Rg�
A<�g #        @���,��@E�q}�ڏ@d�_˖�@y"���t@�P�A/��@��e
Z��@�
���t�@��䛮�0@�fD+},^@�ԣi!@���h�@ͭ7w��@��b,�0@��C��@�r��3-/@�/�L�@�E���@�B��e��@��L;&M@�%�)��9@���i�o�@�Uh�5e�A ,Z�tAOSQ��A�����A�"q���A	o�qOAG�C�DA�
�� BA�w��AVOpC9A�=�4��A�ճΔAi��)�ANrM�AOC�H�Am��(�A�e�A!��#�A"AAM~�A#���2PA$�34	A&L�zAIA'���:I�A)C��^'A*֐X�I�A,z< $��A..�ݮ�BA/���npA0�-�Jg�A1Ӫ��?�A2�R�L�JA3ƃ&k�A4Ƿ�Y	�A5͏�2u�A6׿_҇A7���n�|A8��X�^�A:�9�A�A;$2��[�A<=��}�A=Z�J~9A>y4�        @�y�����A	{�tF�A'�P�H�DA;_��0�AH)%7HsARq�%��AY�Y�$h�Aa1�Լ�Ae����@Aj��H_Ap#�.1�As,��_�BAv~	uzCAzb+aK�A~��}�A�'��$A�t�;��~A�����|�A��)(��A�c$j_�A�ex����A��7��eOA��
��h;A�R(2�3A�>�9zV�A�I\	��A�sk���7A��-�	�gA�*� �_A��MG���A�7_���5A���
���A�%��m�/A��"OI�A�j�R���A�.(��G0A��)+j2A�瀘N3'A���Bu�A��Y�t�A���
�p6A��c�	A�e����A�$�JeVVA�J��Yb<A�z�
WR�A���RMHA��s��A�HA-;u(A���S�%�A�|�`\�A�w����)A�{�tB�A�A��A��~Y��A���5�5A÷�Hw�UAĔ3��+UA�tſ�HA�Y j,�A�A�hOA�,Ni��A�ǻ�!        @u�E@C_/�&@a�_Ώ33@s��&8�@��O��@��cM��@��g"��@�p�^nw�@��%�v`@�v�@��AY:2�@��Z@��@����"]:@����f@���}p@��^���@�e�r�@�g*./�@����@�w\���@Ӗh�s5@����O�@�V7�RS�@��
*@�Ǭ٣>k@�c��i�@�����@�[R�G@�l����@�{5��I]@錝���_@뻘��~7@��.�,@�6�5�=@�w��_�@�Ŵ�F��@�!��6ځ@����wB%@�%�ͫ2@����SU|@�#��@�˶�x�y@���D^Y@�Lv9(�A ��o&5A�~�RN�A���uԅA�g����A���8¬A���ϗ�A��i��bA�A�YSA	��vhcA
U%��k�A��[0A� q�]AF�a��A���?�LA�4����AK�.�&AJP�B�AՉU��bA�Dz.�        @	�XIU�@KY�����@oS[-�@��o�q�@����@�H��*�@�О�)@D@�U	 �^@�63�E`@ĭ��z�Q@ˆX�B�@��H;G�2@֮�_S�'@�5FO�m�@�7�WL�j@���{�f@�b��y'@��Yv@����@��r��N@���	l�@�����@��+���@��B*XAAk���A'��G��A.fS/Z}AW��[AA	����wAw��	A���A���
�A2$��� A÷C�4�An�A2�)A4���οA��1nA~ı�A/�N�5�Al���T�A ���oA"*X�g��A#�Y�I�A$�a���6A&{���!�A(�2�VdA)�o�,�A+�io|�lA-��J>�oA/�AA0�G��"A2�ɲ��A32�L�A4l3.�	<A5����#[A7:�_�A8i���vA9��Rq�A;[\,xR�A<��04�jA>�����EA@����!AA�U�Nh        @C�ɛK@b�����@��Tu���@��fM�@��
-�B@�OspJ@�2�1�@�F����@�3��7@@�p}�r@�'��Z:@�B��|C�@�� g�,@�ݩ?QiC@�G�W�@��Zw�:@��?�$S�@�H'��FA �E	��;A��-�:�A�;�3;MA3P�6�A	�b�i�A�}FŞAmB\oJ#A=L�#�A��	VAx���A+�G��WA����SA���NSA�k�s�BA�jVs±A�;��½A �e@\A"$a#|��A#\�`�PA$�K�zA%�%��A'f�$��A(��D�eA*o�w]�A,��#�8A-�d.���A/�����=A0�9f&�3A1�}�XKUA2�Yo��A3��F��A4�� �n�A5���W�A6���6t>A7�Q�c�3A8�yj���A9�-u�m A;�CA<=���9A=g%iCA>�b���{A?�m3�tXA@�=�v�AA(�+M(UAA��
��        @�L�.<�A8�(�T�AV�NجAi�4�3NAvT��TA���)��A���C[A�t�4sO(A� ���AA��#�A��k�[�A���9&�A�x� �p�A�����13A����R�gA���H.�A�����A��j�A�W5{��A�</a�A�0�}�IA�3)�\a>A�G�w/A�px-�JA�XL��"bA���JO��A����,�HA��J�E?A�k�R��A��݀�/dA�_ս��A���Ż�A˝f�me�A�W���A�!.��A�}���A�r�"\�A�p�s��A�x6a��Aԉє	}Aզ���\A���Q.A�����=A�J�_)��Aڝhj��A��ƘepA�m2^MoA��x���A�<�=9�A���V�pA����A��Rf�A�Q'�#�A䚏>Ń�A�s�av�A�.>�7�A�פqAA�`��YA�Ϟ�o-A��g<t_A�!�5�^�A�Wב��A��u        @&�ˢ8�@[#d׻��@x&�{�j@�pNB#u�@��
#�	;@��U��U@�ۓ0	a@�͙3��@�
}3c��@����Lq�@ē�e]Gl@��M&d�@�����d@Ѭ���N�@Ԝ=�鶀@��FӒ��@�/L7�@�ϙ8!F@�S�K#g@�Z�:��@�~���@��^�I�@� <3]/�@��7�@�5W�¥�@��'�>k@�^����@�զ�Z�@�\�Ј@��Q;�Y@���F�Q@�TL�l�@�#i���5@��ޕ��A rӛm<A��QAJR���A<~I�PAb����JA����A�&u1�~A�����A	Pc��x<A
����xA��S�!�Aa[p�ќA����{A$]�Q~tA�Љ��A�1щ�Awi��[2AGj�;mA�Iu�A�[��˗A���K�A�T����A�Q�㊲A�:ҴAkb���AW>q���ADo�#�NA2��*��A!�*R��        @3E,���D@s�ٰNg@���eì�@�ѿ�$�@�	T�k@��E�+�]@��ϽڳY@�NN6@���c��@�zj;X^@������5A �8��BA;V�5A��A��~�CkA���RiAP烂"�A=�nD�A"؟�e�A$�{Ť̅A'�TH�A*kMz���A-P�@V{�A0�7�̀A1��;�+�A3�Lj�WA4�q�_k�A6 G��bA7��#�A9-g���A:��$�:A<F�v�&A=�v���A?v��A@�F���=AA`esPq�AB7��/p�ACJ(ڣAC�yo���AD���3AE��#�^AF������AG���%W�AH�T5��:AI��B�CAJ��H��@AL�z��(AMJD��@�AN��-3 �AO��4�oiAP�_$���AQ+=��WAQ�����hARp�k8AS^��àAS���
:2ATE&��AT�m�AUk���^AU���Om�AV�g���AWk�:<�AW�̅��        @Q�� �@�AJ��@�l�Pq�@��#�(9@�	�2�B�@�D5[�@��"��@�ӽ�@�<��u
AIh~�SA�A).Ae4��ˬAu��@!A����Ap�D��A N�?�7�A#���A�A& �Y�4$A)d �:!5A,�m�C�A0a
'���A2w)�� A4�>]���A7=����A9��u@A=|��H�A@;�Lp�7AB!g423AD<���ȈAF�r�j��AI&zz CWAK�/��)AO> ��AQ8�:keXAS���AT�c��GsAV��&�1AY#Թ���A[a�iW=7A]�؞}��A`m���AaO��%Ab��'��Ac��h��Ae<�.\�Af���ʕAg����kAia��\�YAj�tl�bAl5�%�Am�-�}��Ao
.�m�Ap8���cAp�1#4�Aq��bDTWArD"��Ar���(As�����UAt0#��\�At�1~Qn�Auk7(>��Av	��bAv��m��        A}��}2hAJ��!K�AhS�h��A|�����A�nYF��oA�T88�D�A�t(���^A���+U��A�؉�~�A�sw���PA���hr�A�
ƠW�"A��DƽA�Ә�9��A�6��"vA�s�;�CA�����A��m�{z]A���l�A���9ZA�; d\A١����RA�3#Q��A���T��eA���$#��A��A�bA�>��svbA�:z�ĭA�M@�_RA�2�;��A�~]�\��A��b|�&yA��Du�{�A�G�����A�׾{8��A���aQ�A�IY�e��A�%��\AA�8ǳRIA�o�دA�.�;���B ��(�\B�5�
N�B���HB
]5BT����GB��A�~&B���v3dB	5�S*�VB
���d�B�Y�(LNB[c��B�41eBdKUZB�$7�SB��Ժ��BKAX�l�B���4�B�ϥ{M�Bv�c�B,^�KvB�o���B��Ȫ�        @��D�`@=w��6�@XKa�F*@j���CFx@w�^���v@�S�i��~@�W ��5�@����p@�txVЙ�@�� ��e@��r��}�@���a�!@�3�:�@�-$��C-@�T�ظ@�:{��è@��A�à@��Q�IX@��r��߁@�+�߱��@ţS����@�J����@�$�
�%�@�2��(�^@мUy��U@�|?/��@�Z�W�<@�Y8�Tr@�y��2@ں��M��@��d�@ߥ���( @�'m��H@�7m�@�:4�@��F�'�@�@%��@���f@�孷Ο@��Fk�@�	�:�%@�b���@��/Åa�@�&�^sR@�[�Y�@��|g��@�r���T@�^�ɮ@�����t@�b�K>	2@�+����YA ���. A �zO�6A�k��E�A�����A���YA5E��AY%6���A�!�R��A�M���A	���r�A7�ϭ�/A�5�Uru        @H��e@p@Hl��O@gX��I@~	�Hˈ�@����@	@�`��#�%@�?Ҙ���@�a��D�@ͦ��6j�@ك���@��٭�G�@�L�i<�0@�a\V�NA�(�,S
AP";�<AK?�s9vA(��1�A�ݼ�.�A d��a��A#�WH�A'E���WA*�&��QoA.#l�TEA0�׽�A2��%x wA4n�o�#�A6<o�QA8�SypYA9�>�>��A;�]�
�A=��A�ߕA?�:"��AA$㨃AB.�K�qAC^>Ajk�AD�'IHۇAE�9yAG3&}O�AH�E^���AI��T5�AKV�Q�\^AL�9'�qAN6y4rR3AO��hJ}�AP�G�s�PAQW
I�ӀAR�ES��AR��3�AS��o�̜AT�X����AUn��U6AVT�I�<AWB��
�AX6��@�hAY3.�H�xAZ6�=ۭqA[A)!9��A\R���ӬA]jT�_M
A^�1,Z�A_����{�A`i�`e��Aa ���J        ?��[�LS�@&��B@J�+�-@f���S��@����x�@��ۋ~_@���I�@�����\�@�\����B@ʉś��@�HRU��O@݄�ÌY@䡦0��@��u�~c@�a�c��@����L>t@���?X�A���n�OA��O`��A@����A>���s�A,��3Ao��'�~A娩�wA��b�A!;���BA#�e�լ�A&T���?A)?p mrA,n6-I��A/����)�A1�_}��A3�Zх�A5� �4�A8#�n��A:x��ĕA<�<i?_�A?Z{u�A@�5��fAB5��Q=AC}�ā�pAD�f��AF!%B�AGU)Aj�GAH��l�OAI�%�s+�AK$��/�ALh��<��AM�3��yqAN����|AP���AP����AQ`�̆�4ARP�J)�AR�ZV��jASS}��]�AS�����AT��j�YAU\SDs�AV�h�PAV�"�/�YAW�,�B0�AXH?�KDB        @��-}�!�AT`ͤc�A0a6�{�AA����tAN�/��:AW��B���Aa:+N4�!Agzrx��An�Aj�E�As�a�:'�Ax�G�� A~�Π��A��g����A��O�'�A��K���{A��&�0~A�q��*ՏA����u��A�@C�)�\A�����A�U����A�M�����A���#��A�(x���A�����A��*ѕ��A�V#��KXA�����6A��x��"�A�L��x�A�$�E�+A���e��A���qc��A��-!�A��W�S�A��~�P�kA��˙��5A�S����A�`�+a5�A�ɢ��A�I���A��W:vAʐpˑYA�Y���VA�<�4�A���7#A�#�=eyGA�7�3�zA�W]���9AԂ/�ؕ/Aո�G�A��� k�A�H߂)�`A٣�"�aA�^NE9A܀=�XO�A��@df�Aߒ����A��o$�7�A�n��I A�K���)�A�/����A��nWJ        @ |�4�@2��+�~@Q+�7BVY@dO����@r���@~�愫^E@���-���@�N��X
�@���Be�t@���*J�@���!�]�@��[�^̘@�Yz��o�@�G�r�Q@��@�a"J@����l�E@�
6��@������@�\0|5�W@��Au�C�@��yB�@�8���/�@Ȭ��b�@�Aƭ��@���zs@�a���@���D��@�X�˳�@�����2�@ր�N���@�%x}�D�@�ա)W@ې�c ~@�W�!!i@�'¤�`�@��P2OHk@�s�{A[�@�j�,y}@�gE�I�T@�h���8w@�pov��@�}�{_�@瑣a5T@��z|��@�̹Eo��@��?��bZ@�"g��b�@�WBy[@�++�@�ӄ7C�N@������@�4L����@�����@�Gߴ�@�9؟@��i�ً@����Θ	@�V�b�5R@�}�Z��@�ʈC�
�@���P��]@�F��<Es@�����        @ �|(B�@B�BhBk@d��a�(L@zi�l�U@�E��W�V@��7n�?~@�kr>��@��`Bf�@�I�=g��@����&@������@��H�"@Ƣz74d@�:�6�@�b���!@�1vOin@ٙ����@ޫ0Z���@�:3���C@�w��?@�1��$�$@�RT�N$@��_8��@��HՈ�@�O91�@�i#�X��@��O�q!A N1O�qAdL�Յ�A���(xA?@�wA
�Lg�A'z&�8�AE�5��{AxV�A�K�WA;�_�\�A  dD�A�J=IAi�����A 	����A!r��PCA"�S��̺A$���оA&8k"e�ZA(�F<A)�>�eA+��x�aA.B^�;�A0*fO�aA1[
�T�UA2�򵼯A3��J.<A5P��R��A6�W�dA8J��K�A9�����A;��3�O�A=;ٝv��A>��6w`oA@g*�}}�AAT��5V�ABG�Nn        @��k��@R�:��^@q�6�ְw@�1F_AP@���2�*@���q7W@��
��,@�����o@���}��v@�ny_���@�qp��շ@�?��@�Oh�h�@��_K��@�I���l�@�k�k�:@������y@�N�T��@�V����H@��t�jG�@���E?@�,�&�s@��f�xX@�z:.��0@���Wa��@�E_�&�@�1�5k@�r��@�qv~M�A^SI"A	���>$A4|��[A�m���A
��z�A�6o��gA� m�xA����[6A=�D�3�A��'7Az���A>S�߯zA�b���A�>��BA M���Z�A!�2�7�mA#,Y�)A$�/?�PgA&e��
�1A(&����A*P;m�A+����&A.YM�16A0!H�7��A1L��CXA2��{w�A3�.�LLA5;���b�A6��P)��A8A�ҍuA9������A;���j�A=x�m��A?g��j�        @םoe�ʥA�ؽ�A,�b��AA`��4�hAP
��oAY��V�_Ab�n��,AiU�M�&OApw��кAt���3�AyNc⇝�A~Q2�zZA���)IA�����A�� ~^�A�-!�|4GA����<�\A�>&�lA�=�BFi�A�Y�i�"5A���P�t	A�㊭���A�N8� �-A���5�SVA���m@�A���-��A�smO���A��'�� �A�`ܨ�fA����A�~Jv^��A� Ex�A�ː�t��A������A�#u �=$A�
vהA�����0GA��F����A��:��-�A�۾�&A���K;�hA���t2MA���:�QA���'L�A�cT��A�:m��ٽA�\�|+��A�����}A���,ެEA��L}�/A��ȭ��A�'����.A��^����A�f�2�[�A�	7/�~Aí���NA�Rb֦]4A��E��Aš�`�KA�K���a�A������Aǣ�SvA�QeZ�,�        @E��,�$@w�*mu�@�1$�,,@��l�@�����s�@�θ����@��`O.w@�'��,�@��Y\��@��r��N@ߌ̕�À@��ֵ1�@�*����@鶊悞�@����d�@�'!���@�c�9)@����4p@���b���@��+�k��@�M$�#<VAvD��ʭAj����A����A����*�A
$�j?��A��֒*�A\��W�Aa��A��cx�AIm�'v}A
��9QA�e��AW�3�wA(�C�}Ac`��]A U�꒦A!��A"����CA#�-��A%jm~�A&R~��$EA'�Kv_hA(�0����A*'urA��A+{ѷ� A,�QJ4#�A.=�M��$A/��{P�A0����A1V(i,�#A2���A2�R|ҧeA3��=z�A4��PʪrA5r��GA6T�4�1�A7;Ib��!A8&�T�FwA91��;�A:�fˬ`A;� �A<�>1�        @C�U�)' @xdRH��@�A�`	M�@�ct1+��@���
m�@�{��
�@�r�Us`@�i�EPg@���C��tA6��UA�B��AY�(�A�qw��4AH]-|6A"SՆ��A&Y��զDA*����d�A/Y�΅DA1����j�A42���}A6��%B��A97tJS��A< ��^iA?�~�!EAA8.�.�ACR5�`AE/a��[AG}�&1FAJ'����AL��<�]AO�)e]�RAQ�|u72�AS[D�|׏AUMNWO�AWh"����AY�<"��GA\&���A^�����A`��4X��Ab%(� �.Ac��*G�EAe<{�Τ Af⡹�r�Ah��8�zAj`�&	X1Al5a'\[ZAnW�n<5Ao��.< �Ap�qm~"#Aq�Z�	PAr�JZ�vAs�N��x=Atѻ�O;iAu�(���Av���y�Aw��K�2Ax�!�ЮzAy�M���Azm�ຸQA{Y���=�A|E���^QA}0i����A~aL���        @������@څ��.d�@�m����A�	pb�A.�f
�A���N�
A$���`&A)��X;5%A/��Л��A2ڣ�ѧA6���A9k�ca�eA<�����A@Y�Nf��AB?�v���AD%�'kg�AF�B�зAG�x`BAI����]AKZ�nZ�AM���5AN��0U]AP0��	AQ&����AQޏd*��AR�d-ym�AS�g1 ?�AT����++AU��o�V�AVz����yAWr{y�`�AXh����)AY^��
T�AZV�$,t�A[R����$A\T�B;�A]Z�F���A^ei؎A_r�i݋|A`A�j��A`���Aa[�[�{iAa��Ab�_�#�Ac&��(�Ac�U�۞�Ad~��a�Ae9*ﵤ�Ae��c��AfХ}�O�Ag����!�Ah��4��Ai����l�Aj��Pȅ5Ak�`H��Alҩɝ�<An Y�E�Ao9�!��?Ap?"�F��Ap�F��Aq��ݮ�tArC�+�!�Ar�$���        Ar�<˯=[A�]���A�¾ojA�R�Pd~SA�Fѫi��A�]���A�������A�as�N�A�c�sC�A�v��[�A��6����Bg�)tz3B�_T3�kB�7-�LB'��%�B
�<�3�BE�D>�cB14�WgB�2��B,�J'N<B�8�A�B�b��D[B�����B��S!B�ߥ6&B��S�B �i�0�B!�p�JB"���� *B$84�4�B%�_gQ�CB&�O)d�tB(4O	�w�B)��o�B+eVa�GB,��-WB.z�X^BB/�Q�8ϺB0��0��FB1x.��0�B2O�Ƥ?B3*�����B4	UB4��Bם�B5�уO��B6��GQ��B7�����wB8�5�O��B9��;w,B:w0BT<B;n���^�B<j�ʠ�B=jz�p֜B>ok�B?x�VFpB@DQ� ��B@�EŬEOBA]L�<6BA�O<�3BB�4A���BCߒ�-BC�72BDN&��6Z        @����@E��Dxg@c 4�!0>@u�;)Ҟ�@���K�_4@�ܪ|�@�C�N^�@�H���-�@����R��@�����'@����VT@�k-:���@��hR��@�r��3bg@�[pz��Z@���@���.�@�X���e@��8FYmL@�|�R�Y @�F[�lr�@�t)�l�@Ѥsb�
@�A�$��6@��v�e@ַ{xg�@ؑoG@�7@ځ��y��@܉Í3@ު6��ݽ@�qB;Z@�ބ[e@�̌ȝNp@�?/^U`@�X�4'�@治��@�{�!.�@�B�=�@�'�wO�@���̓M@�g����U@��I�{�@��an_��@���V�@��O����@��t�;@��ğv�@���n@�"�P}�@�Go;�@�s��v�;@��� ��@���bK�@�+w�	@�y���@�����A �r���AK��D�A��y��A��{��A�cN,��AIM��~�A9 �K        @/P���@p=^��vc@��%��@�a����@���t��@øYq�jI@�f��a{@�_��� �@��i1�@����E��@�v��D@�t~��|�@�`a��SAE8���A�3���A�f�̘As�nSwA�$M�YA#%�2\A'4���zTA+�@�A0����CA2��R�A5,�mLA7�@�τA:�[8��A=\��苸A@#�ZA�AA�dP�#kAC%�MV�cAD��@��AF@�Ñ�yAGې6q�AI�!š�AKG$�qAM%���5BAO)R鬙DAP��/]N&AQ�ҕ���AS�=��ATx����AU�j�UjEAW`٫��AX���u��AZr����A\ @���nA]�2��A_'ֲ][A`F(T���A`��C�Aa��4� Ab[�!�n7Ab�#�A�KAc�Wi�N2Ad-I(0ޥAd�:�NlAe;��	A�Ae��@9g�Af3��>�Af���\^gAg$cŢ>�Ag��M{<�Ah �p(�        @"�6���@W>��8�@v�f��A@��e#*�@�g?�s�@�(�|��@��(���@�ߙ�t��@�� |eD�@���@�[�})4@�5;�e@�nǫ�|@߼�LCۖ@���[@�����`�@�$}|�"@�o���@�!�ӭ#~@�@%p��@�����A�#z��A���;yA�d�5gyAاaA�?۱�A�ݱĦ�A?#���2AhxK�AuZ�_fA"/>O�HwA$�w��#A'�>�I��A+��`�A.��Т�cA1��A2���U��A4�x?���A7'𽮃A9P�q�A;?�QyA=p>�42eA?�,7%oA@�����0AB�� ��ACGf/���ADw!���FAE���ߔ�AF��K|;�AH$����qAIiD��AJ�oa�bAL���o&AMW��N��AN�e�fA�AP
�Q�D�AP����ΛAQx0p��-AR4x���yAR���Ct�AS��"���AT�_ҭ�lAUNqJ`P        @��_f:��A0��9��kAP[`��$Acq�F3�zAq����waA{�=�f.A���d@=A�*���sA��Y�PA��\�@eA��?�e�A���Z�aA�k��O�A�-4R�>A�#�s�jA�N[q�aA��J�T!A��/�_BA�����+A��s���AA���/z:A���7BA�k�}KA���>5�1A�R�(�N�A���+Ɗ;A�A�o㸮A��N�%<�AƘxmZ�A�r�~�ZA�n�<�9A̐ǩ���A��Z7�[AЬ54�fA����S+A�q����+A��/��A֞�����A�]�U>��A�9u����A�2��A�H�klA�?��/�A�i�G��}A⤀��FA����A�IS%yw�A毵k8j�A� aB�^^A�C���A��ޜ3�A윅bۉ"A�#���A����TA�=�� A�d�7��A�-�[��A������A��!8�%�A��+/A�p([W�4A�M4�}�!A�1K�Jb\        @����@3(�H��@O����@ad��Me�@n�r��	�@w�XR�$F@����.@����>�@���G>\@�|�� �\@����j�~@���0��@����D�V@�z��p��@�7�X���@�����@�(�¢@�Y����@��8���U@��a��T�@�aj���@�A�6�4y@�5�6�X�@�=u��I�@�Z/ߓ@�����,�@�iڲ�ڣ@��@�h� @����P`�@���O�@�t<��
@�٤�]�h@�Nk��w@�����@�g�&5C�@���cu@��d��a@�C�@2��@�.*Ԙ��@� �L�,@�U�c@���+�*@� �!圊@�.���@�B��7��@�]R<x��@�~O9�*d@ڥ��Z}|@�ӂ��\@�`#7()@�A.>�&_@߁+��4@�cԐ���@�
3��H'@�\*���@�_׹��@�PK+|@�Q�͕�@�r.��,Q@�(C8@����=�@�WTΠ@�_7�        ?�\���2�@-Eǝ�B'@K���#b@`�ɢ�^�@oG�����@z5���`�@����R@��J%�̪@�7s����@�-=��jh@�J�&h�c@�b�3:e�@���zH�@��]�Z)�@���AVM�@p��H@��ej]�@���yV@ж�d���@����UC@א�K[@ۡ�4�Sc@��G�|/@�!|��@�N��D�r@�N0iC�@��q�W@� =�ȥ�@�}>���O@�Wn>S@��9Q��@�D��,��@���%��@��d�"a#A [h�}��A����~A����fAw��Q�A_�fVcA	a�p�N0As�(��A����A6�6i�AC���J�A�ݷ9��A�&�3A_�� BA�*:ɏgA��o2v�A6�A�A��W�tA�iN>��A�ۈ�@A!
�p���A"+{�7:A#[7p>>�A$�̈�A%����lA'D����oA(���>A*(���A+��{��<A-Be�To�        ?�M�{@@�a*XR�@=�(řf@S�|��
@e?�Z�%�@t��#0�@�a�k�1�@�`��2�!@�G9��@�s��@�@���%W�@�����d@�����1)@�����W@�}&r�+@ʧu@v.@���U�@�x�Ҏ�	@ڤE�d�Q@�M��Ϡ#@�r�@爵���@���z�N7@�B�@<@���g�$@���d���@����E@�삩��@��X3�/~A��8�DA�N�P�A/,6VFA�H똺�AR�5r�A0�]���A�`O�x�AE]ÜA���A�Z�	�RAҲÀqZA��l�'*A~- |�A[��}�WA aJ���0A!�'\A�A"�>�L�]A$Q=Z�sA%���;��A'4֣@?8A(�)QhA*H����A+���1�A-�Q{��A/9ubh��A0zA����A1]�_^T<A2GSjB�A37?���A4.�SBL�A5.Eܾ�A65ٻe6%A7Fq�]}A8`F阯K        @�� @�6@����A �uF�2A+Ц
ùTA8VE���0AB���.AJ��"��AQB���'AU�p���A[	G6��A`GNM�wAc=V��6AfhXF���Ai�嗊�tAm_K�q��Ap���^DAr��4٢ At����k�Av�V�\�AyA&եlmA{�"��7A~9��\��A�op	��*A��f�_��A�<���+�A��g'=�A�?t .(!A��E��`A�y�SBA�-`x!{�A��v��A�����A�V�-��A�RզC*A�V�z��A�b����A�u��uA����GL\A���!��A���5�KA�jg�,�A�8ɞB�A�qăU�~A��s��]A����AigA�BC!0�A�I����{A��+��s�A����vl�A�UwTޟ~A�
f	�^A�´�`GA�~q9�RA�=z��A�����A�A���J&�oA����	�<A�Z`�M�A�+��8qA��_��
A��d�D.A��!����A�������        @�h�]�@4o�T@R�~�A@e�!	?��@t B\ O@�3d� D�@���@��!!�@��_��@�>�HU�@��PZW�=@���옶H@�Ό
��@������@�������@��6q�@���S�r@�҂^��@�@�kYo�@��Ec���@�ڵ�'�@��'rӞ�@���#=�@�$�%�@�j�5��@��9V�p@��X�@�\9	�2$@Ҧӏ��}@����va@�Wr;IU@ֽ�Y4@�.C��@٩5{�@�/{Ma�@��%\@�_Ä�W@�� 1h�@���( C�@�ĂG��Y@�9�ϼU@㛰�z�@䏝�*
�@�˶9��@���@犅� �@���@����W@��Yxa>@���xt1@��fZ�@�	�#B'c@�0$�{�u@�-����:@��X����@�_zYU�@���o�(@�5�S@�;Ou� [@��D���@�YØ�@�*���l@���TJ        @$���+@Y�`�
@v���2@��?f�y@�����\@�4R;�@��˓>\@�f���@�I(*_�@�s��f@�=/����@�<~S�@�ԣi@��z�i@�#{w��G@����@劝���@�]硩�@���T�@�"�
I@�y����@�~��âG@���>��V@��$QgA 3�:`A����.A,�=%�A_�k��A�ދ��A5��MpA�F8H�AQ�I&5�A���V�AU1&��A����s2A���n�_Ak9�DAC�}։A/���HA.�>�ħA  ��Џ�A!3���ˢA"PW,8�7A#v�&@ �A$�X�w�PA%����A'&�[��#A(v ^jlUA)�3�$=�A+50KʒA,�L8�ޜA. Ʉ]gTA/��E^��A0���PP$A1m=&���A2C?LZ?�A3��t��A4���A4�C8��A5�#E���A6ԡ���A7��2��A8،��:        @0����X�@b��e{�;@��h�*@��e���@�+-wwMZ@�`��o:@��!�(��@�hn��@� �N�B@�S��<p@ͯ5�uS(@ң��-]�@�+�D$t�@܎����@�v��7��@�4�LA/,@��2	��@���@�>!Ɨ�3@��C�i#�@�s�
FVH@�ؚ�4Akx����A=�y��AhK�U)A
�qH\o*Aչ[UA�0���A��4V� AbMK]A�[�	�A���qDoA�C/���A!�$��LA"�c�z�A$�;���jA&_�or�LA(O뤄��A*W�Փ�}A,x�\	�A.���n�A0�ny�mA1�ư�a�A3 	L�eA4i`�DA5���d�A7TL�&�|A8�:*�[A:��F���A<4�|t�+A=�)#�kA?�mD��<A@�X��HAA� d�:�AB�+�ᦩAC�|��NAD��7��AE�jہAG��� AH4����AIaw��HAJ�����AKצ�%        @����`6�A(tk�"�AEg�+r��AWܟ8xAej�"�IApO:DZ�Aw3�jc�A*T��'�A�+7�fA��=���A��K�;XhA�;��RA�g�#=v�A��z��
�A�a���a�A��YOA���A�14٩�HA�e���+A����o�A�NNA�A���2YH.A���B]�A�x�X��A��%@ȶ�A�O�b��5A����]A�Rfk�BMA�����!A�y.��KA�,���A���e�A�l#�"L1A�����[A�n��A�Q3���A�7��P�#A�";�A���0�A�O����A��_H�!�A��r�2TlA��(��)A��<�W��A�섚��A���@���A����b�A���{`�-A���-�A�ցsIAЎ��}�1A�J���kAў�s=aA�(w	=�AҲ(�B��A�<�ؾ��A��O�Y�A�TsK��A��Q��H%A�n�%��A��1ʁ��A֌8�̻A�
qI*        ?����i�O@2-��Ve?@O{2�RpM@a�]�
�"@o�8P$�@y2��3:d@�F�����@�J���@�nN�ݨ�@���(l��@��;�
s@���d��R@����W@����m@�s����_@��d��@����'@�r��O�@��!�u�@��40@��i�fq@������@���$$��@�WP�&�@�3m8G�@�%�Zi�@�/6Ֆa>@�O�~�P@͈-���@�؊��M^@� xן�@�`�ܡo�@Ӭ��p6�@����)@�g�.
�@��;>��X@�P�n�o�@��׽?1@�k��N>@�R�y�@߼i�L��@༨Γ�@�A�0@⎤Y��m@�^��w�@�}T�ց@���|d@��%D%@��Ph�c@��D�@������@��w�C4@�"aV�Y@�TS=K]@�	%v7@�ə�׺#@��_��3s@�*���@�ѳ�.'@�{6��ԉ@�'#����@��iª��@��d�L        ?��@SaE@>IK��@?7,Y�n�@TJ���@d�W~�A@r��ӭ�@@~̽&�6X@�1c\�o�@�Iƕ6O@��<:�D�@�K՘�;@�tc��@��TyĦ�@�Ն�BǢ@�73q�@��R��@�5!�ǡ@@�jz�x��@�S�w�!@�}km~n�@�<�na�5@����s�@��cbt�{@�#'b.�@��[2 ��@��L��w@��,�@��_;B$@��g�Z@�:��D@�#d*~�@�?����4AHxQs�>A�� �eA틴7Z�A��j�*A	i�6�AD/̅�A�F}�QA�Gc�Aa�P1��A�'@���A?���A��Bz7�Atc����A3�|u�A\P�ǢA�ѳ8�A*�H�cA �V���A!���b9yA"�/�y�A$9q6�A%��rG�A&�y@�{sA(U�Hh�A)�R=؝A+XZ`H�PA,��a�A.�A�o�A0]�q�"A0�R�y�A1��d��        ?�������@4/���	@S��7�/@i4*
���@y(B�U�@��AQM��@���0��@�_��s)D@�ǐce@��)To$@@��&3��q@�y�0&�@���L��@�>+ɣ��@����(߈@̐���H�@ѓ�dq9[@�n�H�@��?���K@���ˎ�@�}v�Zj�@��,]��@�\�p@������@� �%�s@�u�ՆM@�P��i�@�;�t�@�^�h�c�@��|I��A�_aOV%A�:B��A����A�,��PNA
)s�m�\A��ӘvA=df���A�̓0nCAs�%�A�4~���A��n�AB�
�
GA�ԭ�A��ok�A���(�mA�f����A `]��A!p�P (A"��0t�A#���q6@A$�#�cD�A&$B�ʂ^A'p[{:�NA(ɷ'iůA*0���W^A+��/bA-'Y_���A.�䘯4A0+���c�A1�=��A1�<�:>�A2�72��IA3�S�Lj�        @ȧ�����@�h䣀��A�s��.A/d���&�A;��3�@AE���vR�AN��b���AT�&���A[��Aa	�A��Ad��o�Ai;r>�>UAm�"���Aq��O��At_��J=�Awn$����Az���n�A~Q�'�AA��2N=VA�)E�&o�A�ać.�A�����A�A{�ЅA��7O^T�A���%�}0A�J�4�A��{���A�f`KT�A�����	A��yq��<A��g�L�A�kg?�׊A�W(e1B�A�S����A��c�S��A��*3��aA��Ik��rA��`��dA��f�*A�M��j��A��Y�b� A��?�6A�%�I�A���`�	LA��$��A�W���'2A�М�*	�A��*�x
�A�nM�!�A�7�{9gXA�Кc��A���녊�A���fj$RA��Ч���A�`�?�W�A�A<j�l`A�%�r�ZA��=��+A��Mh�I2A�뽦��dA�����A�פ_� �A����;�        @g��@Q�	:��@p��?}@���X���@�5|8�)/@���	z��@�a�Z��_@�I4�
��@���ԭ@����@���n�I�@�TL��@�h�"Q;�@����R&�@̶��q�q@�T+�uS�@�fLs��@Ԓc�=<@�����@�:���s�@۹i-�b@�V��T@��2 ���@���x�T�@�A��@�*p���@��pm�@�@����_`@�Z���@�����@��.��5@𚗱,�3@��^\�uL@��r}@�iyJcX�@��	�Bt�@�H/�i8�@��J{�@�nʏ�[6@�2���w@���o�@��L�f��A �{�A�Nv<A��C��A�b���A�f-ӝ�A�r;A@M����Ap��� A	��͐��A
����{A4-����A���7�xAޫ���Ac']��Aҵ>A�Ժ5^AB\��A�X�t�A����A~�AA����{        @'.0�s�@`���"j�@~1���Kd@���E9�@�ϒ����@�DmJD2�@�6��ޒ�@��]�X%�@�ڌ0H�
@���ߞL�@ͳ���x|@����@�~�^��P@�U��R"n@�Rm��n@�E�NW�/@�\�$I�@��ڱ��@�$����@�9qy@Ao�:A	�A�x�ζA	���YA֡�|'A����C�A���A~3��`7Af�8bK�A�����A8���b�A!����^(A#��YmoA&K��A(��K�S�A+cV߮�XA.H7����A0�6k��dA2Fq
��WA3��O��A5�{�GA7�8֋�A9�� ��A;����eA=��K_0A?߂Z��+AA��q��ABY#��6AC�~5��AE�m�+AAF��Q	jAH4�MҷAI������AK��n5AM����APq"�AQNw1���AR����B�AT���i�AU�;Q<��AWY���(AXՃAWiTAZ�_,"�A\���%��        @����u@FM��a@epOЍ<@z�6/i3@���?@�*��P[@����
�
@�����"�@�<ۥ�g@���5H�@�(�^@�����j@�(oT%�@��o��@�N�� �@� �? G@�SxLH��@�(0g�l�@��zEٮ@�t۝H8�A|f_�A���kA�@�x�IA��~ �%A�UKdEyA
�!��An!F�u�A8ХAˬ�n�OA�#N#A  ]n>�A!��ԇm�A#��/in�A%�	2�QA'����sA)�G�k�A,2�Xl�A.�`��;A0��Eӳ�A2{z�c-A3��ŊA5"��A6��?�Q_A8���
�A:\� ��A<J�ܻv�A>R_��^%A@:����yAAZ�q �AB�=ĵ�ACņ�kͧAE^Z�+SAFo6�E�	AG�vM�AIZ��X �AJ��7.AL�:�AN=�Ճ#_AP�TuAP���3TAQ�a= PAR����O�AS�"m��        @��]�"/A5tx`�ƃASs<!4�MAe���e]�As��Ĵ`HA~rN��A��<;�*�A�\V���A�����cA�ܕW���A�-���SGA�u���A��b���A��� �$�A�<�\�A���K4d�A�MCJ��A�?��~�A�Bye"��A�U���B5A�y��rA�A���꓏A�����0~A�.�m�A�l�'
1A¹!� }qA�ZMG#�A���x_A��i"f!�AȌ
�	�A�/����A��9��ٶAͶ~,��Aϛ%��A��T�:�A�Է��A���!�i.A�	�0A�8 K��A�q*
;]�A׶b�� �A�!��%KA�f�}��A�����A�I���S�A��w�Ʃ�A�/�g�A���G��A�Ӄ˙�A���w��A㍰��%�A�r��|A�]$���`A�L��ny.A�Ajm~A�;�w�]A�9�[�A�<�C/$A�D�A~+NA�Pv���A�`U5B(�A�s�}�A��        @AQ�1��@i��i�@���}�=@��$b���@��~�@������9@�f�� y@�9��KH@�R�/w@��@���@�\pb�v @ł��G��@���3:�@�i�`6�>@�#X�s@�%���w@�{Uxy�@�5���@�p1��@��`�+T@�<C��@�Ցf�d!@�Jsܿc�@�˗;�@�Eb�r�@��j��c@�d�:�1@�bW�xNa@�F����@�Cf��@�X���C�@��Q��@@��lun�@�=�t_@�O�q�@�� c�ϙ@����@�7����@���b1)@�]���@@�u�[DK@�������@�zYF���A �a�%9(AQ�"�ؒA!в��A���g�cA�P��A���'�A�7��eAo�R��A]}O���AT%�OgA	Tj#qA
_o��At���A��9��EA��y�A�����A�OJ޿A���~AuT��ƇA*�N��@        @(�/�䙜@S���A��@q0B�S��@���u�8�@�i� ��@�P�7F��@��F�g�@����@�+��,|@�c�SqO:@�q�y�&�@֕uCA�@�r^o�<�@�:��ǿ@�ͽc�
@�G�s#=�@�K��@��1?~��A&�.5A�-�|MBA��:w�nA��d|�A�n<|gAa�wâA�S�F8A"߸O�A&A}n£A*z@��(A.#!�A1S���%�A3ȼ>�DA6p�alA9K�Y���A<Y�*��A?���&��AA����E�ACVw�g�AE?�i� AG>��>AIUb���PAK�s+e!"AMź%��_APw��FMAQF�	�ÑAR�� XASՊ��	AU,�v�ܑAV�v�]�AW�
T��<AYr���=wAZ��H$��A\�"ĩ]�A^ �;��A_�~�2/A`�����Aa��]�.Ab�����Ac|#m�Q�Adu���GlAew���3�Af�3�J�Ag��s��Ah�P�B�        @q�L�"�@����n�g@�)ݺK��@�{H~N6�@�J;ÞR@�Xԑ��$@ӂ���@��Y�N1@����Bj@�5�V>W@�e:޷/@�2���	L@�4���@����@�&G���A ��d���A�*K�wpAB��8�1ARZc�nZA���X�A�CBA��/�]�A��A��E�WA �� O}A"� `�\A%sđJ�A()%�+��A+��I�A.M�4A0��ɵu�A2Y�E~��A4=T�ŅA5�0[[�?A7�/�4�A9��D}�A;��� �A=����R�A?���9�AA	����|AB+ki@�ACUl���AD��`��KAE�ҏ��AG�;%AHU8|�7AI��J���AK���]�AL~�|�	�AM��}.AO|&�>0kAP�l?kQAQQ����nAR#�1 �AR���i8AS٠݊�{AT��v@M?AU��M��AV�Q��J�AW�����AX����AY�i?AZ������        A6&WRB+A\��ͱ2�Ar���?�hA����k�A��"���#A���@!�A�g,���A�x+�(��A���#7֋A���V\�A��A���A����|�A�����A��s%^jA��u��6qA��=�CW�A�>x�h�A�r7���A���%�AȇcV��OA�lĬ+:�AΏ��"qA���(1�A��Ewt^AԶ�-'ZA�Ðc��XA��[��OYA�6B�OMAݚU��;$A��W��A�Y��]A���{�A�S_dbA�s�ӵuA�
�/�A�!��!A�(�JI�A��K��(�A�v��G'A�0�N��A�{��@wA�d�ф�A�T�)|A�J��c��A�G-��HA�I�D��FA�R���>�A�bRa�d[A�xH�jK�A�����QA���L�|A�����"A�'mJ���A�n��ƈ�A����޺=B �b��кBF@���1B{�B���QB�7�h��BZ��*4B,�6*��B�Z}$�        @��P���@=����@Zk&Z]b�@nҙx�6@{!�u�@�_�|3��@��[[�@��%�@��~�7@������@����+9@�U]L�.@�}N��	@���ǂ�C@�� ��� @�Ad,&>\@�
�C�9?@��c����@��10]�p@�*�b8@D@Ƿw�0M@�pp��@�V����M@�5��Fg�@��m�[@Ӕ:Wn�n@�j�2��@�]w~��@�m�/�`�@۝lq�@��!)�@�+���2@�p�O~@�ìT���@�$����l@�ւϥ@�P��j@蝏�` n@�8��iV@��W�z�@���8@p@�e�ud@��+@�_�M29@�jt���@�`����@��V�|@����P@��0��@��SN�=4@����R�R@��}R��@�Hb��@�$UH�@@�J�����@�u %ϟ@��� PA j����A�~�]*A���SA?[�u?(A��i�A�_!�#        ?۰���v}@:&J��%@4���F@I�郙��@ZȤ�3�1@i�i*@u�w�
�@�"d�ZZ@�����1#@�)��n�@�hw��y@����H�@�mJ݄�>@�e��@b@���h+F�@ä ۾�@�c
�u�@@�-���z@�Zv�+@�K���eA@�3��h�@���L��/@��@�	̂^�@��(�r�@�8of��@���mo@�,>��.@��hV�ǬA ��%�B�A�3˻�A[>�P�A���A�����A4�4!�A���*A�p���A��;��A��a(GA�����A&�{tzA���7R�A ���_�A!x���SNA"��l�(A$u�➟A&\�*�4A'�c>��A)��iD��A+��ڈA-�����3A/�U4�A1
>Y�9�A2@{�ŀ A3���+7A4��fy��A6K�A]�A7�4�ewA9Z#*��A:��5�8A<�8���A>�q���~A@5
��        @�ͮ�3o@8%�$�@W�Fl*@lJhN�CB@{��m��@��u70�@�%+:�%@�D�L\"�@��G�ZK�@��G�%@�?%��@��^�>��@��˾�B3@�W�=XI�@��!N@@� ԍ�@�m�]9N@�R;��/e@��1�@��҂;@�}����@�S��w�`@�@�Kc�@�þK\@��M5Bc�@�n�@?@�v����3@��M �M'A �� m�A�r]BSAȋ@�mA�*�YA	��$�C�AL���g�A3fZ{��A&�r7�uA���7L�A���Ac:Ty5�AQ��4-�AV��,Ap�sg�A�E^y�A q�u�-�A!�����A"ъ����A$5��~LA%Y9��,�A&�?��.zA(\m�<A)y|��{�A*�O���1A,{.>4�/A.��)��A/�|���8A0�𜈮�A1����&A2|�j9�A3j��8XA4^Q���ZA5W�j!YYA6WO�4C)A7\�Q|        @�	�O��A	q(�6�A&L�>�DA9 IOx�AF#��AAQ%c
�AXj�F�-A`m&uO¬Ae9[��(�Aj�5ȄoApM)]h�As�X֫�AwA�a֟�A{>��b�A�E��NA�&��^��A��@�6�A�j�GZ��A�S�[�A�h�MT1A�U���7�A��RY��A�ْ����A�����9A��c�%A�����A��5���A��#�l�A�7�L+�(A�l%*�~	A�����A���6�u�A�R�$.��A����E�A�)����EA����N+�A�2a-�oA��Ql�`A�ny�g�VA��X�L�A����� A��k�c2�A��<H���A���Z�9A��+�?A��ʋ��A��K�� OA���Z��A���c��A�ŠZ�A�ۚ�}�<A��}����A�&5�q9A�:n����A�c7��g,A�H2�)��A����I��A�{��=�A��F��A¸-��oA�Y�����A����>r�Aģ�h�y        @�!���@@�n�y&�@]�.��@pu4�\��@}T��@��C�8�@�|����H@�_m&�{�@�!�6Zǅ@�b,���@���B��V@�Qe����@�5��U�5@����D��@��_��@�xM�\5@����@��r9~�@� �ݴ3�@���;̣@�E�����@Ȝۜiw@���u@ͷ����!@�>T�g��@ѳ�-�W@�<�Y�I�@�ؘ5�@ֆ��Y�@�E��<dE@��;mGf@���Q/<@��zǯ�#@��M�o��@��YG	A@���%l�3@��ؒx@�'��H�@�F6O�o�@�lg����@皇��@�І�_�@��vE-@�S��Z�@��(�y�@������@�I)G��@�SX>���@��_J�@�eLv�@�ntb�	�@�&a�[]L@��$�kg�@����>�F@�X��߻z@�	L���@���V�[@���}�"<@�`=]C'>@�&�u"�3@�����@��$�Q�\@��ϛ��        @�u�_W�@D���.[@d�d��d@x�zE���@�@< �@���?qO@���x0^�@�M���s�@���31L�@��`j���@��v�1��@� ;���@�g>��ܖ@ɞ�`��@ϱ�7@�S�b��@�F�9��u@ۼ,��?�@�_��Z"r@�04J��-@�WE�gl@���p��c@���Y|	'@�Wi��M@��X�K@�;���`@�:SN>#@��k�~r�A ��q�	A
�#�OAV����lAĿ	��A	l���AR5�TFJAw��	�ApV�!#AG�Q���AB��Q�Ac�c�@A���*��A# ��A���zGA �%l�w�A"/�2-�A#��G�cA%^s���OA'Iʳ8A(�_TltA*�c�b�A,��u��A.�!p���A0�{��zA1���� A2�1��i}A4�\Z8�A5X��}��A6�u�-�A8p�nnA9��9�A; *+�A<�����A>%Pe>��A?�\���        @�o��8�@F����C�@c��&j��@ug���i@���}`�B@�$�׮=@�B��{��@�(�L蹲@��_V��Z@�q��3�@�'��5?�@�n��vY�@������@�M���/@�쥧Gx@�6�;�y�@�Ff	��g@ќL��r�@�/d4�0@�&<��«@����Fd�@����݁@��^Bױ_@�f`�0��@�z78d��@��h�,T�@��(�@���H4�@�X���x@�t+BI�A d?�ܾA�����A*l� GAejq�lA��7��A1o�k�4A�� ؾ�A2P�BA�%cϱ A���ʩ-Ar�+0�A��E��A��P��5A%.s�+
A��-KyA��d�AY&Y��A !96.vA!ܝ��-A"�}�A#�RkO�A$$�,=�gA%=��)A&`��EAA'���$�A(�IiₜA*
 c�A+P�
�BA,���0A.\�PA/l���A0o�0��sA1-|I���        @��%"��A!I3�t:LA=b~�%�AOri�U�A[ ���Ad��p�%^Am6����\As�B���Ay�����A]��[�A��(l)�A�PhO�>A��< A�7��XA�8'*ȳA��1�6��A���%���A��};&��A�HWw<�TA�'"UOb,A���_T#*A�'��H�A����G<A���`��A�HG��.A���rA�RS}�A�U��qA�	�l,M�A������A��bW*`A��=�^3�A��A�@ŁA�
B3 �qA�:�|A�A�p��
�!A���!aA��Y�&�gA�=ܤ\yA��x_A��ME��3A�OĀA%A�]�O"��A���g��A�Տ�p}A8-�"A�\U)�A�$�L�ǅA���R*�AŽ�ܝ�AƎ%�r��A�`ɐ7V�A�5��W��A�����A��O��WVA���G Aˠ[���1Álq
�A�e�3lx}A�L�/��iA�7���S�A���qAЌ?���        @"������@VƴN��z@s�D��$@��$]�xb@�~*_�s>@�͕8$�F@���~��@���]�X@�� �e+;@��5�3Cx@�~�D�@�.��O�e@�v�Z�j�@�2m��k@Ԁ�:�@�'�]"@�%�q �@�=Q�
�@�$�7ܲ@����F(@���#�3@�o��m�@�W_�D�@�1͐��c@�ʳ7���@�w?,��F@�8���_@��\Vj@��c����@��$)��@�(ݱr�@�e���	,A �7�8�}A�z�Af���ujA�>^���A)Q���A� "�IA	*Kn�zA
���*AiT��S;A�B��A���A�%	e.�A��k�OAǪ)�OA��_���A�b�A�	���A�BӁ��A�>	��AA��GQoAr�LcA�d��A���u�A3�*3��A��o�A l���y�A!)}8D^A!�@7��A"��0>��A#;i2 d�A#�M�"7	        @{�Jֱ@J1�?���@g^^�T��@{���'ަ@����&Q@�|!z�@����/@���f�J@Ʊ�w�yS@�c�b��@����,�@�Dr�p�&@�$qX��@����C�A��1��A�����A����SA+�.n�A"�b�jHA(
��b�A.�A\�A2|���6�A6dg�߮A:�y�|*4A?���XABo�6J�AEPx�M�AHm�Y��uAKǬ�lWAO_G�
z�AQ�^%��AS���@��AUʵ�33�AX�{p6LAZiz�E�A\�#���@A_^n����A`�s�gAbC�@k&�Ac�!8q�Ad�F�ez�Af(�T�])Agl峧^FAh����Ai��w3��Akx�`�Al5~	dyAmY\f��Any����Ao�f����ApX�%UAp�k����Aqmc[��Aq�F>�H�Ar~[���gAs�,�f�As�J/�At�۟kpAt��a��Au+�� �Au���[Av�q:�Av���f��        @Z+s1W�@�'�D_�@�0}��@�@�F|��N@�_5��@߮����a@�
��-@�yF1��@����z=�@���|Y�xA�2P��A`��-R�A�LT��3Aѫ8�gAC/��0'A�Є�k�Au�;p?A�8��6�A"k���A$k�\,!�A' !e�tA)���R�9A,���A/��-8V
A1�F�	��A3bU�X;�A5C}�%�A7@�-y��A9Z��po�A;��Fo0�A=��rI�XA@2l�Y��AA�uL�k�AB��G>{ADZ�9��AE��aY�WAG�ۖa�*AIKG�z�AK$�V�¼AMa���gAO0a�R�AP�&^�@�AQܳ�GvTAS|<8�HATf�Hگ�AUȩ�_˿AW@s��T�AX��T02�AZyE���A\>���A^�#�A`�R??~Aaq�+��Ab>_ �rAclw�ƖAd�����Ae�f{���AgJ2�x�7Ah�1)_��Aj�@P�NAk�+��dAmu��IAn��1���        A]���,AF,��Z%jAe-��E��Ayn�=���A�s��Й�A��y@��}A����ؑYA����PA��-w:OWA�ѼR��UA�os�ͤ'A�YA: .�A��o>��A�Op�O�\A�-X��MA��<��_DA����ܫA� �r�EA�qo%L�A�&S�o�A�n�V�A�7�hR�A�|ߢ�]�A��Bɐ$�A�lHA8�HA���9EA��*~X�A�[����A����4SA�eil��~A� ���E+A諜$+��A�f��Ch&A�2ee�hA�z��A����A��.Ǯw�A��+�A�l}Z�A�3O��S5A�U�>Y%A����-�A�����r�A������A�8�F]A��GL��6A��#��A�Gr�B�A���|X'�B �of̑�BZ��|�_B"C��B���&��B��3���B�����Bs23<�BS�p��0B8���B"�?�W�B	Ѳ��B
b��B
��ba�B�n�[        @DP.���@xb�	]'@����@�k$�[@���_I{�@��(�6��@�\���@Ћ���sL@Ֆ�?��@�N��@�ؖP%˯@�\��w�@�2�O�3n@�Z��q�@�j�:@��0�y!�@�b�Ø�+@��f��@��B�Prg@�1Ջ��A ���"�@A=�Y�A��#BgA�G��Afs.��mA	&$�&pA
�@�~�'A�g`�\�Abx'jA��3LA�MOG�A�9��]�A�ݴījA��
��LA�?��-�A��<�A��7�tA�;.uQ�A፦#X>A��I�wSA!����AI�1{"Av�>`A����	A��$�A �m�~cA!3K!�!A!�%aG�A"�[��R�A#5)��4A#鯳�c�A$��]-ZA%a�AX?A&&[��;A&�r��G|A'ç�'��A(��Pϻ�A)�6jN�eA*lJ����A+b����A,dGO�V$A-q��R�tA.�y��        @^=c7L	�@��j8L��@�T�'(�@�.
X�@��O@�g=�c@��ύ�0@�Ъ\Sv@�G����WAh`㔒�Aw��W�Ao���țA��qU�Aؤ��2�A��#�A �LU�w�A$	gO�A'�#�j�A,j��\8A0�v��A3�����tA6��2��;A:�5�
A�A>�rQ�AA�f���AD4��ؤYAG e<��AJ[ʱ��AMi+O�gAP�����ARwkkP+AT�̂ AV��UaAY&cAFR?A[�R�kA^Q�T�A`��f��~Ab�t��Ac�� A�AeB�9��Af�le=:HAh���vfAj��aw�]Al��*���Anד�{��Ap�۳�y�Aq��]�Ar����t�At!�I
�QAuo����Av���B�Ax2� �yAy��~�vA{&��Q�BA|���8�iA~H:;�9VA�����A��ao�A���=�IA�~���=�A�^O��9�A�@Rڮ��A�#�:m�b        @s�Q+��@�HӫԥZ@�s"'a��@ҁ���@��VQvT�@軋�6�h@���w@�?���.A<��(B�A�UfA=*���Au��7��A�i���@A{���9A"�����A&Y���\oA*����3A/)M����A2$�{��A4�����1A8 -��k�A;�pZMF�A?�TX/AA��NADW��yAG�����AI���Y�fAM@��LAPDiB}�ARd^��AS�^>}�~AU��'���AW��GnAY�dN�J�A\
).�9�A^!�և��A`����_Aa-<v2Ab<�jОAcM�ƑAd^�x��Aep8�rAf��K>��Ag��$Q5�Ah����}Ai�6��kAj����:Ak�Sߊ�Al��|S`%An�����Ao&�a2KeApE���Ap��ig�Aq5��YAq�
ArO��U��Ar܆cX�jAsh�WGAs�|��#�At~��Au~�Y>XAu�*��9<Av(�L+        A@��Y�At˵�[�A�y�k��A�}I��EmA��X��� A��+HA��b���RA���`�A��S��*�AӫՃv��A׬h:~ǒA��h���A�>K��
-A���%��A�.%�f�<A���x�IA�'�A|�A��&@�A�a��muA���I��A��zh�A�u�z��A�BQ�,tOA�pSJ�!A��V���A�Ʈ����A��v|nfB 9Y�>L�B$<�M�B�Y�d B #�@UB����B�I� D6B�Q
d�=B�?\9d~B�X��gTB	��@B
���8B9��HfBXȉ�bB{�/�>B�K�� xB��J�|Bz^�R�B:��B���ruBB��A��B�Td
V�B|��s�B��<[B�3o�.�Bm��n�B�FF=B�Xgf�FB�=ʺf:BGVɔ�B#��YB�`���B�i���B�ni�2BnD~�eBY��^7BM7�6,p        ?����7�m@*	�j2�@G��
m��@[?�zys@h�qR'Z@s�~H�u�@}$)1��@�j>��@�c��ʄ@��u�aW�@���N�X�@�/����@���q�5@��{9�[�@�y�/@��7Z�lZ@�Ҕ�A��@�U�T�؊@�	u��	@�K�:J�@��� �@�Uq��qq@��a(c��@���}L@���t�qD@��'��V@���R}@Î�ë�@�3���$@ƨM<��@�J̴�؈@��ʄ�A�@˻�ҝ��@͋QD��#@�k{��#�@Ю[�s[�@ѯ�S��t@ҹc�@���'c�@��ډ��@��.�y�@�1.�^@�c�m�'@ٟ,f�I@����O@�1&k��@݇�V�sN@�祤:�Q@�( H�'@��׼�@ᝏi,B�@�^|נ@�#�A��@��ֈ��y@�Ѿo��@��=Y�#@�f��`@�D��<l@�)8����@�C��M}@����@��ߋ���@���o��]        ?�R�v�)�@V~�VO@4�UZ>��@P�
�ݠ@eo�c���@w�P7K�@�5!��@�0?�� @��N���@������@��Ũ�{�@������@�1TQ� @ь��?K:@��v5H�@߬��J�@���xE@�p|�h*l@�fc��@���Ad�@�&M��@�=I5PA�q6s7AE���A���SA8�bd�bA 8�@��AJr�Ϟ�A����Af�׃A��u�o,AZ@��Q`A3���?6A!Ֆ��A"�֎��A$J��F�A& ��-�GA'��}Ɯ�A)�g�XA+�Rܟ��A-�n���A/�<jۤuA1�9x?�A2-�usbA3_났�#A4�W�J�A5�`���7A71m*h%5A8��/���A9�!���A;Nw�`I�A<�����A>/�x��A?��X��'A@�f���AAZG�˧�AB"\��AB�\�g�!AC�+4KlAD�P�y�AEc���?AF;˭$�AG�PZ�        @'B�/e<@6�:�@x�@V��!?4�@l��H�c@|�^x(Ғ@��e���@��0*@�l���ɧ@���\�@�p���6@����Lix@�x�!Z(@��`��@ԧ��s�@��7~D�
@�~c
�@�"f��@���Ό"@�Fװ@�b\fY]@���غ�A4H1��A�����A
���a�A�?^w|�A���I�A����uA��F�A`;$���A: .g[`A!�z��D\A$,�!�A&���@X^A)�Ғ0BA-]�L2��A0�%�I�A2�^����A5$mSpjA7ĤT��>A:���yA=�)p��=A@v�8�AB*�fi�AC��h4AE�s��DDAG����fAI�^���AK֮�U��ANj2�MAP#�TOAQN9����AR��:��AS� \���AU�	t�AVhM���XAW΍w"":AYC̈́	��AZ�,?�A\_���1�A^�8%�iA_�E�J8A`�7W70Aa�%�Z��        @0���@��I�Nz�Ag
W�RA(�)Hv��A6��$�uABo�9�mAJ0��5AQ�G�b,AW>p��A]X��u�AbuE�gAe�mD���Ai��B[� Am�*�rA�AqC�ֿ��As�����AvQ�F��EAyI���A|��A-��+�A�<[E��6A��r/��JA���	�(A��k;dA��7�O�A��0y�q�A��� �A��[o��A��\8iaoA��}ĜSA������A� �}�A�a�1�#�A���u��4A���&-A�a��uA�˷�C	�A�?Q ۥ.A��h�C)KA�B��49A�ip
��&A�6fRe�A���t��A�����OA����-&rA��2���A��BA��QA��E}��A���o�)A�������A����I��A��2�F�xA��#Z�IYA���b�A����tA�G*���A�Dx�Q�RA���_ZA��v+O��A�M���:9A���=�A��B%<�rA��_���x        @�O}�Ao@3i%�@O~#�;�@a�'@n$�N]q	@w��xc�@��U��@�i�z�*B@��&#LC@���T�P@����:�8@�*FQ��@�%Y�S��@����|@�;r/\�@�DS��Nj@��k��@�&-iZ�@���ק�@�E�Azu.@�<�94@����t�o@���3B��@�"���<�@��G�|G}@Œ�b�u�@�g,HS��@�M��R��@�F�@e{@�Q��[�%@�m���@��G~�qr@��BH��@���I@�D���=�@�~�{�4@�§t��C@��=z�@�j!��@��ҷ��@�<B �`@ݵt��Z�@�9s�U��@�d�M�9@�0�x��@��j$�@��L��6�@�h$B1w@�G�ìv@��Tw@�qə�$V@�f���r@�a&��X@�a���h@�gi��־@�r}�d�V@삆U�]@�[��@���;�@��;~ D�@�y7(���@�Z�n=$@�-�f\�        ?�h�A�v@rL���c@;�7졸~@S;zUGo�@e̍D^FR@v>h}�@�2-�S�@�۫a��@�Bm�@��5�K}�@�s�0��@���t41`@�@���{@ə��fG�@ЈG�P��@������
@ٶw)s,�@�)���)@��g��@��Gu$��@�nAtו@푼m6)@���}n��@�q'�"�@�)�w2@�1���@���AH�A /ۙ*�AOΦ;ܦA��$Z�AX�0��DA
O"J�(A���G@�A�VrO��A��/نAن �AG�䞧�A�X�{ǗA��K�A���Rv�A!�mCH�A#��iGA%��5Cu�A'�%��A*
nK�_A,�J�:�A/6X���A1
���IA2�'�#oRA49���KA5��*8�A7���DkA9�{��SA<؇���A>S�9S�kA@bڸ0Z�AA��Ԁ{<ACݰ!��AD�2vA[AF�$�AG�@����AIoN�uIAK:���.        @�WA�h�@NVU���@j�}@9�@}�cqk�@�������@�<ac�J"@�е���@���aѪ�@�����c@��\Ju)@��t8��@�A-:�S�@Ê��Z�,@��\�H�@�j��D	�@Ѽ8ޙ��@�(�����@���a�C�@�>v��09@���~��V@����@�V�1�3i@�f�&k0�@�AW�b�@�2�/��@�0��Zvv@�[��q@���	�@�FSEy7�@�	�6�X@�8�<A�`�gA� ��A���#P�A���ѹA�k~(-A
�܂@sKAS��`Al����A�3&xAN���%�A�����RA--ܺ`�A�;3Vy<AV��A
n3zAӦ�.�A���|8�A�A`'�A �r��A!�W�A�A#qG	A$K�el��A%�ʲ�[�A&ܼT)��A(<����A)���A+*f�t�A,��
��yA.\u?	_IA0N�^�A0��� �rA1���C�d        @���+J`�A��a��aA ��{Ο�A2p�(XA@B]e�9�AI8:G̀AR�Ha'�AXO��]r\A_�d'��MAc�u05��AhFZ�S�Am3jFl�AqH��އFAt/�ԘM�AwN�u6��Az����A~0�$$��A��5g7dA��j��A�w�C�PA�,F���A�m��B�A���F�ѱA�7L_�)A�_Ys��A��E���A�<�6A�m2,�-A��Y��A�Y�kA�����\ A�u��9�A��_
A���Q�J�A�����GA������oA���9[A��>��A��P;� A��Ԫ�3�A��N@ �A�˗����A��ÌK-A����2A�FT�ksA�~�)�HwA����[�TA� l�s�A�X��t�A�X��؂JA�	��/�A���jNA�x��O;BA�6�f6�|A��v3E��A��!'WvZA��7��ԘA�Swvmh A�"�[A��A����i�A�ʥZš>A���m/@UA����7��        @-�!2�@e�)�9�@���<���@�k{���5@�F��/L@��׆N�;@���0�xx@�����@�3��/T@ͯ�輻�@Ҋͪ+^�@ִG^�@�T�P#�@�4:�OҪ@����>�@��$smo@��U��@�w0/"E@��cI�@��*�V/@�� hY�P@���Xy9@�x�<�r@�[+���@��}���@�6asO2A �/�y�A:��dJA�/�E�At���Av|">iA�^3nA	 �2��Aqh�aA�H��_A�oej��A/����iA'��-A,qAt~�A>Y*%��A]���dA�A]Z�~AǠo�A�0���Aq��ähA�{�7��Ah�ԓ�A���A��Y��KA �A��P�A!��Tb.A"�#��sA#����A%���&�A&QspgT<A'�����OA)Nb�5A*��X���A,Q��+��A.sOQ�
A/��8�bA0��(��HA2_���        @E_X���@��q*��z@�	�S�@����K��@��M]4@� ���@�z曨�A�4���Ay%��/DA���.A$�7�l@A.]�K��A5p՘�R�A=+�a2^AC1�mꑷAH�_n�i�AN�O(�8AR�A�ţAV;d���AZ'��@;A^_&G6��AapzRk�Ac�tFG�^Af`r�3IAi1O�  Ak��l�%CAn�;���VAp�*0�;ArU3S��hAs�R=�~AuSYD�xLAv�^{�8AxB�4b;kAy�vY��A{#��H�A|�RE���A~��>A�Ar��
n�A�r�桠�A�-��A��xX`4�A����z��A�[R�^��A�� ;�A��~��A����]�AA�7M�TA���	���A����D�A�R���A�.z	�A���N�A�_�X��\A�
�>;��A��E=�TA�X����zA��Ta$�*A��j2f%�A�63tfA��C�$A�fӐ��eA�����A�LL�S��        @�Si8�@G*�n���@sv�+ӭ@�zr�o��@��Y�=R0@�u���@����kJ+@��Yjc%@��wO�W@��4�?�A- ��KA@���DA������A�z�u7Ah�B?n�A!z��Tn�A%3�\�?A)`�H��A.�mv'A1�+-�x�A4Y����A7jn���A:Ő��A�A>p}�(�AA6����AC[�9��AE���o�5AH���HAJ���My�AMj>{��JAP!n�mAQ����?�AS&�<�XoAT��n�bAVeMS�R�AX����AYߧU��A[�Ԡv��A]����h�A_w�v-SA`��բUAa���Ab���ActD�mAdP�֘�[Ae!s�|�Ae�[��XAAf��F�aAgF��ɻ�Ag��8-�Ah���7��Ai����Ai�UD6��AjF����Aj�ڵ��+Ak�]���1Al4�Z:(zAl�d�:y�Am��<��AnlH�=ۘAo@�����Ap3)�HAp����d        A�ٝjWfAS �,Arn��0�A�	Sr��A��3��^A��*0�z�A�&��m��A��˜A�w��?A����)�A��|٫��A�F ��dA�O=��Aƕ]�:oA�����A��*i�P�A�կ&;��A��p�}:A����oA�.#��pA�x�/[�A�ۺ)i�A�Wo�ZߺA�vc���/A����[��A�1�q���A�y��AA�$i�v}A�� �dA�"9�*d4A���0~�A�Q�5���A������-A��JmÖA�'`pA�og��A��6o�A�N�(�A���yY�A��2Iܚ�A�	IW,+A�D9��A��`���/A��-����A�\&�$e�A��+��A�}���ذB �̡�rB��� wB}cJ0�B�h;�_�B�gV$�Bե�aB��BׁBz����YB	�}�M�B���^��B)���2�B�?b�b�Bc�v�(B]�iz1Be��<��Bz��X�        @�>"��%@?�7�7Z@\�0d��@py��D�@}��9�؏@�DIg���@����I��@��j��$@�:�Ҡ3Q@�?��+@�����}�@������@�Z�}�E@�b��]�@��)�V�@�%���m@���߬�@�E�MK�@�K�k���@�lUL�UE@Ǧ���6?@��QI�G~@�i�~�]�@��
մ��@��ۨ��@�+
�~P�@Ӛ|��	@����;/@֪�U��@�J��� @��	c?ư@۽q�]�5@ݎ���@�o�@��Q�@��j�}@��NW@��5g�C�@��SMs=@�%�@�0t�Z�@�f��~��@�� hn�@����!>@�E$ൣ�@����CIe@�
|t�%@�<�ު��@��'���@�crź�@�}�x�*@�E�	�ى@�τѬr@�ᤚR��@��Y釡L@��A��j@�i�|�L@�K'��޳@�0���@��&h%i@����r@��f��?@��Uzht        @�u��r@Qd�ά�J@r�*�~oP@��||�T@�G#�\�@�$8��@�/�%��@���T�@��K�;�@��z��@Ш��K��@Պ�Z�!a@�.=@a@���DQz@����@����-�@��]Lg�f@��sWIu@�(	(�N�@�厔�r@�l�ř�A �wyA�~��9Aa;ٴ�A	��57A���'�AUY�AV�I�YA��U]0A҆���uAP4K�slA����v�A����A � eA"����A$E�0��A&��rrA(	!�!��A*��ûA,>�3�A.�aָO�A0r�پA1���w�A2�k	/L�A4X��8rA5�*�U�A76߾�+A8��D�3A:IW.}XA;�՝�A=��.��A?B �3g6A@����LAAe��4��ABPy�B�AC?bapy�AD3�V�V	AE,��6o�AF*�˫�AG-����AH5p���AIBWgNAJT=�Ǆ2        @o�)r��@7��i@U���@h�)��K@u��v#�@�.E2�g@�[k�@�@6hy\@�S��� @�m>L�֮@�硆�u�@����9G�@���3���@��-���@�Ц��@�@�=��@��@��lB��D@և�K��@�����T@�
˽�@�K���@������K@���IcU@�
�?ly@���D���@�+�,�[0@��W�7`�@���(x��A7�$��Ak��a�A��\�>9A	�z+w(A\����dAbB�p�9AN=7��A���W#A�Bq�A�[�H7IA�E��E�A���Q�A3��ş�A�F�A ���i!A":��n�A#��?m�A$��>�eA&<�:*A'���LA)Tb���A*��z�UA,��S�A-�ciE��A/Pi���A0}4��]�A1Xmn�a�A29���W�A3!�Q��'A4�`�}XA5S~�A5��wA6�y�E�A8LOI�lA9Zo~�        @�p6[��A�t�baA4����AHpf�AU�sT5}A`�`�	�Ag�b����Ao~S��4�At!C�qu�Ax���~�A~B~l�FA��3��JA��m���A�������A��e:�A�t1 �H�A�#I�,A��L��8A��5lSA����FA�
�3P9A�>=O�y�A���Hk|kA����h�A�(���`A�k� ˔�A���r�A���PIiA�|��A��ds��A�r�8���A���
k5A�����3A�I(��G�A� v��wA�����A��d~�AA��x��FA��`����A��?yʡA��<'��NA��=9�r0A���m�A���xc�.A�TA�9�? A�i�**�A�����m/A��?��A��;�� A���?ܟA�l���A��'[�qA�ج2ў�AÖՒ���A�ZY_'Y�A�#|����A��fg�A�Ƹ���Aǟ���)|A�}ѣ
��A�`-D��oA�F����^        ?�a�HY��@0`:�p��@M�_N�W@`��xC��@n:�1Y]}@w��K���@�	r���t@�3w�4��@�\�S@�Dir�D?@�ܤY�.b@���ǳ@�G�y��e@�Tߣ���@�����C@�-���@������8@�5�B;@���r�"�@��T8�?.@�D5N�(�@�ű_��6@�ia��@�I��-@��#�^�@����O@Ĳ֥0�@�c�J�bZ@�+��[�@�L��%�@��t�
@�"Y���E@�-O(
r@�X�b߶Z@ғ��]3>@�ݞ�Y�
@�6y���@֝�;WC�@����@ٗ؋d:;@�+81�@���6�@ރ��0b@�%r�U�@���V�`@�	� 6yu@�
�0I�@��b��@�'�X�|?@�CS>��@�f<�ˬ�@�; �P�@���J �@��$]��@�5�.N�@�y���@�ÿ���@�
и��@�`{���@�c���@��@��	�.@�|�@9        ?�	5��3B@" ��{�@D` ���J@\=�u�@o's�]�@~�!���@�@[Q���@��g'c�@�p����t@�/�?}R@����@� ��O@ɕ	Qz�|@Ѻ/L6��@�����@��&�]@���:�@�ZD/(&�@����Y@�&éuq@��L1��A �T��A�'�AA�!Z��A��~�
�A�5JX��A|*a�X#AG;�<AFp�b�yA}8�I�A���s��A!����"IA#�A��XA%=��A(7���bA*����gA-A�F(}WA0��e�>A1z8/��A3���A4�SK�]A6`�y	R�A8-�hW�wA:J�;P�A<����A>L��/A@w`��AA>����%ABj%�Vn�AC��9��nAD�Ҵd�AF5z6AG��%�c�AH���u��AJe��j�AKݾ���,AM\\ni�AN�.��d�AP3�I(�1AP�g�GAQ�0�s��AR�bh�?ASD\��a        @�����n@B�AC��@a?aᠾ�@tB�[��p@�7ǲzvD@�c3(YL@��vv`$�@�����I@�ɢ'@�8�)=�C@��{d@j@�K"gq��@�{��� @�~c�<�@��.f�@㯛��G@赤U�@���@�HPO@�i
O�@���]dS@��T�sA�U�`��A�RGA	��r>A�A�m���AH�M�@[A��W���AӅ��AIy%�A�W? [�A �go{d�A"�X��SA%p�-�A'�����A*:��АA-�O�:A0y��/�A1���fU�A3d�i�KA55Uȡ+�A7�i��tA9	1��A;1� ��A=Y��LGA?�Ң�U�A@�-��V�ABȔ�U�ACN��t��AD���䬓AEŅ�XmSAG��v��AHM+�`
hAI���!�4AJ�x\�hAL+�
{AMx2
��ANĊf��AP3zc�AP�����AQR�UϬ�AQ�b��tAR��5�7�        @�4�ϟA"�f�S�A ����sA2����(TA@ɽ~�K�AJW���AR�GjV�AX椓��HA`�f� �Ad#��D��Ah��x�Am����]Aq�qe4��At�<Z�Aw赑߳A{xY?@>ANq�^�A���	']A��ꚺ�A�H~��|A���W0t�A�}��k��A�Y���A��q�64�A�L�|<8�A���WT0�A����ѓA��J�a�A���Ah��A��p>�A��䟹��A�*�`��A�df�}�A���s-T�A����FA�d0PE.A���A��A�M�}j�A�Ӟ"��A�d���A��z��A���hB%pA�/�Ї�CA�Z[�A��-�!�AA��1x�DA��=��Z
A������A���SYJA��m�Z��A��-)��A���}.4+A��=+�?�A�Wȉ��A�7�=^�A�2�)"2A�P>�j�A�s&$��HA�M����BA��V�OsA�~ ��#�A�����IAº�'`�        ?�6�����@+DKFK�-@F�4S�!�@Xr8�W]j@e';6`�b@p.�wg�@v�Ni=�J@}��WQ�?@�/c�p�@���d�[z@�J�z�@�R*��P@�`J��Q@��� D��@�7� ��@�'L�q@�����+�@��Щ1�@���n�B@�G-�P:@��a�린@�t|懖@�!bi�:O@��S�H@�+T�T@��P��G@���q;�@�LkU6��@�)��W��@�Nat]�@�_�pL�@���f]�@�0��L�x@�P�!�n@�|��V{&@ĳ��7�a@����	�@�F��	@ȡ���34@�
�C�@�fJ@�i@�Ҳ��=@Α\��}8@��-[*�@�볳P��@���ET��@Ҩ��#@ӏk*�I�@�|��C@�o1��@�gl���@�eKr�@e@�i �;S@�r�U7#�@ڃ
�_h@ۚaS�E@ܸ		�o�@���m_-�@��ӧ@�����@����@�Y�a4@���/���        ?�8��)��@$��U@F�KK�@^&�D�9�@o�.��@{�`�HP@�v�v @�%�lsE6@��@I��@����a&
@�_8}���@�mz��a:@��cm �@�P=�w��@�)x_C��@����$�c@̽YH��@��=h��@ս�Nõ@�Zc�Y@ߧv����@��1ߡ=�@�C�J��@���Fa@�a}�ˉ@����@�+�����@����A	@�!��D��@�}4`�-A �G�`�zAy�d��{A��=V�QA�*��hA���9CAiKN��A� ��t
AN���_�A���HA,e��ydA��慮AR��!t�A���YAƢ�J��A�bS!�A�իR�#A���;�A �S6�TA!��n��A"����&�A$�;���A%G����A&{�d�kA'�;�=AxA(�Q��A*Db���uA+��%x��A,��AY�A.V�S��A/���>A0��K9[A1Z�@\)A2�%q�P        ?������@*��%�S|@G���K�1@\0���>r@k�Ƶb6�@xFVT?L@���"�/@����s�@�}s١�5@��2�N@���J7�}@���xK�@�l	��]@�V��m[p@���vtO=@ĝ�����@�O*����@Ў�B1@ԏq<��N@�7|���@ގ�9]7�@�Mi���@�C���@�q��a��@픝K��@�& ��@󂮃�*@�,Q5�R5@�����@�"7��/@�q�f�W�A~T�ƿ�Ab���<uAf͉�yA�s-@�?A	ԄL%�GA?�9pn�A�[���A�Dv\A+#��5A���/m�A6���
XA���7�A��ս��AUt�-�EA3����A'�(.�BA Jン_A!* �0�A"FM��(�A#m���лA$����5A%��.P��A'$#��A(u ���JA)�}���A+2��!Z_A,�n��e~A.�O�8�A/��0�~�A0���xA1Vb�.�|A2#���        @�}WzM�CA'���i�A����A.�2?&�EA9��'��vAC\v���AJ�[�YXHAQ@{����AU��A\�}AZ+����KA_	H�FAb$��u��Ad�~v��Ag��`+Aj�Y|9kAm�ןQ�Ap�=���@Arb���At6���K�Av �d�R�Ax����Az2�ז�A|V.ͭY�A~�����A�d޵�~�A����J5A���2��A���y�HA�/�a]�*A�x���A�ˆGc�^A�)s����A���A�	5�WS�A��xj�@�A����A�^��SA�7���A�y�P0HA� ���A��P�;��A��eŴ�A��83��A��e���A����L A�B[_���A�p2��MjA��%�m9�A��5�`��A�6`��A�����	2A�v�r]A&A�+ΑV�dA��I���A���A�k�~��A�5��`j4A�D5⡐A��F�{xA��z����A���7k��A�x~��X�A�b��Iyc        ?��h�Y@$O+���@Bc�L�# @UG���D?@c�E��@oo�,�@w.��ud/@��ō��@�oZ|�ϯ@���s��@�n���@@���(ұ`@����,B�@�)��K��@�m&�f<-@�Ձ��@�)�ʽZ+@����T�5@�/t\Ǿo@����2&@�g(p��]@�4e��.�@��^��@���$>@��:�
P@�3XӳI@��G��h@�}}��@�2���HC@������@������@͢�1�'�@ϒ��a�M@�ʮA >$@��s:���@��V;{@���׼�@�*��s�U@�W��h�g@׍]�;2^@�����<�@�2�ݪ@�W����@ܣ��^�@����m�Y@�>J�n��@�G|,�0@��ےc@ឡh��@�N��
�@�w�E�@�SMx@�w��ǰ�@�8�v�c@��H'�}@���&�L@�(+�^@�b��TIZ@�4�T�/?@�	��O�@����Z�m@�é�r+@��@T��        ?»ͧ�M@�/�6@'�/��m@BQb�ȉ�@Ur#_=@ek|܅8�@sW����@�N�?�@�aOa��@�	1�j*p@����T@�\���I@����Q?�@����pv�@��| �E�@�=�Qx�S@Ǩ�[�4�@�0^����@������0@�|�郐c@ܰ�
�@�L����@�!$�@�OY�Ni�@�cN�is@�n�
zQ@��/�rx@��05�#@�hHSb'@����%�@��bB mLA3R��RA�0�ATA,�AADN�VXuA	�y��&�A�s/sAxy�/A��J@zCA���r\AuW+��ARF@��A�۾�MA`��UA/����UA!���A�3��}A ���4	A!+��pA"N��+�A#~{立#A$�Vq�HA&��`�A'Tw<8��A(�F�SA*K�8��A+��qC"XA-����A.��>
�A0x<��"A0ЉC߄�A1�*��A2k&a��        ?����\)@*�d�=�@M������@d`��m9@u�/�/�@���Ic@�y��>` @�e��#@�!,9R�&@�+�DI�@��3ٺ�@���wĤ�@���ER�@�M�zQw@�>���^@��j���@ҺĒI*y@�i���@ڌ[e��@�0|���|@�3����p@�#{�Q�.@�t�0��@�4�I(��@�6�n��w@򔕶T�l@�7&P@�!<p@�U2f�B@�ծ�AZAS����Ae��̓A�m���A�3��A
��ЛA��H���AE�4Bl�A�h�_b�A�wO`3�A�W<��A�����A��Q�:�A�d���>AdB�yX�A }u+��A!�u��~�A#R� ��A$ޙ.<_A&�H#wwGA(;����BA*�J��xA+�x���fA-����^�A0K^;A1+���=�A2T}��`A3��n;�A4����`�A6(�A7t�j�]�A8��J� A:N
�K�|A;�x����        @�k��ȋ@�<�I9�Ag�,�RA$j:�AOA3�֘z8A@�L�8dHAIէm�`AR�u���AYra<��A`��G���Aeds��Aj�l�.�'Apy"ˁ(�As�J����Aw��`4~>A|-B��A�h���DA��^��_A�,�j�A�=2�:/A��[��A��rA��ԏ�ՠA�6K��XA��Ϳȁ�A����$�A�W�!Yk�A�$��3A��6��!A���؟A�ʺQ���A�b'1�$A�e��6��A�qFH�79A���܇��A���s>��A��؊T��A��[���A�!����;A�X,r�\dA��%�A��� <A��<�A�:;.��A�n'�'A�Oӳ���A���YQA���Κ��A�y<��A��Z��$lA�U �O+tA���u��A��}�H�_A�Jb���A����sޡA���̓�A�mh�a�A�-�W�oVA��[��A�����|�A���*hA�S�VA�$6�&�U