CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T105349        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                ?�              ?��D��?��|�TK?��[�d>@�w��@8��U@$X&�ί@-0�D#<@3�h�@9v���#�@@J�r�&@C���3ud@G��f-�@L��,��@Ps���f@S	���@Uψ�-�@X�}�{ޮ@[���1�@_L⩍ @al*x"N�@cJ�ؓ��@eB�EW�@gT���@i�?��@k�f�d�x@n+�FL0@pWN�ʁ@q��W�@s	(+��&@t{O��	@u���CU@w���yB@y:f���@z��N�n�@|���
�@~����Q_@�<�	W.�@�7���"E@�:\���l@�C��	Nl@�S�!x�@�i�Зh@��nŶ��@���/�@�ӂ�Kt�@�@���@�?¬|�+@��l�ZC�@�ԯ:���@�1tl��@�M�',��@�	B��$:@�˺�k}@��# �	�@�e���}C@�=]��D@��S��L@���y�@���(��[@���w��@���[�@���V�@��^�jQ        ?�Nr�?�0�RR?����|o^@}&�$@�D~�_@(�ύDL�@3I�H���@=T�-f:'@E�
Iک(@PD���@W�TK�v�@a-����@hg+�N^@q	�n�L@w`0�y�@�1I*@��X���@�=�:��@��?CIt@�0�.Ft�@���?�o_@�/��P`@�A�=��@���PQT�@���vEb@�G���@��F�Rc@�gk�*�@��(m��c@�/��~.@�Ϟ����@ƶK3��@��]�O��@�dJ�p<@ЙL5%h�@Ҫ�0�(X@���	��+@�R��~js@��m��s\@ܹ��l��@߹v�.��@�w�1�&H@�.I����@��T+(�@�󞓺��@�-�=m�@�4���o3@텥���^@��'����@�F\��k@�앲�@�� ���@��p,�K"@�x`�sw@����@�q���(@�5�����@�
`R/_�@�￫��vA �S��A�n�<�A������A�����        ?�����3$?��,yU?�f�T��4@0���@9-�_�z@(�0vq�@2�
֥:@;��շ��@C����@K�o��{@Sny��jg@Z�`����@bV4w]\@h�OK@p�8��WK@u����.6@|}��֙@�N�/`(@�7��}yt@�:W2+@��3@��Ix8��@�YX&#�@�Y��jM�@�pl-z�@�t��`�@������@�/+���@��sڼ�@��Hث�@��+n\@��P��[n@�����@�0kW�8�@�bq�m5@��|t>2�@�m�j"ZA@�����@·.U9V�@��֕aB�@�
��V@�88%
;�@�g�$���@ș�c
�@���,��@��4�L@�?(`��
@�}P�$�8@��+���@@�X���@Ы��.U�@�W��C�f@��;��@ҽ*���@�xd�%@�:jh."@���~@�ӏ�x��@֬�X��s@׎�Lt,@�z��L��@�q,s��@�r��        @b�Ƴn�@�h\����@�s�4�@�/˙�]�@�F�А�@�WV��#]@��B��j&@�<���e@�<��j@�	rHU@�*�˪��@�ȳ�]{r@���?��A�'�Sw�A���XcAA	l��ƕA5��ǌA���D�A�q��AM���MA��9�A��J�ؖA��E�\A QN�R�A!�x~f�A#�g��OA%r�����A'RW�BA)EyWafA+JФrݜA-b���]�A/�\}P�9A0��Gn�KA2^f� �A3/�2��A4`c>�A5�W�D��A6�t�R�ZA8Ϧ>-A9a��X�A:�NW�lA<
D
��A=jc1�=A>�az{�7A@"�v>�A@����uAA���Z"ABmg��N�AC>ռAD����AD�oƻ�uAE���B:AF��3H��AGũv�|ZAHǇ�+�AI��>�<AJ�q�oALvi5�AM3��y��ANjo�a��AO���/��AP~reU?�AQ,J)"��        ?�";�?�|�v%?尷&ͅ�?�Z_d���@	$9���@�26��@NW��Y@&��g�C@-�^�[�J@3P�ɿ@8OfQO�
@=��F*@B �.4U�@E]�FP��@I
+-lH@MR-�A�@P�z��jF@R�7K�b@Uz[�P[@X%�Q-�@[%:�{@^�ܾXd@`�����@bj�\SYU@dDo��N@f:�eDY@hM�ȕ(@j$I~�H@l� Ԝ`@oG�k��@p�,W��S@rQ�I>��@sŝP��@uM�.� @v�<�?U@x���'�@z`�s[�=@|;�� D@~,���_@�+�{@�)�v�=[@�E����@�nT���@��]�<RN@������@�3�6��;@����y��@��@N�2@�j�Xy]r@��E���F@�{J�y07@����U=@���O�@���~�M@��LgH�@���<��@�s�����@�gS,r�@�a��4I@�a$xf��@�g�RH�@�t�u�A:@���X�1        ?y�B�8V?����(�?ڰt�'�}?����?�@��_:O�@)53JX�@ ���n@)'P�Uޣ@2�7έ6(@:��',:a@B�� ��@I,f��1�@P���{�U@U�'���@[�#q�6o@a��@g�@e��Wz��@kq޸�@pt�Z.@sԮ�Ƒ4@w��-G�@|� ��@�o2����@�#�b]�@�"��c@�m(r�1�@���m@�{oT9@��L'��@��k�E��@�j=��@�����!@����@����@���I��@�r_	��@�T&ĥ�@�UR����@�w0��G�@��!���9@�"�qh��@�W�����@��d��@�~�<Z�@����w�@�<�e��@�����d@����
�@������@��-!�@��ӳ?�I@��J�i{~@�!6X�@�[����@ĥ��uo@� ^�<��@�kRƍ�k@����Z@�s|v7��@��֔�@Ϳ�v�K�@�0�(@Ч�W5b'        ?u�%[��?�:�=�0?�E$R�ER?��!j�~?�H�ڪ?�V��3�`@�nB���@��V�|@5���9@'���*�@2��f1�r@<}�P��@E8���V�@N�7���j@U��1�f@^���@dW���)�@j���B	�@q�dl@M@vv���J@|c����@��t�L�@���8es@�_?Ə-1@���f���@��k٨$b@�A'���@�	4��M�@�9�ڥ/@�k�l��@����@���- ��@��jq�A�@��),D@�4����e@����y@�w��@�8<0RFp@����45@��Iށ@�|�7wM@�˜��z@�����2@�=��m�@ġ�,�k8@�L�w ,@��!��L@�ኯ���@��z�pn8@���3tT@�ߊS%��@��g��@�$�|��@�O��H�@ԅ.t	t�@�Ņ�/�L@����@�f��#�@��:]qg@�2�9���@ܨ���Pk@�)0�L��@ߴ;��e�        @5EAmD�@l���3@�M\z,@�o��>J�@�*�`��@����RC@�G���k�@�!	^Ji@�-8�T�@�t�A��@�dT��B@��P�&m�@塁�H�@�k�\�c@��q���@�\^ke@��{���I@��7Ħ@��'��0z@�Љe�[A �:�{�A����>A�Z=�@�A��c�AF7�,�[A
��C}A=�q:+A����ѭAp(�ǩ:A�!%ÛA��.�$sAhEB��AHJm%7�AE�Di=�A`x�]��A��c|�A w�E�q2A!�	�A"�����`A$[O��.�A%�%��CdA'K͓z�A(��&�G�A*�%��A,F�k�'A.�Z���A/���A0��/��!A1�hU�.�A3�4xP�A4'��HuA5Il�C�]A6s�A��A7�Rm�hA8�*�:(A:"�T�u�A;l',A<����7rA>'Dbd�A?t�ƻ'A@m��~@mAA$����AA�;��D&        ?����d?��g	�@
�F�#X=@��z�@+zF�4�@5�@�M*@?3)���@E8�E��@K�%-�/@Qqf�ڑ@Ut�ƣC�@Yݦ�E�@^��b��@a�k�@d��NaZ@g�:��=@j�:��l�@n4��n�@p��uT�a@r��eB��@t���ǒ@v��V�I3@x�K��Wn@{�w�!@}f܀+@��&.7@�&��p�*@�q���d�@��;B:��@�,��Y��@��L��@�ۚ[{'@���w��@�4��6@�զ��C�@��8�:a@�����t@��j`^f@��<����@�ڷYI�@��?��@���Iˢ@��O�bkE@���q��#@��J�ZZ�@����#H@�SV�
D@�/��%-@�T���@��Q.u!�@��6{'t�@���t[֚@���[��@�:�����@���ĩ?�@��`�k�L@�:vl�~d@���-�@��F��S�@�ZV�D�@����Vw@�֯J���@��hǳp�        ?�R�e7��?ā�7��6?憎0��~?���/U��@(m�@��@$s�qC@.zV5�@5犹���@>���E@E,���-�@L��;���@SE��@Y�,ztr@`��[Ի1@e�N24i@kir��2�@qB���@uy3\4�?@zj0�P@�(��/�@�[�� Q�@�8ܯhh@�Q���@����J@�����@������@�������@�5��*�\@�����M�@�
�5�'A@�@L�b��@���F���@�-����@��n�`)|@���%@��L��I�@��Ɵ��@�e��佚@�E�e���@�C2�(D�@�^���ű@������@��p���@���0uB@�
`�"�@�m��lm�@�� X��@�n=�!ӝ@����r�@��j�Y!@ˉG���@�gʺ܀@�\7'!�3@гcP��@@������@��gS�Ʃ@�#�U�X@�7�n���@�t��Y\�@׼,���@��&:�@�ioXA��        ?�WcG��@ ֊��@��:�B@0VG�)�7@<'%	8�@E$'�@Ɣ@M<�}p@S+@M��@X<�Qr��@]��t��@bٺr�@e��#2c�@i��MQ��@m쌣��@qp����@t9sVT�@wZ,N\@z�L���@~�amWg@����}@���D@��Qb�Q�@���!��@�����-@�02�\��@�ԩ�U�@�)��@�a�k�@�Ĥ��@�R$��@���\��@�y8B:��@�$rY�z@��U@��L@�c�@f@�9��*��@�*��F7i@�7#����@�`X*�4�@��IwiB�@����y�@�I���@��+9�q@��0�Ŝ@�x�pP@�:3($,@���K��A@�OL�/SZ@�%�ݾ�@���T}#@�n���@�qP��B�@�H��t�@ØЕ��7@ľ.�9��@��o4B@�-����@�x����@�Ϛ���@�4Sb3S@̦��z��@�&x��@ϴhĵ�k        @b�}��@������@�ڒ
���@����%@��ض��p@��O��&A /� ��A�U�f��A��GJ�A�v�9�A�w�9q]A}Q�,�A�8���3A u�t�N�A"�+rf-A%"�{Z��A'�_:���A*9 ӵ�A,�z�wA/�����A1DI��:iA2�l��Y5A4?(���A5̰��d�A7er&�_�A9
���8A:�S��(�A<z��T�A>G"��}A@���-AA�7��YAB�XQ�AC��<>�AD��e�AE/�p��AFM��=`YAGs�y�AH���"��AI�����AKd�ڬ�ALQ�<�(TAM�
*q(AN�S$���AP!P�g�APЂХs�AQ�P3��AR9ʍ91�AR��)�AS����,ATt*-#D�AU:<J�AVi1�;AV��Β��AW�QtRkAX|'ɵ<OAYWS,���AZ6�W]�A[��SoA\o6/�A\��)$�A]�a�v0HA^����A_�\�(_        ?�}sY6��?�"���@?�2D'&��@ M.��@6��(��@h�~i��@"M1�J�@(�Ԍ�s�@0B�?B�d@4����w @9zٯo��@>�q�~@B}��:@E��l�@Iz�y�	@My'�y�@P�� . K@SGL^)?@U�@)$@X���_(@[�"	��@^ʡ��H@a���'3@b�C�-@d�;,I��@f�#�`�@i#�K�@kg��^Z@mҎ����@p.#���}@q�r���@r�)}@tX�6}��@u��_k�Q@wi��X�@y�&��@z�m��ժ@|u�j��@~E�dwn@��d� I@�R�z��@��̬L@����>@�)��vPm@�EM� �6@�j��@���Gj�@��bbI��@�:G�@�Z\���@��{6�"t@�	2��}\@�ma�oO@�ls@�&)���@����r@����Q @�i�k��~@�2M�K�@���f4�@�ΐ?Ȏ�@��MM��E@�y�YHy�        ?w?�?��*��g>?ŗ�'J?ܝ�G�9M?�+��c�@ �^}p�@�Kt2�@�Ԇ�D@,�LO�#2@8�e��F@D-۰��@O����B@W��q�<�@aW7�i@h\�6�	@p��	�vb@u�SL�~@|p'�K�@��o�,@�Y�����@�Q�ԛ�U@�w��^�@������p@�"?�x�3@��'�~�@�Ud�]��@�j1l�<@��@4G@�uh�^@��3�@�䙫�)�@�`�@��R�\l@�ԥ�/�`@�R�`@��
��6�@�&���
@��~?�7@��4�4ZM@u�Y�7@�<0W�	�@���DU�@��)�"mx@�� ��@��<�@�7�#��@�Cڎ�@�y)0��@һ�Wܙ�@�����@�hVw�WC@��	�t�@�H��g@�˚C�>@�[>�5�(@��[
�h1@ޟ�w��@�*m�E��@�B�@���`��@������@��`v��X@�˹Y�W        ?��e� D?�8�E���?�(�{��@ �X�W��@��k@4�ż��@%uE�@0C�o�T�@8HZ*@A�T��@ICuP�;Y@Q��m��"@Y4��U�a@aq�{%�S@g��`��@o����@u*���*@{�0����@��ŉc��@��MiY�C@�(�*�'4@�eO�ğ$@�<�*��f@��Ʃ��!@���=�@�GXu�j@�;e�%@��!�>�@�r��.e@�H�r@��/����@��p��h�@��Jm�J@�Z��Zt�@�^�UeW�@�M��I�%@�	R� xv@��v���@��mJ���@����>M@�G����@̴��(�@�K��@�Q��^@�~�x��@��;vk@ն��^��@�xoK��-@�TN�?+@�J�xI�@�\����@ߊh����@���I�w@�m<d9�@�\�)j?]@�u�F�Q@��:��@�r	c�)@���KЍ,@�oM饻P@����/@��Eg�S]@�M6�i        @F�Pad��@wq"�e�^@�H��'2@����#M�@��j�3@����+�-@�9�/@͡Sm0�%@�0�:F �@�.)u�@���ZY@���ռ�@屳̹�@�t�Df@�0lC�Ku@�a���@�Z�)��@�i��[E_@���,K��@�{�wFJuAB�C¶6At��rMyA�s0�wRA_��NA/�P��A�v���HA�N/��A(QO��A�>,�E4A���eA�+F�A{�:Qg�A�]���A�)���A�H`��A!:���A"A%��ňA#|���;wA$Ãt��A&��4IA's��p�.A(�M=��7A*P�@A+��[��NA-XLC��A.�����A0F8#��bA1����1A1��0��A2׉kW��A3���ppjA4�Dx�`�A5��,�(A6���;�A7�+a��uA8��P#�A9��#�L[A:�*�n�hA;�S��ffA<���rhA=�Q�aA>�V�֮�A@ "��        ?��\��?�S�p4�@� ����@�z�g�@����@&�`SD�@/����QU@5[�1��@;~͠�@A-��j_�@D��76N�@I[39��@M���m�@Q9���[p@S��u5~�@V�i��@YzH��)@\����h@_�.�,:e@a��Sp@cZo�[`�@e4X��/@g"�|I��@i&p�Ȏ�@k?�@mlWC/@o���΅@qV+�<�@r5N���@sr�+҄@t�/֡��@v�G>�@wg�_���@x�	B\�@zA	W�R�@{������@}D�ШiS@~�U��M@�7�=�t�@�	t�<D@�����s@����
V@���Q�@��9u�@�kYW�Y=@�\�SG�w@�T<'�'@�R_���@�V���T)@�bq�@�se�K�&@����d@��;b��D@�� ta�@�������@��VA |A@�3�H,=�@��v ��@�z�G^?@�$~�W@����[�@���5��@�=�]]        ?b��Eu�?�i�1m��?��F�ٸ�?�Q0T�r?���,:��@"�A��@�xZ@ %\8|�@(���Ts�@1�����@9����Q�@Aȡ�0@HKSC��@@PT��	g|@U�`�˴�@\D$Ձߏ@b97_z�@g4 g߁)@m0a���@r&'�H�<@vR�Sgq�@{+ce2�@�^��+3A@��[L��=@� ���@�$���2�@��x���@�F�3%d@������@����T�p@�9g�廄@���6�?&@�J�-+I@�\ ?=@���+ּ�@���S��H@��<�x�@�O���E@�!���@�����L@�fsqO3�@�4��gI�@�" ���@�1�<@�cV��A�@������@��}z�@�phږ- @�ٛzI�@�Y%�B;@�����@Ǟ̭(ȣ@�f�"oه@�H6��@�Di��j@�\�e�Y@�����@���~=V@�(�wI%@�n�YX@�����.@�-:�B��@إ�v$,�        ?��/�r�?���V�y�?�fQ)�nl?��Q���@=e撪�@�9��l@�⚏xG@"��X_�l@+�'�a�N@3�U(+K�@;�_�@B\�x�@H��i���@P�L�%@Tܢ��z@Z���.@`�ЊS@e�'�f5@j$
L���@p�jS@s��˺�@w�=���@|B��C-:@�μ����@��)2Y�2@�K)Z�!�@�)W��a@�|le�5�@�&Z��@��3G(m@��f	���@��un�S!@������@�-9���6@�C��h/�@��qy2��@��i��@��ʋ��i@�^Ϣ��@�.L'W�@��W=��@�wS���v@�B���c�@�(v[x<�@�)��Z06@�G@)���@������@�ښ��@�)6B:�@�u+��[�@�ѧ�i�W@�?귱@ƽ�x��@�N�uT`@��=�}��@˦n�%g�@�nz15m�@�I�����@МW~yqp@ѝ�-�X@ҩ��!��@ӿ�Ͳ��@��s��}�        @Q�T�YL�@���a��-@�hvY{�u@�d��I@�4�zF@�`۪NJ@�U�k�i�@������[@�'�@��@��'�
�N@�j-�`@��q�j�@��b�H@�.�ݺ@�o�� �@���l>{D@����ѥ@��2��e8A:Z��ЩAOG��cA�>��A�;/
�}A
mn1F[A;��ֵA��"��A|3��-A��A�����A��^�AdR�:��AZ���ՃAk�yA�.Т�oA n5�H@A!��P�t�A"��]>�A$'�d�hA%o�n�=A&�p(��BA(S��$��A)����VA+XjˉAA,�Tճ�)A.��4A0,�A0�����(A1�:�?��A2�~�p��A3ŕ��3�A4¾!�+A5�,lPn6A6��wϞA7����A9�)?g3A:4p[�JA;eW�$�:A<���.@A=��� �A?1�}t��A@D]��rA@��Lc�AA��n�ABc��.        ?�)G�5/?̋5o��?��I�a�?�����9�@���F�m@��y�@�F䃘.@"e�rU>@(�I�@.{=��+<@2��N8-@6����~@;g&�B�@@*�8�/@B��#���@E��%�V@H�y��X�@LK�uGx�@O�6�7�@Q��lE@S�`���1@U���ݗ@X4�5�ȳ@Z��tm�=@\�� V@_�Jy��O@a/��Tv@b~=���@c�wUA�w@ey���.@g^N��E@h��=��@jyl�tzK@lKs�NA@n2���R@p4�T�@q"ml��D@r9	8�B	@s\�# ��@t�U�@uέj�H~@wl�#�x@x�T�؈2@y�KB�@{{C����@}���3@~��=V�e@�?����@�)9AA!@���ݚ@�;���@�$C���@�7�	�J�@�U�|�;�@�&/N7w@���YLm@��u���@�>�P�6a@��:��uX@��.$Q�@�d^��@�n�6��@�0�ia��        ?�����5?��}.� ;?�
^�>��@��e!�@��qπ4@>��+��@%-�GS|D@.g�r�Ȫ@5,���@<ۘ<W]�@C[7B�q�@I��Fm��@PڷЋ��@U�Z��+@\a���>@b1G�ҸZ@g~�9��@m ����@r-\��0;@vzr\XDb@{�v�W�}@��L,��/@�%x�(}@��N}�O@���+�G�@��w{�l�@����a�@��	����@�7�H�9@��CPR�@� Nj�ѽ@�k�[��t@���X]9$@�����\;@���5�$q@��c�R��@�I�mh9@��u�֖�@��&���@�����(@�*,� j�@����bĀ@��;BIm@�e#a8@��mYR��@�Z)���e@��M��^�@Ƭ�?�@�{�Z�O�@�e���W�@�kR� ��@Ύ��B�@�g�J�S�@јD�%lA@��t�h�c@�+��s�@Ր�nM�5@��nt�@ؒx|v!�@�1D����@����b�G@ݭ��:��@ߍ�r�        ?���H@�?�r5χTB?ٚ���a?�;�Y��@�ٞ�H/@S,/1��@&̃��@3��~�Y7@@Hd�X@I�t`I�@S�q�޷@\��[��:@d����~�@l��i$L@s�l3��N@y���@��{S�J�@�o�-Ge@��%��/@��<�f�@��ǽ��@���G;@�p�X�@��خK|�@�Nk}��@�.[�I	�@�E��[d�@���T�i�@�
�V��@���Ύ�N@��5�k��@����,�@��a+Y@�Rh{VST@��%na>�@��̛��@��Yo*�@�"�G�ע@�H�A�`@���>`�t@�\����@��_��>%@�lX#,�@����@̯a߮*@�df��i@�ð3
@��^)��k@��'hKO�@��?Q���@���ɜr�@����z�w@��i�q�:@�
�z-�@�(Y�?�@�N8���@�|�q>�@۳�Q�^�@��"�V�@�=Vr۶�@ߏ���U@�u��A�@�'�����        @J��@,-@~�C�z�@�1-G �@�'%k���@��s�*3�@�Qdq�!@�'BJ�es@Ӵu�>n@ك���tg@��5��0�@���VN�@�k�b���@��+��@�N]]�@�f���D@��C�jb@���犩�@�^ �q?�@�OF�M��A 3 �)�A� �tA�(r��AM2��~wA+)��XZA	 !J�A-D�@�AS�����A��. =A���L�A5녊�A���?A�@�uAJ{�B�dA�;i�Y�AX�`�A���jHkA��C~&A~%E�A�A 0��_oA!.IO0}�A"9�.��A#Q��0A$xޔ��+A%�g��A&��C=�/A(J�Lkx�A)��S�t�A+'o��BA,�|_�A.G�N��2A/� ��r"A0��C�	A1���	�FA2�t$U��A3�n��UA4��n��A5��F���A6��{��A7���ݭA9�=t-lA:Di��A;�E%��A<�D��K�        ?�QWΥX�?�n�z��@��;�R@!����pR@0�^#�  @<
r�[L@E;�~�@Nw{*�D@TU� �@Z����@`ΙL��@d��菅@iM/�/�@n@�~sx@q�G����@t�F��@w�E�85�@{X�єq�@~��[Ј@�e�_Y��@�k��MU�@����Y�@�Ĝ|X��@�!�Df�@��:�W�@��D�?�@��Y�CR4@�-�\@�� �p�@�DÛ\�@����=;�@�/1�nZ@��1�J9�@��
e�@�J��k@�Sq�Xb@�~CVx�o@�uz�#7q@�s��'�@�x,���@��"8{	>@��=��,�@��Zy&|@��S̄�@����F6�@�,NM��@�@�ϡ�@�s[�¬@����Z[�@��	�v�@���dz%@���ԌZs@�U)���*@��מ���@���U.��@�C�خ�Z@��.���@��v%n�@�<�k� @��GD�@��E�HN�@�@8��d@��vY�u�        ?֛�GE}*@�e��K2@3�9z.@Hɷ3|�@Vxe�rU�@b%qS�z@jf�?�@r+����@w��[�@}�Sڍ�@�w��!Q@�T��>}@�����@�:��j��@�(+-���@�� I�P@��t%4ج@�=kp?��@����@�@�Y����G@�u����@���jmJ.@�7~��{�@���դ�@�� 紞�@�n�YyEx@����w@��樺Lx@��?M�w�@��E�2�@�]o��@�V�6U��@��?W�@��RKP%)@�&YZ�Y@Ó��'+@�!��ރ�@��<�� J@�r�z��@�P�[���@�9�K@�;x��x@�+@��-@�E?��@�lF.�h.@Ӡ����r@�ⵌo�@�2mvq@א��1<@���z�+�@�v-7���@��w��L@ݖ�	p�U@�=�����@�zC¬@�]	<��@�G����5@�:Ȍx�7@�5�����@�8�y\��@�C��@F�@�V�<猥@�q�c�I�        ?��X[9��?��- ��q?���eo��@A0)2�@=���@&�� �a@1���@:�$J�{�@C%R�uI@K]D���@Rî��w@Y�G9�@a`���v@g2k�׳@n���B�@s�^1}}(@y~�$?\�@�$���@�/�,O`@��N�z�@�n+W���@�]�$Q�H@����+�@���V� �@�m��u`@�����׊@�fe���@�\OQ1�V@�� ���@��)��O@�����@��~g�_�@��w�r@�_Jռ]N@�ּ��$�@�x�[{�i@�Hc%5P@�#����1@¼lazJ@�o��D�s@�>��oR�@�+,_B�d@�6@�O��@�a:���@έ P��@ЍWG�e�@��26�@�.<�.52@Ԙr�cA�@���
�@ן̯��@�<���@���KS�@ܧ����@�t��IP@�)@~w	�@� B�{�.@�p+ش\@�&�1�-@�6�N���@�O^�3@�p�_aI�@盤�xn�        @q�R�@�J@�:í��@�\TI���@���qG3�@����Q�@��F4	�(As�KC�kAbk(�_A�̉�tA	���3�A�h!�;�A"3{�U��A%��Й�A)���, A-�36s��A1�6�@�A3{�]L�A5�&�_�2A8�!Uj�A;l����3A>V�k�^A@�,�RpNABF���AC�K�XY�AE�D��?uAGf&�]blAI;�0=AK!����AMT��>�AOY`]�AP�5��AQ��w���AR�&0T��AS�L�,�AU��@&OAVLh(�T�AW��P�@'AX�^S$ΗAZ��J6'A[i��4s�A\�LsI�A^& 7�z�A_��`E��A`K�s�(Aa:N^gpBAa�W���vAb�7 Y�Ac|���VAdB�y6$Ae
���Y�Ae���qAf���HݏAgnpa��HAh=e��tAi�YF��Ai��y�Aj�\���Ak��y��sAlY<���\Am.��g5�AnRyV�oAn�2���Ao�.FE��        ?��p*Ө+@JLg���@F��g�N@1��K@>�Pݢ�@@H&F����@Ql�7��@W���gC�@^����p�@c�k����@hb�p��@mᎴ@q6Z��`@t!����@wF�4��O@z�֭KC'@~B"אve@��rt1@�"��@�[pB�c�@��P��@�N��_�@��u�t�@���T��@����Bj@�#��8x @��ݩ~�-@��Ry��@�v�U��@�b�.C#�@�af�	n2@�q�~ @�Ig���@�a�y���@��G[$�4@������@���S�B@�	і^@�D��:q@��P�<@�����@�!KQ��^@�z�nI@��ke>H@�E���S @�[�=���@��Q��$@��N*��s@���ȉ�y@�f2�p0�@�2���@�(�&@��q"��@���.���@��Ъ�ۍ@�[�L�h�@�9Y*���@����@���.p�@���l@��ڣ�	)@���"P#]@�� �3Ӱ        ?����5K�?��V��[?��H5�|?�h�n�d@*���_@ľYԓ�@,��QE@9G�X@E�fج/x@Q��Y��@\k�#mk�@e���,9@o���M�@vVJr�-@~���m��@����u�@�MT�q�@�a<C3��@��߿��@�"h���@��pu�@�ް�*8@��vD�ku@����<f�@��o���@�K.���@��<�x�}@�_s�@��@��S�x�@��"TJ�@��٘EQ@�v�'��<@����{�@Ĥ���͉@�Lւ�ڎ@� �y��@��V��{@ˎ�~��.@�j:!W@�T�͊	@Ш�@>�@Ѯ��c�@ҿ ��S�@����K�@� .�	�]@�2 9{ab@�o�,Q�@غo��}�@�ʩ�aI@�vh��@����@�h�ҶPv@��j�H�@��3w=C@ៈA��@�{�f_�@�^�X�VJ@�HWzk�@�7�a�F@�-IB��@�(G�eJ�@�(�}��@�.Er�         ?�N�+�
�@
�ڑ!�@%����@7D���k@Cȉ}�b7@M���{��@T�G!��@[n�4l�@a��:�@f?�;��@k�-6c�D@p�@�� @t�o��+s@yXO8��@~;.�3�1@�Sw�;@��fYO�@�i���@���6�hN@�n[��[=@�=���z@�`ZP/w�@��@a�p#@��P�ZU�@�k�x"@��K
�V@�d�N]s@���sfEA@�xvX�
�@�\	D��@������@�;��i��@����L�@�r��<ͻ@�R,��@�ɤC�}G@��@��	@�=�@��@�ե:��@���~9�
@���.�o�@����p�_@¦{��@ÖuIǢT@ĉ�P��@ŀ����@�{��8~@�y`f��v@�|-�0u9@Ʉ CT��@ʑzRh�i@˥O�X�@��B
q$�@����H�@���E_�@�!۳���@����*2@�f�g�@��$oN@��F�´.@�{4Te��@�9�Ln�3@���$��Y        @��J��g�@��X|R@�/�yF�@�Uy���A�TL��A&h�u�A'�65�A;�m��A!��0LIA&s��^gA*��U#QQA0&U���A2����"A6���d�A9>�Z�1�A<�*���A@ʨ=��AA��Ǚ:�AC�P*���AF͢�WAHA9{�@fAJ�x��0QAMJ��{~AO������AQ \tm�AR��R���AS� ��AUi�ْ��AV�x�\�fAXw�x%��AZ{���FA[�j*n�A]H�_��A^ﯭ�RPA`Ntߛ�Aa'��EAb��fR:Ab��ɡ�Ac�,&"O^Ad�&#`��Ae��5�Afw�B<�SAgd���cAhT��>�AiGn*V�!Aj=y<l�;Ak6�6�=�Al3SI��Am3Nx�B5An6�Ay�eAo=zvAp#���6Ap�g;=�Aq2�򠶿Aq�I�,OArG~&�2}Ar�1K=s�Asbb�8V�As���c�At�;�́2Auە�;Au��'��Av?dkg-        ?�F����?�T� �v�?�:�_l@ �y�s&�@2��3c@*�V��@!���M�@(��:�:@0pJh�S@55&u��@:���.�Q@@qӃ���@C��U_@9@G����@L*�I[L?@Pz���5�@SA��u@V4�co*@Y6�v�),@\�b��@`>N�.�h@bL��ϝ�@d�w�s�@f��In@i��T���@lD}@��@o9X��Js@q0Ȃ�:@rܾ��pS@t��r5o@v�[�|�@x{|c�i @z�F�Cs,@|���5�3@0=ZMC@���t�@���%z �@�7�#@����b@��6��b@�bΛ�
f@��h{s�@�h&����@��Һ���@��99s��@�I-{U�@��H"\�@�a�u^�d@�H�	��@�5�qb�@�(
Q*�@� |^x-�@��&���@�#S��A@�-{��0�@�> ���@�UfMf4k@�s���@��F�,�@��E>��C@���\t�N@�O6-�@����i�        ?���7C��?����(�?�]C�)=?�ƿ�@O?��@K�@
� �%r@�O��{�@/=9��@&���@0S��&�@6�8��,@?�@����@Elm�W�c@L{��kv@R��f�@W����
@^F>BgG_@b�F��b@gM[���@le�{mP`@q��@tp�DĆ�@x0a�<@|c�R�@�����@�#�i���@�����@�2!�-��@�����QY@�DI^�U9@�^Z$9�6@���Nw�z@�)x ]#@��&�]�@�����,p@��s4�b�@��0Ϻ@����,:�@�� *};@��s���Z@��;�g�@�d���|�@��?'��L@��^\��@�[t7�>�@�럌���@�����R�@�TS-�	@�.w���@�"��*E@�2��Y�@�^a�b( @�ӯ�P�@�K��o�@�J���#�@ĝ� �s�@�!���u@�w��;b@����D&@ʘMC�_�@�D���ZF@�%۵�U@�ٿ��~.        ?��u��2V?�6$>�g�?��
�?���~?@���
�T@�Y��Ml@!?q��h@(�\]do@1�hY�@6��pm@>��@C�kc�|@H�J��@O�0 ��@SؙSuj�@X��T��2@^v(�ڇ�@b�8����@f������@kvqDHF�@p�bU0@s����6�@wn`{��Z@{�Նb��@�EL�͘@�`��w@�"_2:ȋ@���i�a@�����@��@�A�T@�Z�{�m@��G�@��;I�@�+rX(�@��v��2N@��m' N1@�׶��{3@��>o��@��e��@�+�ͱz3@� �x��?@��|c�@�%�k���@���-f�@��&�j��@���F�Io@��7U�п@�T�˴�@�nv���@�x2���@��ŧ���@�2ECF7D@Ĭ3<���@�:
~Y�	@��>���@ɓ9�-'�@�_d�Qg�@�A%��`@�8仟��@У�����@Ѷ	q��]@��.�`)@��-��
�        @Oz��*p�@����X@�[��$�b@�ÅgX;@�W��|��@��P��:�@�d"jFB@��]!�8�@�K�)fR@��.�x��@��T�x@�&�0W@�'�>/�@�]�j C%@�����\@��k߄�NA ���A�x\�VA�y~��|AT1b[QARkP�u�A����A���OM�A�Z�.�ZAҖ9�A썟�ϻA(�CuA��╌VA����xA U����A!��2�}0A#0�d޿A$���⠎A&Uh��jA(�ת*AA)�x)S;�A+��߈0@A-|�r���A/t���A0�o̊�A1˅J�MA2�G�ShA3�@�!�A5%[J+��A6S�$G��A7�P͛�A8��`ϼ.A:�j�"%A;^E&�ήA<���f�A>�6SA?{.ƌf�A@uT��vVAA1J�)�AA�za�AB�D����AC�oG�rADM�|�AE �Mv��AE�,aW´AF�b�K#AG������AH��k2Z�        ?u�FL~?����(w�?����S?�S�jV�?���A6�?�$�f̓�@]B�yh@b]�@�1�u@��{�@!7bbN�:@%uf��M2@*At3��@/�NM-W@2ʁ �RW@6o�<��@9���Em�@=���#��@@�ڿݶI@C4$�IN�@E�Gq�]j@HH�*@K&��#t@N��rH�@P�����$@RF����@T�!K*t@U�`X�)@W�W9@ZBu��B@\GQLG�@^�A1)��@`��Z"��@a��^���@cd�!Ѿ�@d���z�@f���u�@h/�:��@i�={c�z@k��%���@m�(�a�*@oǝIK�;@p� R�@r~��@s77����@tk��k@u��7�@v�}!�+�@xP.�
@y�	�Y\�@{%�b�|i@|�c��9@~*��U�@�����~@��;G-��@��|��7J@�b`4@�@�FK -�q@�1�0d�@�$��j��@����F�@�#0$�O@�/X���        ?Q_ɵ��?�8~�v$�?�{���T?��uf�?�V�	x�?��v9Ԫ@���J�@w:� �@'����@4
��E@@7MD��K@IF{Z���@SpW���@[�͚�O/@c��=U@kÈ��(@r�fj���@ys��af�@���Y��)@��×m%@��x���z@��rK�}�@�#+3G��@�b���@��p�^�I@�TM �@�m㧿ג@������@�4� 7@�.+�v�@������/@�0��j[�@�A\`�A�@��I���M@�I�IN� @���/��@�Ȟ�) 	@��%s�y!@�<B�O@����-@ӳ���oC@ծ���t@��]��@��.z��@�J`��@޶
@iм@���wd�!@���P��@�P���ˠ@�	�Z�@�;��ZK�@��mv��@�_���D�@���D�e@��/ @~X��@�*~����@��m�ڸ@�;�+�@�R	�)�@���g�@������@�)Dժ�z        ?v��Z#1?��Dz���?�Aei��!?�����4�?�;��3��@�2#��;@�A�f@$����u�@/eJ'��@7:�@@p�>Z@@F�Lzy�C@Nͪ��5@TZ��5�@ZU>�$�@`��)��m@d��:ܥ|@i���2�@nϊ�ˢ@r`x6p�@u���z+@yXa�j�@}cYPA|�@��V���?@�`���E@�v��"@�
@i��@�Js�V��@�ٝ�U��@�ޢotHI@��zlt�@�L�)�e@��?`g�<@������{@�q�b�&u@��;�"H@��8���@�S5֩w[@�G���-@�^���@���R���@����̀@��L� l@�h.�m@�����%�@�����@������@�N�F[��@����@�����@���g,@��W{O��@��T-xS�@�����@��!��N@��Z�~@�h�m�*�@��o�w�@�'���@ɛ2~�˄@�YKp@̭�H��@�L/�?3        @ �`���@W��n�@y&�zO+@�^4 ��8@�Aj���$@�ml9�m�@���k_M�@�����8B@�%���{@�g��t�@��K��Uh@�����@���t�PY@���66A@�O�mz=@��@#G�H@�k7�r��@�ZI�I�@�Ϩ�-�@���w\$@��-�s2x@�>޲hG�@�(���e@�\Q�OA ��h�(AM�}YIA�.�D�A���AA��ZA
p���A4��$s�A��0p�A}�n��A�ou�w�A&��3�A�ӡCA�g��A���/��ASJL5AX/^^�A��?�A���\S�A Y)���A!]�q[�JA"l�y1�A#�3�R A$���YA%�i��A'�
8�A(O�j� �A)�'��RA*����dA,I�2��A-���RP(A/y�AjAA0G���0A129�X}A1�\u�y(A2�{�3��A3^�Y5�A42:��DA5��gz�A5�D����        ?��;=|��?�w��؎@ze�@yCH3�@"�t1���@-{����k@5Uy7�f@=s�{�@B�qsBU�@G�Xɠ6D@M ����@Q_?��t-@Tu�/��"@W�{��Ͳ@[H���ς@_9c���@a~<�R+�@c�ײ*�B@e�� ��@h�c݁@j�*Z��@m7�;�@o�JH�!@qA��u
�@r�C�N�@t8T�� (@u�[��$@wn��{^�@y"�%�(@z�@����@|�~yr	�@~�N���T@�M�B��3@�S[;5�@�b���]�@�{�g�.@��ZG,V@�̀mȜ�@�Ba_�@�F[(��@������@��<R��A@�I���%�@������X@�&��>@�QU)D@���?�@�����e@��B8� @�ki i��@�94B� �@�	��)�@��AI�0�@��Y��̕@����B�@�b�Sws�@�>�x�w�@�7~D�@�����$�@������@���6��@��g�j@���B�        ?��4�&?ã=���&?�er��t\?��P�]�d@�0�0 G@8���+@��i���@%��3�5�@/��Q��@5�(}"*@=F�+@C��ɛ @I�!�FB>@P�WF>B[@Uu��@[* �5x�@`������@d���a��@i�ۨ��8@ofZ��\@r�J� -;@v��߅@y� ��U@~V��KG`@��N>tys@�ZZ�Bp@�b�{�F@��O>�@�o��0@�@:�U9,@�{Y����@������@��@��W�@�z17Ϭ@���4<k@��W�3E@�֭\�4@�ϭ��l�@��<�CP7@�4\ h@���?W�
@�<2y���@����-�@����e-�@�����5@�6�Ѡ�e@��8{���@�ס�_ @�ϱR�@��!^��F@����l@���ڐ�@��N�hi@�*v�E=�@��%�dX@��J��m@�^m�	��@��)�T@ʇn��@�:?�	�@����@����@��I���        ?֗q�2�2@
�^�M@ ~2S'� @0���Ʀ�@:���K�@Cc�J(�@J	�+[WL@P��o%�@T���[�@Y��Ҧ��@^��/�"�@bimX�@er�@hvw����@l*��\5�@p&	5cG2@rv=<[$@u3�o �@w�����@{C�8_��@~�
���@��Э��@���V�=@��zm�@�n!lC��@����	�F@�+�»�|@�2���n�@�q�̆�@��,�Ju@���ب)�@��/��D@��Ҋ�d-@��Q{�P@������@���z/j4@��]�+i@�h��) @���u�a@���)H�&@�Z�XD�^@��9���@����L�"@�Yt@�@�7���+�@�2���@�L����@��0p%��@�p�(�g@���KHk@���`��a@�aԠ���@��ᚩ�J@�\?B�)!@��=1G�@ʡ-�"�@�`e��w�@�37�X�)@��Q��F@�
j����@��9P@�$�bp@�@gqC�        @v�ҕ���@�g�N���@��8!��@ռ�$Kx @��A&�g�@�Gy/��@��&�@��H�e�A �J��9�A���l A��Ap	�A?��آA��4��Ax$^QҌA�I�h�A�u�~�A��0�
�A�&|1�A �Ά��eA"�tB@k%A$D��ǩ�A&"��A'ѵ|>|�A)�
�4A+�LqΘA-��W���A/��3�A0��<�?A1���t	A3ZW�]�A4;<���wA5p~��A6���N�DA7�X�|��A9Y�X�xA:�y��JA<4R��A=�%��aSA?B��F@�A@n�n�_�AABh�ZטAB.�7J�AB�՟�WAC��=e.AD�����AE����AF�<f>_AG�"��}AH�/��;AI���a�AJ�(��*AKv�ߘ�ALl�b�|fAMc���5�AN[;;%(JAOS���+wAP&�-*&�AP�L`�8AQ"�Xy�AQ��	�pAR$*-s��AR�;���NAS,@��Ϩ        ?����B��?�BO���i?�M�s2�d@:���@(s$��S@(�MBL@1���5-�@8��dƆ�@@Qڙ��t@D��sY��@I��z�o@O�IC��_@R�7�	*@VG���۵@Z�^�g@^���B2@aC�AU�S@c�����@f3q��@h��XMW@k΅����@n�%�2�]@qq���@r�|���@to\����@vB��� �@x+2I��@z)��E$!@|?p��*@~l%\��=@�X::�5@��ZYt @����E@�%t���@�Z*'	@��܋�p�@�&j8��9@���K�m@�&g�j�)@���Z=0}@�Y�=?�@�����@��<񤴠@�������@��P�L�@��ENx{�@���]��)@��F�)�@��DS�>@��z�H�f@��ц��@��-�F��@��uE�9Y@���K�@�[Y�a@�B�<���@�s����@�T�G��@����@��7��v@�6g��o@��`� �;@��:��j�        ?��ڒ)t?��
�?�����tE?���	TOJ@�����@K7���W@�]g�@&OY���@/J-���H@5s�x^��@<���D��@C89XI�@I<�Ā�@Pa����@U�d���@Z�~)�~@`����@d�^��@i�Q?��@o?ֵ��@r��+��W@vO`ګ@z\6�d�@~�F]9��@��b�o@��:s��@���d��@�9|�(
@��Ɣb o@�m�H�FV@���H@��G��d�@�M6��g@��"�9��@��z�@�S��t>@��Ρ��@���ar��@�R��E@�0L���@�'�u0P@�;���@�lc�h.,@����8�T@���@�ZH_��g@��h�t�@����@��M�U+�@��\M��@��3^թ@�n�S<7@�4�3^�@����@�Ҁ�G;@��j�$j@���jq@î��	�@���3e:@�98KS@�M���<v@Ȟ*��2w@��;w�M�        ?���
��?��(O�:?���4�?�vBW&*@ ��C].�@����@�^���@@!2
N�@)>W6��@2���$B@9��Δ��@A��sOj�@H#G��m@P.#C��@UU����@[�i"�o@a�?�c��@f;���ؼ@k�����@pߊ�4�@teMw?�@x_�D1��@|�et8R@��P�)��@����Y��@��P��4�@���q8�@�����	%@��k�
�@���R���@�NM' ��@�ݱ��d@����Y��@������@�n�b凈@�+S�w��@�n��`@�z�M:H@�)�gfs�@�q3X��@��˂Ɋ$@�t0��p�@�k`lT�@��~���@����k&@�����gf@�r��M�@�B��}�A@�+h׷�2@�,�\Q@�G���|a@���==@��\#���@�ݍ�@�[��[�@ū�w
@��Հ
@�r��e��@��;b��0@�r��vG@�o��u@Ϋ���8@�/����        @bH2���@���n�&[@�b�LN@Ś�%�uV@�S��AB@�@�' �;@�Ǎy��A@퟾ROM@�U{V�@�vqMF�E@�6;�1AL�z��A��I��yA	��؝��A����.&AD4��A�d.�u�Au}SA�nA[�u!<Aw�9�pA�GOO|A!�7��BA#��!Y.4A%��yL A'�V���.A)І%�A,�n�?�A.�1���A0����|A1�����A3-ˁ�a`A4�Ӂ� aA6O>[~�A7�_Sg��A9#%�fbOA:��R�vA<pM0gA>+Ѳ���A?�CNc�A@�D���AA��s��AB�%����AC�n���AD��"��AE�F�kx�AF�9��AHϺ�
AIA86^EAJn�)H!AK�/�r�AL��2�AN(fd-8pAOwCd��]APg[v�AQb�?�AQ˲����AR�> �AS@����AT����AT�OB%J�AU��f���AV[��xSAW+D��SA        ?��'7o��?˄�*��
?ꇻ}�z@ /3�0��@�47�\+@q���@#
 dE�8@*�/��]�@1�Ӽ;@6��8ն@<��j*�@A�Њ��b@E:z��I�@I+�Z�g@Ms{�c�#@Q8���I@S�/N�*@V$����@X�t����@[��R�*@_-�k�$@a<Ia�@cwZ#��@d净�n@f㓢p�@h�"����@k9�
�v@m���cV@p�T�@q_nz�B@rȃ3}�@tH��@u᎞m�A@w�,[3�@y^��Rـ@{E��@}I ��}�@j@DX�@��.R�8:@�N~���@�F
s�:&@����l@��9nB]@�pc��0@����^@������@�<��g��@���XD�@���Br	@��4�%x@���R��@��"�QX�@��9���@�C��@�#��n�@�P�>=�@��fn㙚@�Ɵ��ц@��p��@�e{�h��@�Ć��o@�.;_���@�Q_z��K        ?�w�f@?��0�EǴ@mU�
 �@0�sڧ�k@As���	�@N��f�U@W�5iBsN@aN�H��:@g�Ls}
+@o��@tN�sQ��@y���͒�@�I�씇@���Ze��@�����u�@���8o�@��	]��h@���~�$�@�G�{�z@��n�5x�@����V�@���;�@��QƦ@�l!\:\�@������@� dUv��@�ETtp@�74@� ,zӬE@��'�c�@��B�@�3SR�@��`?��@�*�C��T@�x��{d@��jc��@Î��XW�@�D�q��@�scul�@�'j�@�@����`@�P��[]�@ϥ!��T@�"��@�[B��B@ӺI ��l@�,�B4@ֱ;9@�I����@����i�C@۸c��BW@ݏr��_�@�|fc���@�����@��aU�@@��bgW�@�f,4/�@�=u�(��@�|�&�v+@��9K��O@�%�b�+o@ꐜY\&@�
��>��        ?f�ټ�y?�Q��U��?�
�n2�W?�yA�u�?��O����@E`g  �@d Pq��@X����@)'G�\�@4ib���@?�#�_$@Hz�lmW@Qo��t@X|�.�@`�J�� @f)c1.V@l�Cuqm@r@���@v�-�>��@{�y��@��|L,Q@�*=��o�@��
��8g@��X �r_@�jn�P@�cc�u@��?�zZ@��4�O??@�r�Q��@�zɽ�"#@�X�%�D�@�̹�
@��J"���@���$�@���'ɦ$@��e�E�@����s@�~TO��@��/�'j
@�����c@�:�D�jl@���򮬬@�G��&��@��_�t�@���Q��@��]�Ř@�w��(Ѕ@����/�,@�ծ���@���ڇ�@�)��_�@�i�įӟ@ź*�@�;�c@Ȍ�c�l@�s��@ˣ~�yZ@�H���nH@����$ʀ@�d;1}@_@�Q#��h@�F��<F{@�D���l�        @Cs�����@���$p�@�w
�t��@��6-`@��D�@�ћ��y@���E���@�lq�
��@�^v��@�2��)Jn@�=��� l@���}*{Ao����A�:q���A	7�0"��A�{��wAo�f�A�2��A��a)�A�k��A8�-��0A�C�^TwA��$�HA Y!\��A!� �46A#��q�A${����A%�LH���A'�D@9�A)-Y'Y\A*ǯ�I3A,�X&�"A.c��I?�A0*���~A1/��䓠A2A`7��A3_���MA4��6N�A5�c�͢A7
�cf��A8^~�?6�A9�W�t;�A;0r��aA<�#�A><eG�nA?؄E7��A@��*/l�AA�s��M�AB�[ ���ACm6(w�nAD^�ʈ4�AEV��r��AFU6$AGY��>�xAHdr�H��AIu�a�*AJ�gF�MAK�-f�c�AL�D����AM�ͩ���AO/݂o�AP' ��d�AP��!�X        ?�Y��@^-?�a�~v�?�[ˣj��@C�!7@�r��@ 6�ҥ�@!Im,\]�@'x�]�t+@.�v�A�@38���n@7����32@<k��^�@@ב�xY@C��"X�@F�տ��~@J7`�#B?@M�Z@P�B{��@S#��F�[@U�Լ�@X���@ZΌ�D�@]�yΡ��@`n&�1_a@bj6W�@cԚQ��\@e��_Sb@g���Ρ@@i�;�G@k��*@n�3ga�@p,T�Im@qe��k�@r��6�@tC��@uh5$��@v��XY@xa�Z?�L@y���?��@{�US�U@}YظNn[@(���@��j��=U@��j^ �%@��a�_�`@����J(V@��f1��@���yǓ@�$�5��@�XU�@���Ǌ��@���=6@�d�xRj_@�֫�6�@�U���@�p��ZS@�="n�"@�B^	E@��`�)�@�ʃ3�1�@���� �@�����[@���܇�        ?W�b�.R?�m�N(q�?��aM�o�?Ѕ����r?����;?��QPT0@'�؃�]@o\K%{@WL����@'W�\t%@2m�=�:@;�ث���@D�v��1}@M>zu�"@TAp��X�@[d�oj�@b!�rb�#@g�,�ć�@nܻ�j@r�P�=%J@wv�9�4�@|��c8��@�g�s�6�@��Xɐ @��}Ǚ�@���u�@����l��@������@���j��@��W4�J@�Q����@��0A�@����hM@�۷�4�@�C�ƒ�@�ڜ���/@���i�0�@��1 [� @�g���R@��0c
(@��H/`Lr@��Nn��@��f��$�@�.t��x@�[0��@����p]M@�'mʴ!p@�|���-�@���⎣�@�Y���{�@���S��@�| ��Z@�(`c;@��B�US�@͹Fʙ��@Ϟ�^�Q2@��`����@�Ӡ��
"@��z�ni,@�2���x@�*
��@�]L�)@ל;��s]        ?�#[�R?��(�e�@��9tA�@���y��@!z �ݿ�@+��PY�@4j�i��@<�=���@CyVF&@I�����@P߄f)�@U��:�Li@[�[�|u�@a^�x�#�@e�>Υ6Q@j����v@p]uL!h/@s���~@w�w��@|�Ӵ�@�	ߋ\��@��|��@���;i�@�}Mn��@��M^�,�@�X��5�n@��n��@��J\��@�4dSw5\@����s�@�G���6@�Z���@��BJ�}'@��FSWq@��+��5@�F5'ɲ@��	�A@�����l@�G|��C�@�����@�ـIK@�ȾP��@��,?���@��K�o�K@�5�x��@��S�F*h@��#��@�M�)�@Ħ��c�@���Ը@Ǆ�O�c�@�
�D�%�@ʠ@�K@�E��s!@��}�lx�@��u��>@���i�`�@ѿkA~�m@һ7���o@ӿX�ޖH@���J��@�࡛P�O@���2(��        @J9�s��<@�;�ޗ׌@�0ɁgU�@�b�A[-�@�����/@ť��JZ�@���أC@�޿�K�@�����@�����v�@�̋�X�@�W��\@��(od�@�Y:uyK�@��*�>@�~�ɥv@�<�u>�@��	���?A ��;� .A���<��A�Fj���A��W��A	V���2A�2� 
�Ao�+D\�A����hA�ԓ�A����A.�-�yA�x!#YAi�F�A-d� 41A���A�f�%v�A��*
��A �k
S�A"�i��;A#((P�A$M��y�,A%~tIJ0A&�ۥ�F�A( kDn�A)RR�άA*��`C�A,��C)'A-�J�[�A/��u��A0L�nC�A1��ȋ�A1�F�	�XA2��V�MA3��Ս �A4���ؽ�A5j�n���A6Y!H1QA7M�ؼƈA8H>��"A9H�v�A:O��	fA;\��x|�A<p���A=���i�[A>�U���        ?���MgI�?����4?�_�v��?������@=�}4@�CAB @$i #�@������@"T��w#@'q�����@-?9���@1�w�w��@5}�h��j@9���,��@>jZ��@A����L@D_�`�D@G�ո�@J�B����@N�V�@�*@QIw0�H@SoJƔ�@U�+eE�@X?hZ��@Z���@]��Z.D@`s6��@b�`.ہ@c�)�Gs@e��Z/	�@g����Kd@i�q�[6@k�s��Y�@m��G�@p �v�9�@qW��@r�oz�@s���@uPǼJy�@v�����@xC�u��@y��3߷�@{xX�@}-B%�i\@~��x��@�g�%.o�@�^���}@�_̸A
�@�j|@��m@��ve�@��h����@����;�@��7"%�@�4��/*�@�{��6=�@���T��@�(�d,�0@��(��@� ��s6@���Ԍ��@����|@�O�@M�@�!,d�t        ?p͜�mf?�ˌ�I?�"�o��%?�)���n@�瑃��@o|F��@'�Xq�@5�$ �S@B�UŒb@Nׅqb��@W�|\�_�@a�Ǩ��@ip}��@q��%��x@w�ҿ1�-@~��v��@�ϟ�2,@���~J�@��k!J�@��S�xd�@����!]q@��"7�@��;�E@�]����@�64�g��@�P���+8@���	*@�@�Ul��܆@���|�<@��~���*@��9h��@�lj�{�"@��ʈp��@�����.9@�Q����	@����@�w
�I*�@�(�a[�@�� o�(@�Ʀ_s�@ʱ�k�� @̮su�M�@ν7�O@�o$�(�@шҰ���@Ҭ8��@�ٻ�F�}@��G��@�UY�?�w@פ�����@� a�:�@�i(�H.V@�ߐ���@�d.uh%H@���vܾI@�M-e��P@�&�pg�K@�)��N@����y�@�����&Y@����8:@�勬:�@���        ?{���OA�?���` ��?Ѻ�����?��yς�?��˥@]��=�@o����@!����@,z����@5�Cb���@@z���@H�0��@Q& �0V@W�
���|@`@`D��@e�d:#�@lZ�w	�u@r9!B6��@wP ��'@|¤����@����%�@��~XVy@�,�Er�@�!-Ǳ��@�x����@��u�fX�@�|E���@���M��k@�.h��1@�̔�PST@�����'@�%,=@�|��w�@��H#M�@�զ�l�@�*ϖ��@��4���@�t_��j@�m���E�@�Q�t���@���5Y�@�蒱g<@���'j(`@�.��D@�W��rN@�����P@�j��@��6/�~@Җ���@�*�~�f�@��k�	��@ך��4;?@�wH"v+Z@�ma(^�@�|͡�@ߤ���eW@��lgq)�@�!�re@�\��j�@���YY=@��S����@�]X�'@��L�R�        @7p>|�G�@h��A
eG@�o")h �@��J�r�@����WK�@�����#�@�d�'@ȹ_�w�T@�΢o:!�@�ڟȺ�@�\����@�ѱ�"@� ݱ)��@�ě�$�@����
�@�9o/�@�t�<�
�@�%_�\a<@�)P���A@.�*�A����wJA-Jw��A�z�2$iA�uҖ��A��K̾wA����A�	{�A���8>�A��F[�ZA�D��O�A��$ѰA]/a�yA���_fA!A�%�1�A"���_�:A$���$�A%�ꂽQA'.�-3��A(Ҝ��
A*��XA,LV�0��A.#1\�5A0Bd�uA1��lA2�;f�A3%�u;RA4L��ʷA5�r.]�A6�gP>�vA8*���[HA9�ˊ��dA; �\1r<A<�ѝ��A>dꈣy�A@��m�A@����`AA� _�AB�z"k�AC�:��_AD�A�R�WAF��Q�AG3'��=5AH\�M�D�        ?�S�E��?�1�X4%?����*��@�VgP�Z@�)+.�@�M�,�@#��I�:t@*��^C�@1չ�g`@6��W���@<vgI�2@Ac�i2�@D�A͐E�@H�6G N�@L��I��@Pą7�G3@S@}I��@U��Nt��@X����b@[�)mW�c@_F�X�a�@ak����@cR�Xip�@eY�ҩ��@g��2�j@i��{!h@l9K� �@n�f��	@p�~���@r0nv@s��`kDC@uI!�14@v�[@x��x�(@z�g�2��@|q�_��@~s@�0s5@�E�k���@�^%�&�~@��X�`w�@���A���@����B�@�6���_@���E�i�@��^ �k�@�U�z��|@���5��@�O��>�@����:@�<�`��0@��%2��@��/�O�@���(��@��fq�n?@���zA@��g1�\�@����� @��t��@����&�<@������@��1b���@���:oJ�@�¹��        ?�BQ.w�m?�Qx�0�@l
rB@P�0u�|@,-�;��J@9/��@5@D�5�4A@PA�����@X��N�@b9�d�@jZoH��@r�O����@y�[���>@��@�ע@���/��H@��_��.#@�����&�@��'3S<>@�O�v[�@�"�q @���_<�@����@�8��W.�@�⚀OC}@��Mh]_@��^z�9�@�5V��l�@�RTc-��@��s��̏@��q�qx�@И��+r�@�a��{�@��c����@��}���@�"m�H�k@���w-�
@�䐊�S@�%d�U@�o�*��@���8��6@������@���RO@����5�@򥈶���@�u2���6@�b}�؍7@�n(��ާ@���߅E@��QBǜ�@�M��A �a<��fABD���A�ۙ���A u�_�A�j��"AD��]�A	�ޜ/�A����A����5Af���e�A�QH���A��݃T8A�Iq"��        ?�����?��Iy�b@ ����@xv꙰�@%�~�@1�e�[�@;��/�@C���#w�@K0����@Ry$a�@X���k)@`H�vkX@e?ѽp�@kp��ǀ@q�Z�Qm�@v/֡u	�@{�0X���@�<>��@�-�or�g@�����@�)	G��@�����K�@�8P1A�@�B'^(�D@��u�n��@���'W��@��M�/Ϙ@�ێ���@����*|�@���j��@��ߓ�j�@�:Y�#�@�÷��k�@�����Y@�yi���@���Ϧ6�@���'��@�_(���9@�S{�uju@�h_>�6@ɞ��{�@���z�@�p�
�E@І�қ�L@��g��r@�VS��\@��K��	@�h��x��@�	����@ٺ݄��@@�{d8�;@�KQ��_�@�*��&�@���]!0@዆K���@�jN;@�?���O@�����,@��E�a@�����@�$w�8Z`@�Xc�f�@�ޤh-�        @`�+@��'@�.A�@7@�l��L��@�ͯ�~@��辟�K@��S�:&�@�B�u$>@�r$V��@�����A�����(A�7��qA��׭/Am����A*`:��A1E6A1�#�A�{��A  �3���A!�Ǵ��A#����HA%�>g�A(+�Co�jA*��h���A-qޭ�^A/�5����A1G�J�'�A2ȶ�KkA4`�pd�SA6$�:=A7הZ�xA9��'0�A;���\�A=è��[A?����AA�r��ABQ����AC�����AD�%���AFK���	�AG���eAIE����.AJ�}"H��AL��m9�AN?����GAP�
 �AP�x(��yAQ�)?R#AR�A�5�<AS���,dAU%�%�{AV0!�W�AWX߽���AX�c�C��AYǤRzA[���
?A\]��+A]����A_��TA`A�(3�A`���	�Aa�,�^�Ab|�T��2AcC|�s��        ?��ۂYM�?Ĕ
O���?�e����f?��B��s@2&�=O@aV�Q@�L�i@!M^7���@&�tϾ��@-o#Ys�B@2n���@6�Ga'�@;[��Gں@@Q�ӑ�l@C?�}��8@FzeL.@J ���/@M҈�Z*@P��-IM�@S$�	�PX@Ut%���@W��o��)@Zp\�w�u@]@��>@_�T"RL@ag��wdy@b��҄FR@d�_�l~�@f%���|@g�j�j�@i��93s@ky�,���@mb뙦��@o^KA q�@p�K��{@q�O�F8@r���iY@tʞ��@u3��_L@vjե�!@w���=tC@x�U��4#@zJ�� �V@{���tV@}���@~�&�sW@�0E��@��g�D�@����5@�V|nb��@�'�ٳ�R@��ŰF�B@���PF�8@��N��@���ȿ��@�����u@�{�$]>~@�s��Q�@�s8
��@�y�Cxv
@��&"S�@��ZߥP@��~��(�        ?m��̨�'?��H����?�>�����?�bQ�R�?�F!sM��?��q��D@�D�[�@WM��-E@���H �@&j�A�@0k0>��@7\��_�@@@n���@F)��M�F@M�7I95@S��oh4�@Yr���@`RxĎ�h@d��p��@i��H�F�@p��TQ@s��`�	@w�秈@|��
�W�@�"����Y@�@xs R
@���^�V@�����N@����E]@�M���� @��.�e�9@����e��@���Lҁ�@��
��@���+��@��z��@�v7�Ђw@��n���@����y<@� �h�I@�i/��@��1�[��@�G����@��<4���@���{BJ@���μ)@�ٛoj%@��wlĽ@�^&K��@�4&�Vw@��Bd��@��ם5h@��^� ȷ@��fׄ�'@��l�W̗@���F@����I�7@�W��O@�K��o�@Ȅwα�^@�ȑ��U@��1��Y@�t��OY8        ?`���/��?�g�'eO?�TG��?��;3`V�?���B�?�??�`�?�	�@g��@�����@�$�D�	@�ZJI�@(^�Ek�@2�o�u�@;�e���@C�	qB@KX�A6�H@R}&���@Xg��!C@_�IA�u@c��Ԋ@h��O�nI@n{V�a�@rn��E��@vZx��K@z
���TN@~�YĳT@��g�f&�@�uG�2��@�vu��,4@��s���@�`��~�l@�*r��}@�S �y@���[֪�@�=#V��u@�A��f@�	U�U�#@��Z�E@�iM;���@�OQ,��@�Y)pj @����@��4��ޛ@�`:Ѥ�@�B�@�oɾ�l�@��QP@�������@�9�`��@��(�M�@�䭨�w@��B���@��튛�,@����@�8q�u@�kO|��<@ë���!�@����"@�T�ޚ˨@ǽ�ц�8@�3�_��@ʷ�˘�@�G����@��Z�YS        @0��)0�@hC0��X@��<M@��2a@��|���)@��� �'@�|pѴ
�@ÁJ�'�@ɝ$6S�@�L����@�@̣U��@د�y~��@ݟ��[#@ኵ���@䉈൪�@�̖�Ԋ@�R���@�6��+�@�����@����S@�����׃@�IAz8D@���Z@P@�S)�1�A ���?Af�Y�"�A�+���AA[As0�EA���X-A����LA	,��i�PA
�r�q�A��s@�BAl�D{3A#���yA��yaA���A��4AGF��0A%�J���A;)''��AX~w貜A}��щA����mmA���prA ����Ah:�p��A��#DLA 	`HB�A � �;A!qh0{�A",�X�0A"컄��A#���6��A${t�;K�A%J-�V°A&��L�A&���'�^A'�o��A(�l�SUMA)� t��A*�%Z7>A+��=�        ?�S8�͝?ˈ�̼��?�.��J@ m��,3@� �2@0{�'��@!�N!$��@(l*gvpy@0h�c@4b��@Ԁ@9.$���@>lO�~,@B�'�,@E4���h@H\��&�@K�:8���@O|�C�Y�@Q�$�I�@S�'��G@U�Ӫw�@X��\�S@ZP�^R@\��p.��@_-hǪ�9@`��4�i�@b2M�oO�@c�qU
�]@d�/ `�@flq �2�@g�@��_@ir�����@k���k@l�GK.M@nMTcZ��@p �SҨ�@p߅�L.�@qÎ���<@r������@s�d��W�@t�;�$��@u�3f��@v�#BcU�@w�c��@x�� �+@y�3vum<@z�V�#�w@{����!@|��RL,@~�7>@:}�
�@�7��&R�@�ՠ�#�W@�w��"@��U�M@�ġ�ɑ@�p�0�/>@� ��e@���ƥ�A@��ׄ`CC@�E�d��|@��H�@���u��@����b�        ?�v��g�?�I�t,�?�m��o�2@�:���@w:��q@!�y��I@*��[X�@2׬&���@9�.l�m�@A� �@FDK:xGw@L�)*�x@R�-eOx@V��wĪ�@\;���'@ah`1XV6@eJ=ܗ��@i�r[L�@oh��@r�`��@u��{D%@y�M��v@~(�O�h�@�|��Yt�@�'_�9@�g̠@@�P/t��@����4�@�ԕX��@������@�&�"��@��],@��@�,���7R@��e{��W@��9`��@��b�}@�ER�/�@��=GH�@��Ng���@�����@�+0�W��@�n���	�@��	>��@�*��\�@�|L���<@�޽� @�R"�I�o@���}%ӱ@�m]�P"@��"@g@��DX#�K@����� @�z�?҅A@��gFG�@���p-`@����_Ӂ@��mͳC@���m���@�"�@g�@�U\P���@ȑ��z1@��y{z�@�)dҏ�        ?���0�?�,��U�G?�)3��/?�����@
z&�o�J@����4�@!�s�uJ@*�=׎�]@3T��a�@;HZ
ꆬ@B�^KQ{@I�kZ�c�@QHqw�"n@V�9�`��@]�K4�\�@cF���@h��h�<@n㽡˚�@s5
��6@w��L��@|��_8A@�P+)���@����@�s
��@���T@���vz@�YT-��@�@�m��@�r+�;@��)M��y@�`�g"�@�s:&��@���s��&@�)�	��@������@�����@����>��@�W�=���@�ƾf�@��!4�@���ߟ�(@�������@������@��:�E/@�wU�h@�����	�@�����@�����_@�U4��Q�@ţ����@��q��XN@�^�ߪ�@��%�x�j@�G^Za'�@����~@�aF[�@8@��I��@�؏��
�@ѷb�؍Z@ҝ՟�*�@ӌ-$�.C@Ԃ�\E�D@Ձ����$        @Hmk���@����D�A@���nV@�*��/�@��T��0j@�h�9��|@ԲT+��@�R�ȡ�E@����q@�eCA`c@���m��@�OP^_�8@�wA�=�!@�؄��:@�qpK�@�@r�یCA���A�[���A�{�՛>A=�'XA
���pTA�R�VA�u�No�A%�BNp�A��Y>�A��O���AH�ȵ'A����A(�SPs�A��K�7�A�Ŋ��A�d�/A&c����A��n�A �:��,�A!m��0�A"<�����A#��W
�A#���!�*A$�b?L��A%�j��A&w�����A'[/��A(B#�&F%A)-��A*�A+P��FA,���A-x��WA.��'<�A/
j���A0
��-�mA0�\]�;�A1����A1�{�L��A28�s���A2��XZ�cA3_��
�A3��p���A4��^K�A5-x�A5�6�kA6mNݠ~        ?�ʥ�Ve�?�Qc� �<?����?��oIK[@�y#��@���h5E@!v~H��@!��b�@'o�DP�@-�����@2f�&/@6Q��N@:��!�T:@?Ud�.�u@B8�z�@D�@׹�R@G��P|>�@K'eh�p�@N��W�j@Q�v%��@S}b�r�@U
	C�R@WK�?B�@Y��,@\	蕣�@^��:d+@`�!V�@b����@c���,@e�K2Ԏ@f�+	��}@hs���@j;��$ѿ@lMۆ�c@n	O�@p&��.G@qEq��m@r,,��cq@sO4�W@t}��V�@u�tJ(�@v����@xS��Z�@y��rm�<@{%��"@|�-�1'�@~-g���|@��nMrx@���r��@������@�v���@�`�Oa? @�S��A�@�Nk&�_�@�Qn)�@@�\��B�@�p�<䀪@����O|�@���yF7L@������@��I\|�@�^L^Mq�@���l�pV        ?��2�w�?х��\?�n��@��'l@M��nF@��MbI@"ӯ���@*5	e �@1��`���@7|f8�@>��xE��@D��[�@I��N�X@P�k8|O@U Y[%l�@Z�M$0
@`�L�w��@d��uR@i��G:�@o�
��0�@s-vD�@w�d�A@{�Q��@�kE�nJ_@�_���@�����@�=\e�@���w��@��f�u@@�`
/(�C@�N'��)G@��7�-@��]|�l@��ur@�/��e�G@�����"@�I�+��@��x}E�S@����a&@��^�	�@�b�\�|@�H�o/�8@�R�We�@��(-Ό]@��
�UO�@�O���@��ʞc�@�^m%:�;@�������@�h��=s�@����&�@�ʠF%�@ɝa�Y3=@ˇ)N��@͈E�@Ϡ���2@��U�5u@� �O�@�=[.k�*@�y���"�@�Hћb@��)��@�x�m`��        ?��P�P�?�|�'�"?�S�ح�@e���@Zp/�@!�#�|�@(�7�|@12��V0@6�)$�d!@=�7G��[@C�.�g�@H����@N,�-h*�@R��ʅô@W=)m�6�@\�O"�8P@al140E@e�7E�@im�O]��@ni��ߋ@r\p�Q.@uU.:P�,@y	.Yv�@}6�gM?X@��g�Nz@��oȽt@�}+��A�@��i#˥w@�M�ܧ�@��CNU`@���:H@�*IIQӗ@��^<� #@���ٓI@���G_�U@��d����@�U�i�@�M���*�@�o;�g;@��"9� @�7:1��;@�����@�a�c'�@��_��*9@���a��@�Tq���@�5+��4�@�4��A&@�S�����@���Ta@��	�#@�=�:�@9���@��@�>�@�s�B�!�@��K��@ȣ��2�9@�[���@�'vhK��@�	�k�~�@� �%�Te@�W��(@�|{��        @I=ǧ �'@|���|+@�p�-2�@����RY�@��kF�@�C`�ll@΄��6��@Ԋ����@�mp��O�@�p�'�@��T����@���Y@�3W�6P@��.�:J"@�-�/ @�|�9�@�����@��~z��@�6�!"�@������A ���A|�D��A>��PA�i�ـAoo̥+�A	7����4AV���A��<-A�9K!A��8��A�����A�c&f�A�\��a/A�����A.��̴Ao���	A��H.��A04B��Avqc�}VA�@��AhyHI�A���%��A �ٵ��LA!�S��A"��b��hA#qi~`�1A$g9�shA%h��>A&tJ�}��A'��,VuA(�9���{A)���A+!T��]A,l���}A-Ÿ��J�A/,1���UA0P����A1�Z=�A1؀{�v�A2�D3pA3|w6��A4X�7��[A5<��	�        ?�=�,p&?�.�T_�?㪙P��?�A���Y@7Œ�J�@����@��n+h@ W>1�YK@%����/@+�0�9l�@1]�6�@5M�J��@9��u�'@>���0�n@B�7´�@E 0�.M�@Hvp('��@L����G@P	���|@R-�>Lh�@T}��U@V���o�@Y�����@\uF���@_{0MRyM@aY�ܿ�M@c�j/3�@d��5�L@fӖtq�*@h��Oo@k����@m\ �Y@o�ԶG�j@q,��6�@r���:W�@s�w+٩@ul�1O!@v� ��n@x�V��@zS��%�"@|�WÊ�@}�N����@�n �:@���, �@��B�)�@�"nT�R�@�G��|G&@�x�/"�@���Ռ��@��;��O@�UH�(�J@��<��@�(B�d9@��jŃ@�/�7u_�@�c��� @�5Ȣ/3@��r�}@��.3���@�Ԋ�Ҟ�@���t�x@���Q!�@��׈���        ?~a�����?��R��O?�w=�"j?�������@)���@�ЏU��@�bK�O@)��Ģ`@4��i�y�@@_��>@H�ƹu)j@RrΤZA@Y�=J]BH@a�y�8��@gc��'� @nW~�	��@s6r^���@w�g��J�@|��;�4�@�S#��@�o����@��s �r�@�v��+ @�g��#�D@�Ԕ��@� `-��@��F!??#@�I�V^lD@�/萧J�@�Si�	@�[��SG@�1�W<�Z@�,�ɀU�@�O��9$@��"����@�wv:v�@���*��C@�����$�@�O���QN@��e@��6@��>',��@�~"U  @�q!��@��Z
w��@����כ@�,Y,�@�;���"@L:�C}@��0�Db�@�VK��-@��W�9�@�u��%C@�#�(���@���r�s@��ǖu�o@ϵ���v@��;a�(@��e���@�p>��?@�3�0��@�g���X@֨E��@��H�M�        ?�O��~x?ď�>Å(?�G�m;Dk?�h���@	aE�s�h@���?@"���l��@-�̮uz@70Ȼ�5@A��S��@I��=�@Rb���*�@Y����z�@aH�}��@f˴�F9#@mb����@r�
�Nb!@w�E�p@|!40��@��hǱ�@�,��o0w@����@����'��@�
a�#nO@�l�%,�E@�J�Bj�@��W:;0@���H��?@�=���4@������5@�؈x	�s@��$!��@�&><��@��*��@�+8�d�@��w����@�ԡ���@�[[�-�@���r��R@����0e@�z�� �@�_OV͑�@�\��k�	@�r��U�@���X�Ր@��M\�2[@�&�A@�ee�*j�@ıs$	��@�_E�S@�r$�T�O@����#�@�h�
�t@����V@͓ܪu�@�<Q��J�@�xtiQ�d@�X����@�>}^dv@�)�X��O@��=��@�^�O��@�A��3d        @7e�iw�@j{;d1��@�P�O�rS@�ę&�@@��ʉ@���^�>�@�/�(<�5@Ɣ9�.1j@� ��0@�p`w��@�s�_˃�@�%��!~@�Iy
�@��y��v@���4@�`�$�63@�^~y�o@�_�qw�@�V�����@���87|�@��E��A �s��A��+g��A����#An)b�GA	�et�}A�fO��Ab�E�4A2�l�A�wj��A{��H��AF��[mA*��B<_A*&��"AE&�	k�A|U�k��A hA�6A!�ZU�H9A"�����A$B��\�A%�.���"A'&���7A(�ᕳ��A*Q|����A,C*O�A-��%�e�A/�l�!aA0ɦ��]�A1̯$gT�A2�1Z�6�A3��
/eSA5E7��A6N�YׯA7�O**"�A8�&n�pA:2j�fy�A;���.0A=�wA>�S�
�A@��3OA@Ҳu�+AA�N+}�AB|�6�	        ?�mj�W�?�f��^?�|��yYo@P��h�+@���A^@��R$�h@#$\��ݠ@*�9f�@1�8�%>@5����/@:� �Y v@@_z
d��@C�]�Jv|@G5:��+N@K%9�� @Os2���@@R,A��@T���f�@WW����@ZI*պ�@]p��y�r@`hN�LX,@b4��̳�@d�`�L@f&�T��S@hML���@j��YA�P@l�x�%[�@o����@q�v��@r��d�V@t��}o�@u���D/@w:u�|:_@x�H�u��@zŖ�:L@|��K�l@~�mΑ�z@�^�W޹�@�t���ݤ@���l��?@���\"�@����=@�:�p:��@����\O2@��6���@�A����^@���&wz@�'�^z k@��d9�z�@�:�K@��fď.@���>�-@���c�@�v%}g�@�[���C�@�HG�p��@�;j-Bq@�5p���@�6r�@�>u���@�MnHO$g@�c:�t�{        ?�Х	��?Ӈ���s�?�P���@��1@)KG"Ck@!#V���@+0���_�@4���J.@>�����@FI��˟@O��a뗓@V_q�Km@^�����@e�Uw@lT}N��@r�y	��D@xce�M_�@QM\l��@��Rڟf�@��i�b�@��bc � @����~:@��@�˾v@�Y8/	y@�F�� <@�8�WZv@��e�rq�@�<����3@�^�}qf@�{E�麕@���u@�ڇv���@��%��#@�h�b��Y@��k=i+@£�Q�*�@��'���@�>r^!��@��ȉo�G@�yU)�ɨ@�N��?P�@�$cUg�*@ҳ���6@�T�$Aq�@�.�L\�@�͊�W��@٤�N?�@ۍz�I[�@݇�xh��@ߔ@�]>�@�٦;���@��7�M�@�#n��@�F�JŞn@�N�5,@��*Ul�@�!��ײw@����dt@���QPU�@쀎��p<@�\M�@���Z�@𻮩�D�        ?{���ym?��Ny�
5?͹����`?�o�:�F(?�?}o�U@�ƸI�@��c���@$In�Ռ�@10q���@;�G��@E3-�*@O&`N� o@VV��A@^4�0��L@d (]e�@j.�H,&@p�|D�@t��=�&�@y� &$�@4�M��@��k
ql�@�;�/� A@�'�����@�����@��d�c@�Sltj�@�=S�H�]@�l?��_�@��H�� �@���rpw�@��*x��*@���Em�@�i�p	@�����Y�@��Y���@����CF@�]}���@�s��I@��;!��@��뿻3h@�֖;��G@�2���@�h�3�nS@���B��,@�N�K^;X@¼���/<@�A�-�3�@��s�<��@Ǔ�C[�@�a�(�h@�H�m��@�J�� @�ei���#@�͛��κ@���*�&;@�+�+�j�@�oJ;�@���^�xY@��F6/@؍E���@���K@ے��\<@�*��"P        @P�!�0v@�}T�o�@���=a�@��t�3D@�U��>@�"�[J�@�A��L�@�R/)I.@�b�\/4@ࣚU�@��ԑ�
@��`0zK�@��oKP~n@�y��<C@�c��p��@���F��@�w��n-@��l���A�x?���A͒��FA@����~A����A���l$�A�4#e[hA
�h�A�#�i�0A�E`�M�A��Hs�A���:�A53���A��ۜ;+A $����A!� lH-BA#���xA$��MH$oA&8���YA'��a�HuA)ɣ��6A+���®A-����yA/֝�[�DA1ʻ╨A2,|*���A3_�k�F�A4�"EC�>A5�5�^�A7Ecp�}A8��A��A:"(��O�A;��:JA=7k�Q^�A>�Z1M��A@B��H!2AA!<�AB���SDAB���L�QAC�g��IAD��	1�AE�f8�XAF��N�/�AH
�"6"AI&��`o�AJKcN�Zq        ?����`��?�)[��[�@�a|�]@���
@$OH:\�@/�.Ҙ�@6�n*A�^@>�}���@D5T���@I����.�@O�����B@S�CƦ�@V��C &@Z����@^�����@a���� �@d#�`���@f��B�z@iu�.�r�@lZ�5F�@ohAPx�/@qO߹J�@s ����@t�rnG�@v�ؤ���@x�bZ~Е@z�@6���@|�k@.�V@~󢺠��@��:ڦ_�@��(���@�	@}μ'@�M�6�@����@���TVm@�M���@�����$C@� �8�I@��I��@� \F�F�@�xm�gj7@�y��O;�@�8�V�@��E���h@����%�@�~���@�Bά���@�	R87$�@���.ƾ@��&aE@�j�ć�i@�;�H籠@�V�W@��R�1�@�����Ɓ@��\0%�@��p�J��@�tGj��@�c	�a7c@�V�����@�'�L�@���yq@�(w�r�K        ?�GCo�"�?��$o���@ 
��+�|@���r�@!a�ڬ"}@+�����@4�Ф�D�@=S]Ҫ(�@D	5��@J��%=�@Q�`��,@WR���;0@^,��M�@cT��mF�@h���M(@n�
Gs@s+X4�r@w��5���@|�w��@�k\i���@���+3j@��t*�}�@�?�y�@����[�@��qŪ,@���cvt@�p��;��@�;\l�ա@�4&��;Z@�7�08@���n@�@��d^oX@��Z�m(@�_lW��@�GeY7��@�2'��s@�DM���@@�����@��m�%�@�y%�p��@�:��f�<@�4���@§��s9y@�S�8�
�@��E�y�@���RY@����e$�@�$Vx�@�Ug���@�Y��>�=@њ�n�O�@��#_��@�U֠�ƚ@�����r�@�grƯ:@��x+��@�ڂ��1�@ܽ	V�5�@޼���0@�m�7�*�@ፍaK@�-��@� u_��        ?yVj�U5?�C'���?����V�?�*;=���?��;�!Q?�O�d�P@JBQ}�s@őZq��@ �~�H@,����B@7�"÷:@B��l�@LDB����@T��'� R@]r�j5�@dVL����@kc�%9ʄ@r��t�C@wF�� @}�}@$p@�i�K�@%@��t�.��@���(��@��K�3@����5/@���u�@���gg�@�1��o5�@��3+��@�w6i���@�8E��I�@�1pHGE�@�c�y���@�g�N��&@�:��7G1@�+3@�F�@�9NB�O	@�eH�v	�@��W/�	,@��tR�@��i5�@�!�
�@�	ɔ@�����K@�v�b @���|@ȩjvq�@�Z�v˺�@�A�^ST@�����@�֩�L-�@��R���$@������@��N��@�b�T�@�9ߝ�@�gt/�j@נ��@��S2�@�5i���@ۑR|W��@��U�k�m@�m���ľ        @a�ݎ���@���ؾM@�K�F�@��%y�J@�nJ<�1@�iE�@�oj�[�s@炶����@�f����@�
� ��@�D�@fE@��'/�T}A k��1R�A5W��A��\��A�ݞ�3^A)x��Ay�d�MA�C���DA\sH5� AO�?��AY޴áHA}��=gA������A�Lz��A B�
ZC�A!��]�hA"�w��j�A$E*u�A%�D�m-CA':49�	ZA(ʥ�$(A*iH���A,�l:�A-�8#�OA/�@h�noA0�x���WA1���Q�hA2���`"RA3���0?�A4���?�A5���Q�A6�X2cT�A7�1�qRA8�/�K4KA9�r�b��A:�4����A;�ǈc9-A<בZC�A=�2�HA?�m�ōA@�DRDA@��}%��AAMb��AA��Ҍ9�AB�>�AC1��AC��}�ǟAD��?D��AE6����AE�(����AF���AG^��j        ?}rR%$8A?��7kX�?�	��)Z?��f�:?��x��HI@y֜�)\@	��=%V@��|
�k@O��Q�;@�/�8�@"�g�-�@&��o��5@*�P�o7@/ا�o��@2�
.��<@5nG��%]@8���0@;팻���@?���X��@A��ĕ�B@C�2���@F0��6@H�($O�@K5H��Q@M�g<�@PkI8|�@Q����8@S��~%�@U5õ,�h@V��}�d�@X� ?�3�@Z�p3Pr@\���0�e@^�Z�i�@`[�kW2a@aq.��|@b�f�M]@c��s�%@d��R��@f*̒���@gs1��\@h�^	�N�@j$����@k��K��@m�IND@n�(�>m@p�٠]@p���N��@q��A��K@r}B�>�@sZ�@���@t=r��Ks@u%�x�J�@v"��"�@w@6��@x����@yA��$�@z����@{���&@|$���l @}=P5O[@~\���4�@���\��        ?D�fI��M?�=�?�{5Cs�)?���2!B?��M��?�Z�����?����^{?�\�)?ߕ@�(B)�@�Su�:r@�Sk:��@%g=#��@/� ��@6�y�ϓ�@@ �'��@FZ3��@M�q��f�@S{�
�@Y)��!@_����	]@d	�q:��@hɕ,���@nN�����@rUc�-�@u���9��@z�9��@~��D,@��>�͚@������@�A��Ս@��0zF�&@��o �@����	�Y@�8���N�@����U�@���/\�w@��!0� p@�Ř��@��I]	�@����x�[@���%<sp@��/�I��@�T�W�@��ċ���@�V ��&@��'��_@��n����@�V��@�:X](�@�z�	f@�
��ſ�@�4�R�=�@���߬@�|9�i@��T���$@�/�#��@īb��@�>�x�ߛ@��?*m9@ɱ��r��@˔//$+@͓A^��:@ϰJq�        ?o0� �6\?����J�?���5%�?�;�P�q(?�L)��%?����a�@ �U[~��@
ږ�I��@�\�4$�@��g�&@'G��6@0��1�@7^�D0�@?��#��X@Ex:���@LL���@RYH̨j�@Wp���P>@]�i]J�"@b_���@f������@k}6�̰3@p��s��G@s���@wlߒ��<@{�D�Y#)@�V'{_@���0&��@�|�k@��݄RN>@�~��K(@��t���@����xw,@�:��K@�����{7@�@(}�B@��^�q@��dD�@�UBʁ�@�̔�٩@��
e9Z@�~@w5.@�����t@��<�|��@��6���{@�.P��@�ёe�@�'r���@�t@�%h@��8�yܱ@�Vv�@ �@��ekJ��@�{v�B2.@�(#�g!@���d���@��JUDo@�N`�J�O@�Jf=�ˇ@�Pq
4v�@�`�Y�Z�@�{�_�#_@šu�b@�њ.���        @�&�b�[@V���sd�@u��2���@����@�����"@�ݴ��0�@�e�q�N@���N�.<@��s��W@�)\,�_@�L��]n@�s� 9X@��*I,�@В�r��@�_�drm@�t���@���t0B8@݈EZ��$@��kgj@���V/Ol@�\�R��*@��=��ș@ꮱ�R��@���?Q�@�e[G�@�r3�@�ۣcA�6@����Q@��9r�`@��M�\@�2�5�i@�R�w���A \��	��A��]��A�]A�ĒAD�R���A��D�.�A Hg6A����@�A
0Gr�1GA�EG��uAu�iZ�A,��o0Ax��BAb$k���AR[^�;AI�ǂ��AG�-��0AMN�ސ�AY����<Am�|���A��ye,rA����A��o�'A=�h۱A?]��m�A�x2fA��'�"	A ��*"ToA!:�tb�	A!�t�g�A"���� �A#]JU(�        ?�����U}?��)�Rq?�w�V��-?�f �F�@)Zs�@t@�eJ�v�@-8"�|�@!�v���@(�k�5@/Eɚ?@3Πٱ�@8����@=�o^�"@AߺL���@E"~�͝�@H�o5�r@L�ܽp�@Pw}(���@R����@UQ���0�@X
�iM��@Z�޼pl�@^���H@`����@b��7h��@d}�W@f��'
�@h��e���@kT�Yh�@m�+te�@p��̑�@q�bY0@r�3��r�@t��0��@v5�M�H@w�MG9�@y��-��@{���f�@}����@ֻ2��s@���~��@�2�p��@�k��r�M@���#0@�
�#��@�q
�F��@��k_Q��@�j�J�^@��8x}�@����?i�@�R&��"@�����'@�q�"!��@�bj�+�@�Z�����@�[���_&@�eiuT�;@�x*y��@��1�6i�@���|�@��.UU@�"����@�f}ƥ��        ?[g�+e	?������?�f�YWJ,?׵��;�?��V\��?�u�d�"@
���\@Vs
���@#~��N^	@/9V�(�Z@8C��0N@A����s�@I�x�
F@RB�_��<@Yvd�@`�/�[�@f򥼒E@lw��`)�@r#߿̮@v��QA�A@{��IN:@��#@D@�yv8�@�o��[��@��1��>@��ُ@��ɧߝq@���YX/�@�-p�r� @�߲�9q7@�󡸷�@�#�7���@����KD@��k%@���=3N�@�ʕ\/q�@�|Q��7�@�0/G��@�'��[@��>D���@�ć#Ƀ@�7��c��@��vy�@���@��@�Ҳ��/�@�58xCK@ë8��z�@�5�v���@�լ�j"&@ȋr�V?�@�W�Wx�@�;���(@�8BS�H�@�&�l��S@�>sJW�1@�c_ke�@ӕ���
J@��s�!�@�%2^�R5@ׂh訪U@��G.���@�h���X@��ŌC�        ?�r
L�?������@�%�C�@�e�H_`@$�q�*�w@1��i@9��Tl܍@B���)@I�`]�l�@QU��?��@V��/Z�@^9�ܴ[@ch���^;@h��h��@oQO0TW:@s�E�t�@x;�Ƣ�@}���Lv@�
=�߫�@�����F@���Oo@��	��ay@�g���@�, �D�@�������@�vtH@�]�_h@��;�Ӣ�@�VS�a;@�1���@�PڭbD�@����S@�1��o�n@�-W��i8@�O/r�B�@��Ey@�	�R�@��h�I�@�l����}@�0���RD@���mx]@�n�%��@�3�c
�@�3hK�@����@�1p��S�@�oB���@�gx��2@ѩ6�ð@���ڭY@�dez�@���.��@�p	��S�@����T @��Cf)�@ܥ�p˒�@ޑ��l�@�K����@�[q�,�@�y��:@�Bf�D@����z��@�+��	        @>���Fzl@s;�^K�v@�x�����@���Jh�@��G?�d;@���Ϡ[@ʃr�L ;@҉�G�Y@ؽ_�h�@��	��@��r�� @虜U�<�@���a2K@񶭏��@��
��@�T�,4�9@�"ϛ �A %�oщ�Aj'̉�NA�ǁ5YA�2S3E�A
oA��7�A���#E�As��ݒuA@�)�r�A/*�@�KA?�E�PlAsQ�2rmA˲�w�AJ ��gA�����A!_��$�QA"�k���A$oI�вoA&�TJJJA'��J��A)�Z�lA+��>�FA-���
��A/�ב{#�A1��6.A2=�>`�A3|v7�d�A4�	`��A6)���/UA7��*1�|A9�#�KA:���1A<SA>
ق_�A?ՁQ��A@ٽ_Q$�AAҜH�AB՜�"�AC��	=AD�#��9�AFM�{^AGL���AH�@��7�AI���B��AK!Hk2��AL���BdAM�(<        ?��=3]?�b
o�"�?�����AS@�(�^&@@!��V۵@,��Þ�@5T��3hx@=��x�Q�@Cny!�@H��Ŝv`@Nn��.M@R\��/Q�@U�*~��@Yk���@]O|��9@`�!�>K@b㒜�Y#@e*�b�:�@g�$��Y@j����@l�#J5b-@oH��y��@qO�D@ry�.�xm@s���.�^@u�Ѭ�Ғ@w(��]H@x�-�X}�@z�����@|m�Bj��@~S����@�%�;��@�*��Rw4@�8�0@�N1H[��@�l�gI)@���@�ky@��=���@���7��l@�:
���8@���_%@���&�QN@�'�䦿,@����(@��b��y�@��:��,�@�j%�q*@�*���s@��e	�g�@��v���@��S��Ƒ@�cM�?�@�@�t��q@�$�ք	!@���0u�@� -s#�@�����@���Iu��@��(����@��_W�@�٠���@�,�$�W�@�$����        ?t�R�A�?�CzO~_�?����&?�'F�PpD?�m��&�@�CM��@��9 � @.4�|��@ /��su@&��A��@/9���a@5G����b@<�]�ma@B���x�@H��Q�@O��ѾB@TD"�L@YjLY�P'@_x�*���@cA�2�A�@gN�Q��E@k�n*B�@p��}c��@s�e��ę@vǤ��|�@zj�x���@~o��[�@�n(9tb@��0����@����1>@�d�đ�@��~�O��@���DlM@�Ȥ�(@��p�ާP@��o+ ��@��ɍ�z@��Cf��@�N����@���~vi@�SX��*p@��Wg:�@�u���| @�)A�ްI@��¥��*@��Ρj�@��$�l�@����lt@�B~�Be@�;��_@�r�?�b@���Uˋ�@��L,o@�|E.���@���3[`�@��qɈ@�&��4-@����|LC@��6��@�B׫�f#@�=ʋ�A@�DBئ&t@�V�4A7?        ?�����@vjp˂@#���3@7z� @�"@E����@QI����@Y"��N��@a/����@f��+�YV@l�+�濞@q���J�w@u����@z1轾�[@>� �'�@�w�ڕd�@����p,�@�@g�D�1@�B�![�@��tt8�@�Y� Vؕ@�����`@�(I��f�@��nih�9@��\��@�O޹�?@�R���C@�����@�MV�Ͱ@�}���@����h�@�'Q��d�@���Н��@���5���@���yx��@�����J�@�ظ:	�@��0m�K@�~$%'+0@����lh@�G�mє�@ß]w=0@��8@��@�t!�h,@���,ۦA@�x|�AM@��z0x9@̩� �� @�Rne�F@��M�@����r,@���7�L@ҫ���@ӗ����v@ԇ��;@�|!wD�~@�t�̋�@�o�^� #@�n�>�@�q%�3��@�v�"�C�@�B?SkL@܊Бc�{@ݙM]        @k��.�~@�v��5EJ@�Q����@��_K�p�@��5>j�y@�\�gUsQ@�K���@��4^��'@�s���}MA��l��YA�זhAr�0�NA��&��A�M�R�A,��i��A�`�A���z[A�n~X�A uy�;^A"�(�	�A#��LAH�A%s�*��A'9�:���A)��x^vA*���RX�A,��GS�A.��֟�"A0{�����A1����@A2�3��A3��È�A4��c��A6*G�؏�A7h>��QDA8��~���A: [�y4A;Z�"�zUA<�wۭ�
A>+�tAvxA?�
�/��A@��y�'2AATg���AB#�$l#AB�A�	sAC����AD� ��^�AE^ҝ�,�AF8Ϻ��AG��t��AG�e���xAH���[�AI�)�o��AJ��sFAK���څfAL��:]�VAM�5cL��AN������AO��"��GAPJİ�WAP��
 AQU��n�AQފӡ��ARh�3ɟ�        ?�$cO� �?�M���?���!�@@���D�@K��9�e@ �ׅ�B(@'�;��'@/�@�� �@4���z@9�F��^@?VG9�-@B��i�@FoEc@I����k@M�i�N�L@P����L@S�x�L�@Uhmϱi$@W�����0@Z��)��@]p�C?V@`8�Q�Q�@a�'Ҩ�@cx��3�l@e8ź_��@g�&�@h��L�x@j�H)�a�@m�$�}@o,6$�@p��:�^@q�4ȩt�@s�M̙�@tNh���@u�v
��@v��q��@xN�@���@y�I��@{36��� @|����CG@~F�A�3@�B���@����x�@��o槕,@���d�_�@�i����@�Y�]�s�@�QD��@�P�o��6@�W�G��@�gG��@�Y7�@���p��i@��5D][@�����7R@�:p_I��@������@�kxgj��@�J*�Ll@��%�S�\@��,\���@�Ox�h�@� ��        ?ki�_`�?�C9��S�?�2]Q�z�?ۑ��"��?��$=Z�?�w�m�=@�/,��@�3v�@#��~ƨ�@/�����)@8���0�@BU8Kƿ�@Jg��m��@Ru�3!@Y �yM|�@`����@e�L���@k��G���@q[���?�@uld��l�@z�lR~L@Y�@qk�@����;�t@��VW�j@��+���@���M��@���Z2$@�o�fJjU@�
,A�@@��"q�7�@�
�{�:@�h����l@��`�-U@�}r����@�����@�⍫j��@�Tm��ą@���?�L�@������,@�^jG�l@����V��@���
�*@�q��7��@�WŮ��@�Y��<h@�w�\ @���Լ3@���R��#@���~��@��]���@�j,t 	@��ǲ���@�WF��=�@��s�QD0@ʏ+���@�I`�ЛE@�CV�@��S���-@���>=�@�	����@�"VP%t@�HE�_��@�|b�[�O        ?�Q�����?�&�P�NQ?��ŔV �@����@�z����@!Az��@)��$V�A@2#��T@8����Ψ@@�(@
�_@FfK�:@Msr�XN@S)]��>@X��+F:h@_}.ko��@c��~��M@h���cS
@n�r9�Ă@r�Z����@v����7@{��y�.i@�m��)@�p�*�@���&(@���H M�@��i���@���r4{@�H�]�	@�T��@��UF�@�d}�6d?@�x�I�m@�aښ�W@�n���Y@��S"���@��Ec�^�@�{Vn�@�&7
�
@�~e�,�z@� ��>�@�����a@�N]h@X�@�x�$6U@��{E�@@�����@�3ݠ!��@�y��e	�@���#�/1@�6(��T@Íy����@����@�u�"q�>@���.G�@ɯ8��%@�lh���@�@7b���@�+gQF��@З^Ǒ]�@ѥ�B�8@��yq��4@�誟vg@�o)ՁJ@�b��@K        @Q�Y4ܽ<@��	l��I@�N�y���@�v�_vj]@�q��B�@�tk9ߵ�@�{<�r�@�$���d@���'�@�G�A���@�o��cb@��oa�J�@�piZc.�@��H��`@��E��H�@����@�XZ�Rk�@��K���A�T�A�N w��A�n��AoGb��,A
��+�A���4eA,�v�A��0%@A-���A��F,F�Aw�UvpA80D9��A
�u/�A�ޏ��8Aꔠ�y�A���d;�A!�t�>A"*d�e�CA#Q嫭��A$���V3A%���E{=A'ӹα�A(b���]�A)�� ���A+3� ���A,�ݡ&�A.9�3��aA/���"�#A0�Y����A1�@���A2y�KG��A3d5V�lA4VI���mA5P�;h�WA6T�bu A7`�_UsA8v���|mA9���xA:���9B�A;�>�v�}A=>����A>������A?�c�KA@�A���AAaH���        ?����Z�?�g.|إ�?��ϖ���@�َ��@Ϗ&��@&��gg@0@4"B@64�}��e@=O-��@B�C扠�@GA��˽{@LJ�ah��@P�d��9�@S������@W �4\�@Z���:r@^LMI��!@a�ߞ�i@c9�j�@esm[G�@g�or	J@jN�|�3@l�t��00@o���o!@qRS�B� @r�J�O�@tz4��*@v,��U y@w�ks�@y�
��a@{�b����@}�ي%M,@�ZCv<O@�tv�P@�AJ�\B�@�y��͎�@��%�!2f@����@�x�qO{@���M�n>@�n��2@�����-�@��;3��R@�P��k@��i%��M@�n'�Y@�\'�ڻp@�QU���@�M�{��@�Q_�]�@�[���v*@�mA U�@��O��Q!@����0q@����@�����@�7F�X��@�wʶ��@����֑@��jG.2?@�6�։4@���ҥZ�@��`2��}        ?���5�]�?��s�"?�v�w?���j��@M@�0�@H�Y�B@#AH��ͼ@0�g�m\@9įj #|@D�о	<@NcM�mp�@VEO����@_��*�@e��s�,@m�0����@s�'�$�@yyauz@�=��|'�@�d!�]�C@�?Q�ܵh@��}���@@��ZP���@�Rs
WQ@�u���y@��V�@� �,:@����+3�@�%T;��>@��{=5�@�b�/���@�����@����b[�@�\X�?��@���T3
@��!��i@��M��ś@��3Q]��@�}R\�x@�8�hs��@�f}�i�@�����l�@��D�&�x@�O���@�F��`Y�@�I���	�@�|�Q@Ҽ�����@�
�W��8@�e� �w@��kγ�)@�G�ߗ�@���b<�I@�h���u@��&D��@��W|�@�M���@�>�#��@�:��j2&@�A.���@�S�Z��@�p��@��@暯$|`�@��/�o�        ?��;��2?�g:t�P@.�ϥ�q@�wJ�@&�˜��@2R/1���@;f⤖��@Cp/c4��@J��n�~�@QًRB�@W���})�@^�@c�s2�!@h� 㾰@oJ�n��@sz=���@x�}�4O@}_J��N@��ER�8�@�no����@���r6��@�a���^�@���}3ͧ@��kC2��@�u�r�@�X��qdJ@�V�;�K@��%���@�e$�5�@�O�.	@�~��ԥ�@��j}��@�]��3Ӯ@�f�X��@���F�O@��/��g@�yo�e�B@�*�,��@�W�G`@����x�@�&��W#�@���>�@Ƨ �8�@ȋ<p��@ʇ���L�@̝����U@��B?�@�@Њ2n��@ѻ�c�@��
)��@�D�̗@՜i�W��@�8IfB'@�u�;��@�����@ۆ���@�$Oz
�K@�в�Z��@�E��,N�@�+EH��@�￿E4@�� [�@�	/_��\        @^��;�@��:e@��LY��@�@����@�3>�N�@�EUnl�@�נ,�t�@�5	G⹉@�ܓ�@��@���뇫x@��N�A	��E)�AP��9RA�Q�A��hJSoA���A5��	nA���y��A/K���nA�ڹ��A�%6��A�5�8�A!��p{d1A#N��pxA%(j��>A'y���A)��E��A+!�A�MA-V$c`�dA/��$s��A1A!CA2J���A3�y��A4��=^,cA6i�Ox~&A7�&[���A9v���jA;���7�A<�i\A>~�/a�A@&8͚:zAA�/�ABk��ACK� AD�����AE"�n�6AF;oQ�AG[�Ef�AH����gAI�VNa��AJ�N��AL2�F@bAM}��S�AN�n1j�AP�k�g+AP�jn��
AQ�^r�EAR;��ssAR��?ECyAS�A��AT� �W��AUVt��=AV(h���        ?���L牄?���u|0^?����/@���t@<ǹ��@ ����ܕ@'���Fe@04��7�3@5S�h�$@:�H��܋@@b�Sh.~@CǢ�/�@G����w�@K�S[%@O���x�;@R_�<�ˋ@T���Ǭ@W��Q52b@Z�/7�X�@]��~���@`����u@blq*M��@dT�{�M@fY��9�@h{-�S�@j���� U@m�[�!@o���`N�@q+���@ro� ���@s�c���)@uT���3�@v���Nv@xy� eQN@z%���vB@{��Nn.�@}�6���b@�c�ؘu@��&gZy@���bH`�@�䒒=]`@��ճ��@�,'/A�@�a|�/{@���=��`@��{1v
�@�J�PvT@��`l��r@�%�^@���[|��@��B<@��^�7@��1[���@����F\�@�}��qz�@�iD$�,�@�]
�f!T@�YpatC@�]���J@�j�/.h@���h%
@��U�Y�)@��֤#��        ?�
���O?�I3񏾊?�=.��9@	?ɓ��@H��@%	�8k@0mt�� @6�՗�&@?�<���@E՜Mz�@K���:r@RͬM�@W)=( g@]~ìzm(@b�~|W6�@gM� u@l�f8@q���K�@u����Z-@z&���@R�b'��@���t��U@����ұt@��
�W@��ر�l@�>a���@��p��!@��oI|@����,�-@������Z@�E���@�34�Џ@�F�z�s@�I'&@�ߕ=7�@@�i�'�+@�����1@�����j�@����"L@�����!�@�nW���@�H��� �@�@��)��@�V:X���@�����u9@�ߗh�M1@�*����d@�vY�|@��߄{d/@�Aa�r:V@��
<��@�UN��D@����se�@˵�N���@̓��(,�@�f-��b�@Ю�y>�&@ѵ�����@��q}9�@�����@��ߤ\@�BY~9�@׃v-��        ?���=�6�?�S�C��?�K�sO@@��{b�@������@*��>΁�@5�l�a��@?��F���@F���ƙ2@N���B@T�SG.@Y��4�XI@`�[�9@dĲ"��@i�79N��@o�d�K��@s`�߸�_@wr51��@|%�7��+@��\�\|�@��s
(v@�T��(�@�@e�l�@��r���@�E��_O�@���<��@����W].@�H~���@��ӊ*�@�j~���@�����K@��
�|��@�f4���@�=7<��@�"�q�@�� �9�@�N �0!@�! �7�*@���{�@�-ތ2�@�j�p�0@��a�Eo(@�W�jmK�@��Hk�@�ub����@���]A�@ŗ��p�@�L��@���3@�T��2@�y͕�Z@�&\x^2@в����@��h/�.�@����@�n���G�@���JO2&@�Cn��l�@���\�@@�d�X��@��ʧ��@������@߲��g��        @O������@���O�@���
�@��_�'L@�3Nu�*@ӻ�ſ0�@�/����-@�/82�?�@�hDp4�@�� ���@�������@�]ҏ�ź@�6c�bBuA�5Z�_�A�}���)A��ʂoA�E@TA�����xAIm��A\���J0A�����A�=��(Au�x ��A H��A�Ĩ�KA!w�F{)�A#
�匪wA$�� �#�A&sx�*��A(J^!��gA*9|R�t�A,A�p�ZA.e#rާA0RA���A1�Ұ�ɢA2�a�9A4��`�A5mu��~yA6���A8b�K��"A9�ϨfTA;��Y��RA=^[_�WWA?.(�.#�A@��L�WAA�^z�D6AB�ݎ39�AC�T"��AD��=AE�o��fAGB/\Z�AH<eK#�lAI~�����AJ�m��qAL#ё��AM�^7KAN��ִ�{AP6,(Q�AP��[�AQ������AR���� �AS_����AT8mYʘ�        ?�?�б"]?��.�T1v?�8�?�@ǩVp�:@!c��@'�(�_]/@1:��+f@7�Fn2��@>�W���@C�_�I߮@HF�d��@M ɓ\\�@QSVn�UN@TU�JK�@W�]��)�@[�!�`W@^�<�x� @a|���@c��zn@e��>�C@@hh��wDG@j���?�@m���]�@pN�X`�@q�/�t@sh�=:^R@ur	)�@v�
J@x�w�t@z�۞��S@|�=P�@~��� �@�W�J�m�@�r�m�Y/@��N��@�ȗ$��@�˳İ@�J%⹪�@���E�a�@�����l<@�c���I@�ڰ���@�_�@�K@��&5�[@�K5��@�%�F�@�T�g@����3@��O�y@��M��@�:'��*@�i՚@�G&���l@�|���ve@��NI�@���Xx@�lC��@���E�A@�'�����@���9l�@��2OcJ�@�����z=@�`[W�{�        ?���1��?�Vti��?��X�u4?�5uy/�@%���@�SD��
@0|y�y@';d��J@1mk���@9� h��@BAk�{��@I�mw�t
@Q�DY���@W���Ϋ@_"k�A��@d(w�爬@i�Q-uq@p�ֶ!H@s䶳w��@xKu���4@}X�U�e@��m�J�D@�ќw�}�@��'�6�@���F�0t@���S�@�Ao���@�&Z �@�\[��A@��'���@�i:��=@����9f@��}ge�@�x�*�#@�Bt��.�@�G��Ãb@�E�6>�@�э�W_@��f����@��d��@�e���@�j g[��@��}���@�y�<��@��M]�S@:����@� ۋ��W@��L(q_�@�z7��Ӟ@�IZ]��@�0����@�0�o<By@�J?����@пK��߬@��7�Ҽ
@�W�f��@�b��9@յ�hg@�LF��@،t.��V@����s@@ۣi���@�G�u&�        ?����W?Ԓ���x�?�iBi,@�+Q��@ S�R@#�����@.8>4�C@6$_t�5@?J��� @E���s�@M$�#�)�@Sh��<X@Y���K��@`���=�@eW'�3u@k)jC21�@qt�8�@uVՇ&�@zY��yF�@��,!!%@���.|�@�m��[�4@��o7/@�r�x��@�B��
�@�c/�y �@�د'<C�@�����t@��K��@�3�Ә�@����I5W@�n�ư�8@�i��}@������@��	�=#@�
�w�wW@�&.y���@�pQ&i�@��!���@��)�F��@���[9d@�Pǩ.g@��;K�@��T!{��@Ư��V�~@ȶQ�T\�@����NI�@� .rlc@σ��O�@�O���@�S��y6�@Ӵ�L{X�@�%��ZW�@֦��e��@�9j��
@�ܒ�Rc@ۑ�}b�D@�Y��l.�@�4G�y͢@�� 35<@����C@���Mǰ@�'ى|        @YL*D@�����W@�UӉrc@�^ғxB�@�r辻�@��,�y@�q�߂�@�#�]�p�@�m��>�@�M]�m�@�T�2��@�L#K�Z�@�0��$l@�bFAQ��Ar}~źA�M�At��5�A	:Qk}�4A0�<�bAX�f��AZ�%��FA#:|p�A/�-/HA6d�5A")o�	AP�O�A�ҭg�A ����A!GXŬ�A"�h�DA#��_k{A%`~��buA&���
p�A(a{��A)��̑/�A+�T.��ZA-R���yA/���XdA0wC�%��A1k���
RA2iS��U�A3qN�}�UA4�/�G"?A5�ڼ��A6΁�B��A8�-�A9S���IA:��c�!A<#��V�A=��i�!A?I���A@�sxkAAg(��@ABZƔJ�ACY	��:ADc���@�AEy솻��AF�W�]Y�AG�ϡ��AH�@�Y
AJA��0\AK�6�FW~AL��l�        ?ӓ����@����$�@i���@.B}�s):@9����3@C�C_9#�@K�Bm�+D@R���x'@X��SF%@^�q$��@c߻���@g	��
��@ke]�^6�@p�O�Y�@r���K�@ub�t�]Y@xTY}w�@{v��0\�@~�&�;�@�%��p�@��ڻ莋@��c=l�@���w��@�<��m�@�ER��k�@��;�E�@��9v�@�5�x@@�~�����@�Ӿ�j.k@�5���0@��2G��w@��@����_?�@�>�s��@�������@��7L�@�'ґċV@� �2r@��
W���@�둸?�@����@��S���@��\G+��@���G��e@�	�z�@�!�;oF�@�?��6�Z@�dC�
�r@��Wb�@����L�F@���&�!@�q�Qi@������k@�W�.Fy@��t��@����	r@�F��0{�@��M�v��@���w0S4@�E�㵄�@���S_@��3����        ?�^.��5?�����f@ �����@cs��(@$ �2��@0�����@9�~@Bh���@I)e�4l�@P����I�@U��i�GW@[ed��@@a0��@eU��8�@j>�~Z� @pcT���@sf�=��@wY�h&x@{��2�F@�����@��9?&@�<V�k@����@�h	K�ޝ@�.��nun@���Uk�C@�	�Z^�@�s9Y��`@�70�&<`@����{u@��I��@�e0��r@�h���@���'�x@� �E�@�1��\d@����ǰ@��<�5�d@��$��pg@�J�\�@�W��`�@��P6#��@�%j�?P�@�{ܓ���@���9#��@�]���L�@��	@ǈ��,v�@�:��$��@� ����@�ۛ��@�˂7G@�h��ز@�vϕ�@Ґ��4V�@Ӷd��$�@��=�@�'aC<�@�sS~X��@����M�@�4Z��2@۩��8j@�.6t�28        ?�?〾� ?��a��?�1��a_?�m���ߨ?�,�l{�%@����1@���A�@�x�v�@%ב]H��@0-���7@7z5�ރ9@@������@GA���@OĐy�Ա@UH���@\TGU̇@b���@gγ3�g@l���Ԉe@q�'q�=@u����1�@z�^�%@��u�L�@��5�ډ@�,�1�>�@��έ��@��"��@�T�D�?@��(a5��@��?�KS�@������@����A�@�I���7@�;ϕ潰@�U�W���@���VϾ2@�� ��@��h�c��@�nIa�B�@��/�,q@�L���\�@���wg�@��@*��/@���Of��@����>c�@�����@�0�߁��@�M��ԙ@��sK�~1@����]�@�\��=@�މ�%�@�u
F)�@�!/���%@���Ҧ�@̽)0�?@ήA�ʚ�@�[�L�ޚ@�l�S��>@Ҋ]����@Ӵ�#m�@��O�⚭@�1u]�        @v�B�<@��7%/�@���&��@���aےx@��q�b�@�i��؝@�{�[ZQ@��$&�c1A Poo�A.ӣ��IA�q���A�&�GVZA���A�����A��~�A�$V�A^�,NA!�V%8�A#�b%_�A&*���I�A(���L�~A+)����A-�\��A0[3J;}2A1�a��<A3i��� A5�@ӋA6���m�A8�0��A:e��hA<T�ɒA>XMk�>A@7�}��aAAM��?ABnj�%WAC����&ADϥ?��3AF�X�a AG\N/��AH�Й��AJ��[�AK�?���;AL���]ANz|���APp��l�AP�ȑ��AQ�.��DeARt��$g�ASN��U�AT-�ʩjZAU4��MAU��#�AV����AW��'�AX�E���AY�G�h@�AZ���Ш�A[�M��j/A\�)��A]�1�rA^�a?�A_Ͷ�IA`m��(��        ?�B�0BkG?���$2�=?�J��@ԛ��@Ė�b{;@Xi�^2@%O��@,���@2�(�h��@7�U�g%@=c����@A�◱ل@E4�WWcU@H�ӆ*�@L�q��f@P�,���x@R���>@UN(��t,@W���M@Z��f; �@]l�����@`5x��@a����<=@cl�w[@e'���T�@f��v�91@hߒ�Y��@j�w���@l��s�@o �@p�X�5%@q��kZ[@s&��p@tu��x�@u����@wDs��~~@x��y�<@zS���c@{���QJ@}��[�o@g-�;�s@����n�@��7���@��C[��%@��@V�@���E�@��hW�Ŏ@���-��@�δZ�'@�L�17��@���e�� @��ewm�@�9��n�@��3?@�	|C�v@��h=N�@���%B@�]����@�0�@�@�r?ݰx@��! e0@��Ք�1�@���}�         ?c��Z��?�s#�k�4?����\�?�c�t
�?��,HY�?�(}X�w	?�V���D@	Z]:x�@x(� z@!�����<@,�A�@5�c/V��@@;����:@G�i����@P�AM�@W�G5�;@_>�7>�O@d��g´�@j�p���@qC[(Q@u��C�.@{ >��
@�����@�H/d�}<@�g�9n4�@��!�@�,gMл�@�9(+ܐ@�`T�[@���Z��@��l_?�@����O�@����@�k2�KFJ@�ƿ��@���κH�@��}w)@�G:�@��`uk�Q@��rI:.@�^�KB�@�x�l�:@��V�Zf�@��7�9�@���&�@��:�˝X@���w�u@�ɚ:@�]�-�d@Ŵiu�@�8��m@ȃqx�
@��'_�D�@ˀtr���@�z�Q�@άf��d}@�*7�٢�@�kC�w�@���䑺^@��
b��@ӹ�!^�W@Ԯ�p�Ve@ժ�x�'�        ?eb��ˁ?��S�(��?�ube(m?�''���b?�����?���r@zo_S@���@��!@"⹢�G6@,�!|��=@5Q�dh@>��R/{�@E�*����@M��@͢{@S�x�5@ZR��ߤe@a�a���@e�}��!@k����@q����@u1��S@y�����@~�;,�)@�CK��Tf@��G����@�3�WS��@�Ah���@�ۼ����@�L�G�~�@��l ��@���w��@��;��!@�HL���w@�l���k�@�Si`	ݧ@�W��w��@�z)�Y?1@������@����@@��ޥ �i@��|?�^�@��v3QP�@�S*PE��@��k7�@�I�W�@����n4�@�t�m�@�&2c�D@��@��U�@��F��p@�37�H3@�!m�G��@�)ŕ�@�B���@��Ї(!@�z��#W@�(��Q�@�=�i@�X�I@�y�I�@ʡ���z@���=�z�        @<��[+m@ta p��@��Φ�'�@�%�fsm@��W�`�@��O��x@ų���#A@ͧm'�U�@�p��Ǫ�@س��NL�@ޠ����@✯>\�@�?�Ԍi�@�9`G��n@��k�6b@�۶kB�@��2��@��_�k��@���D�)@���m�\@��r<�C�A�:%reAz�5+Ahq&<M�Ar�L�FA	���ѥA���p.mAH���Ag~�RGdA��_~3�A!��a�A��{�0�A'@�w�Aǽ�D�VA})�N�mAG%U��A%T�"5As5A ��1��A!����h�A"��!>BA#ԭ�oA%�ő�A&8C��ʕA'z�,�k!A(Ȏ�_�A*"	���A+�S�8[A,��4ejA.v�ۺA/��*d�.A0��)	�A1�р>�A2u2���lA3T}�0�A4:����DA5(�ЕR�A6V�d�A7�o7kwA8!���.zA9/�
ʏA:F�,��(A;g!�V�        ?��TSL��?�]fIS��?�Uy�?����c@ -R��*@	i�ad��@M���E�@�Nɦa.@ 0S�=,@$o�H�{7@)2��ʠf@.�9�uي@2/i�^�@5jf����@8��SW@<����a�@@{�����@B��Ld��@E#R<��e@G�u���-@Jqtsx�@MXS�!`@P5R�@Q�vV��@S�Ga7@U]y�K��@WF���&�@YI�E��V@[f����T@]����@_�n��@a5'0��@b��	B�@c���nM�@eP�od�E@f���
�@hnD�@j��2��@k�_�9\�@m��w#@o��O�G@p��0ر�@q�z/�Q@r��R���@t��v&�@u6�%��@vs_!?��@w�N7/�@y2Cԝy@z	V?��@{����x�@}{2��k@L�~�@�X�#T�}@�0�A�I�@��xE�@������@��/�&@��)ȑ@���;��@�ϩ���@��ar��Q@��[_�$|        ?kG�H�?���"|H?� Ȟș?���^�?�G"4fq?���9?�w�>	@
��s�@1�N@"	�]�@,�@p.�@5��l��@@Fh����@Gn�Bj��@Pg�9�$�@Ve��e@]�f��5$@c�条0�@i�G]'�@o��e\�@s���3��@xO�D/:�@}�Bo �@���6�KP@�3�-�@�A���@�^Z'C~@�wC���@����h��@�����@���蠃@�c�S�@��B}�[�@��!�N�@�߸��9@�C�Y���@�ԋ1�j@��5���P@��s�tn_@�S�q�o�@���hy@���1%�@���7Xy�@��*ཅ�@���h�@�'-�4.@�d���i�@���*kT�@�Dc�h\f@ç�D�S@����:@Ƨgs�Fj@�D��^2'@���RΊ@˼�z��@͙�nA�@ό�w^��@��`��)K@��9���M@��
���@�!��m�@�Wꖊ@֘Y�ەb        ?T#�^�?��I_=�?���4��?�T���?���V��?�`��zؑ?�m1#@�X�:d@:>GS�B@�3X|�@%[ @��\@0N;�[�@8�c�@A)���'@G�ъŖ�@P&����@Uj�=@[�G��@a�eӲW@fl�j.@@k��m ��@qP%q}@t�"���@x嘝��r@}�ڽ�?�@�y��1WA@�u*dp^@��@�U8@�q��f�@�{_� �@����@�\g��@���l�@�˩��]@��{��>@���(?�@��Ã�K@��撨�`@��E���#@��%r�@���0�@�OF���@�̿.�E�@���m?�%@�Z�r��@��ɼ>y�@��,��d@���"O@�g8fvQ�@�/}坎}@�� @��h�@�
�$9�Y@�����@�@L��@�n�����@ī8�I�@������@�L��8@ȳ ��x@�'�?�^�@˫&�m@�=��^        @0^Fx�@�@e��n��@��62�Ð@�G�[���@���e��@�F�|�^�@�\�!�,�@�y�z��@�==3F�@Ʋ�g��@˥�F��@Џk��2�@ӓ_�MВ@��'��@ځ��^2@�rR6�im@�Z�#of�@�����X@�g; ؟@�o*��@�|D���@�h*�C�@�Y�#wu@�Y��p�X@�
(H�p	@��c~f��@��33F@�����-I@������@��@a`Y@��fC=EA�\��AJ �� �A����A߱	��AB�)�`�A�'>��7A	:�Z˗A
��=SQAuQiv��A.��E#�A�g 0٤A�=�$LA��n��!A�b���A�ug��A7<�p�Al�J�gA� ���oA���Ak;H_��A�"_�WEAb|P�qA�y�m��A IZ=;#A!���d�A!�)�	> A"���s�"A#��,��A$���!*#A%�)YR҄A&���b�,A'��b�Y�