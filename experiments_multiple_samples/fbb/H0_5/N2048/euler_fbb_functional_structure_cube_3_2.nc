CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102523        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
2147483647         0alsvinn_report.cudaProperties.maxThreadsPerBlock          1024       +alsvinn_report.cudaProperties.maxThreadsDim           1024, 1024, 64         )alsvinn_report.cudaProperties.maxGridSize             2147483647, 65535, 65535       +alsvinn_report.cudaProperties.totalConstMem           65536          #alsvinn_report.cudaProperties.major           6          #alsvinn_report.cudaProperties.minor           1          'alsvinn_report.cudaProperties.clockRate           1582000        .alsvinn_report.cudaProperties.textureAlignment            512        +alsvinn_report.cudaProperties.deviceOverlap           1          1alsvinn_report.cudaProperties.multiProcessorCount             28         6alsvinn_report.cudaProperties.kernelExecTimeoutEnabled            0          (alsvinn_report.cudaProperties.integrated          0          .alsvinn_report.cudaProperties.canMapHostMemory            1          )alsvinn_report.cudaProperties.computeMode             3          /alsvinn_report.cudaProperties.concurrentKernels           1          (alsvinn_report.cudaProperties.ECCEnabled          0          &alsvinn_report.cudaProperties.pciBusID            4          )alsvinn_report.cudaProperties.pciDeviceID             0          'alsvinn_report.cudaProperties.tccDriver           0          alsvinn_report.mpiEnabled             true       alsvinn_report.mpiProcesses           32         alsvinn_report.mpiVersion             �Open MPI v2.1.0, package: Open MPI spackapps@lo-login-02 Distribution, ident: 2.1.0, repo rev: v2.0.1-696-g1cd1edf, Mar 20, 2017       alsvinn_report.ompEnabled             true       alsvinn_report.ompThreads             1          �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_py         �import scipy.stats

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



        �alsvinn_report.loadedTextFiles._dash_cluster_dash_scratch_dash_klye_dash_single_sample_structure_functions_new_dash_experiments_multiple_samples_dash_fbb_dash_H0_5_dash_N2048_dash_euler_fbb_DOT_xml            �<?xml version="1.0" ?>
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
          <value>0.5</value>
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
        alsvinn_report.pythonVersion          mRuntime: 3.6.4 (default, Apr 10 2018, 07:54:00) 
[GCC 4.8.5 20150623 (Red Hat 4.8.5-16)], compile time: 3.6.4          alsvinn_report.alsvinnInDocker            false             �       time                                           b        sample_0_rho                                                        b       sample_0_mx                                                         d       sample_0_my                                                         f       
sample_0_E                                                          h       sample_32_rho                                                           j       sample_32_mx                                                        l       sample_32_my                                                        n       sample_32_E                                                         p       sample_64_rho                                                           r       sample_64_mx                                                        t       sample_64_my                                                        v       sample_64_E                                                         x       sample_96_rho                                                           z       sample_96_mx                                                        |       sample_96_my                                                        ~       sample_96_E                                                         �       sample_128_rho                                                          �       sample_128_mx                                                           �       sample_128_my                                                           �       sample_128_E                                                        �       sample_160_rho                                                          �       sample_160_mx                                                           �       sample_160_my                                                           �       sample_160_E                                                        �       sample_192_rho                                                          �       sample_192_mx                                                           �       sample_192_my                                                           �       sample_192_E                                                        �       sample_224_rho                                                          �       sample_224_mx                                                           �       sample_224_my                                                           �       sample_224_E                                                        �       sample_256_rho                                                          �       sample_256_mx                                                           �       sample_256_my                                                           �       sample_256_E                                                        �       sample_288_rho                                                          �       sample_288_mx                                                           �       sample_288_my                                                           �       sample_288_E                                                        �       sample_320_rho                                                          �       sample_320_mx                                                           �       sample_320_my                                                           �       sample_320_E                                                        �       sample_352_rho                                                          �       sample_352_mx                                                           �       sample_352_my                                                           �       sample_352_E                                                        �       sample_384_rho                                                          �       sample_384_mx                                                           �       sample_384_my                                                           �       sample_384_E                                                        �       sample_416_rho                                                          �       sample_416_mx                                                           �       sample_416_my                                                           �       sample_416_E                                                        �       sample_448_rho                                                          �       sample_448_mx                                                           �       sample_448_my                                                           �       sample_448_E                                                        �       sample_480_rho                                                          �       sample_480_mx                                                           �       sample_480_my                                                           �       sample_480_E                                                        �       sample_512_rho                                                          �       sample_512_mx                                                           �       sample_512_my                                                           �       sample_512_E                                                        �       sample_544_rho                                                          �       sample_544_mx                                                           �       sample_544_my                                                           �       sample_544_E                                                        �       sample_576_rho                                                          �       sample_576_mx                                                           �       sample_576_my                                                           �       sample_576_E                                                        �       sample_608_rho                                                          �       sample_608_mx                                                           �       sample_608_my                                                           �       sample_608_E                                                               sample_640_rho                                                                sample_640_mx                                                                 sample_640_my                                                                 sample_640_E                                                              sample_672_rho                                                         
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?��]�e7�?��PZ}�?Í���2?�Ɗ�	H4?��Z%� �?��'#�m?�r>�ҙ�?��5 ���@ GMX?�L@����zu@	j���g@�>ٛ=@U�,��@�~�E�@�CV��@�C���3@ e��n@"�W�Q�n@$�:Ѯ�=@':x���@)��%`@,t(���F@/D���Y�@1���f	@2��^ȥ�@4CV�~��@5���Ø@7�Pɑ��@9��"j�@;b�`�/:@=Va��3@?Z��Ϯ�@@�/�#@A˱M�@B���G�@D��K@E9˃q@Fo�6��@G�'Oٮr@H�<X���@JD���I@K�I�6��@L�Neep@Nh��7@O�r�7��@P�τ��@Qlȷ�3�@R3)]A}�@R����XO@S�5����@T����@Uy!�M��@VU�nz6@W7Ö��@X�h ��@YZ!�:@Y�[��k�@Z��Ӳ��@[�4�� �@\��
�S@]��:�rV@^�ׇ�V @_��#3�
        ?d��[<��?�	5����?�9�o��C?���9e��?�x<� bj?І�2/�?�ò:���?��1X�^?��Ü��?��/��?�?���?�n ��2?�Y`E�P@ȑr�@����B�@
�k��^@}�ʄ.F@@>�*��@��=��@�ٚ��@ پ�� @�)c^�~@!OJ��@#��Ը|@%+���@'dL�p]�@)��)O5@,</�>�@.����/@0���NJ�@2E�=z@3�_�p��@5h#6��@7bE�@8�s?^3>@:��p Y=@<�U�oje@>��
��z@@V���@Ak�?|�@B�VuA˙@C�O�A�@D����&@F-����@Gy�C)G�@HѼ`��Q@J5�G�R�@K��k��@M �a�A@N��dp�@Pϡ�Q�@P���ld@QÞ�`@R��埗�@S�	�q@Tj���@UYZ	�{@VNqM��@WI�"�\
@XK�>��@YS�\x�}@Zb��@[wܶ�ة        ?h�o��+�?� ��?�}�Q;�J?�ʹ��6?�O4�HM?Ԏ؈rHC?���۠?����tB?���7�?���?�,�G	\?��qR/p@p���g@�����m@0��`�
@�x��8<@�{����@���!=@��Y�@��2޾R@ ��ɂ@#B��R@%Z�����@'���Z��@*~.���@-QQsWy�@0(�IJV�@1�1�|f�@3l��F�|@525��@7����m@9��T��@;^f&�`@=7k�i`b@?vn�#-s@@�V��@B 7}���@Ce�˶EB@D��_mS�@F��ޗ\@G���M�i@I $���@J��mz�)@LM �*�@M�J=�#0@Oq0�$@P���)��@Q~�
�K@Rkq��m@S_��V1�@T[�Q���@U^��?8u@Vi	H��!@Wz���@X�^���C@Y����D@Z�o��'@\>�@]H�E��@^���sm�@_��Z�@`��"�@a>u�~n�        ?�I��+�r?�<Gѯ`�@ Z�Ѝ@FN�0d�@�5-�Y@%e��?{@.�)0�T@4�U�j;�@:��X}��@A�����@E���\@I�l�k@N_oܼ�@Qז��@T�����@Wϳ����@[�7���@^�x� �e@a4����@c0�����@eIy�3�?@g~���@i��8?y@l<��m@n�| g5�@p����@r�o}�@s�5��n@uҍ�~@v�����2@x)�?��@y��# A�@{�P ���@}L����@��d@��^��h�@�x�8d8@�v���@�|�kRT�@���)hJ�@��5�%E?@��ʩ�F@�ܦy@�уRn�@�8WAl:@�qA��8@���TjR@��n���\@�H�ڴ�X@�O�}��@������@���k(�@�h��eHe@�#���F�@��<���@�������@�j��@�5���t@�*L~�@������@��ܿ70�@���Q̋=@�bmdEp�        ?Y�k~;�?�>��Z?�����?�� �URc?��s�k?�C��wu?�.:�a��?� T+6?�ѰC��?�!Zz�u�?�;��)?��HU?�L����y?�n�5X�w?�� �@�nD���@���Ves@OHɓ7f@
KFkb,@w\5@i]!C)@/T���M@| ���@�?�p�@y<���@9O�΃G@xg���@���7�@ ����r@!���)8�@#4�ܿ�@$�p*�Xr@%���i@'p���!@(��#�@*�(k�V�@,~���h@-ȿE��@/~�QD$@0�lh�@1�Dx�0�@2w�,>��@3m��J@4h���6b@5j��S�@6r�܁�y@7�hbNi�@8�1Y��@9�'~� @:�=�w/�@;�iG'@=&���@>Y�|sv�@?���@@i&n���@A���P@A�X�J@BY��E�@C��ќO@C��֒@De����@EP_Q�=@E��U e        ?G�iKg�?v�7khi?���]��?��A���?�?�($r?�$��$:?�p�ύ?��Vr���?�y�_��&?��0e.� ?�L���J?��+�ˉ�?�A�\c�?�J;����@ ��Do@A=�6�@�3��&@
�Q�@aqЛc0@$|���@ѿY�$�@��3o�@�q_��@M\��/�@ �RH�}@"�!��X�@%�#�h@'N�K��@)�1&��@,;�I$�@.�:5�XC@0��F@2b.�ͩ@3�՗�X�@5�i`'��@7_I�Z@93�Z�h @;_�ͦ�@=E�s�@?6�(�x�@@��?�@Aզ�ۥ\@Cd�3�@D? C-�@E��4�?�@F��	C�@H81(n�{@I���to@KHj�m�@L�7�3?@N2�q2@O�:�@P�4�!�}@Q�9A��K@R|���@Se��-�i@TT��<@UJ�\�@VG4"1@WJ�^�^@XSj�?)d@YcJ�9�@Zy�!>         ?CJ����B?o�j�ۇ8?�����?��EE�"?�~�s�fq?�_]6��?�ѹ�!�?�S���7B?�Hk�,Y?���k���?�D��"Y?���kc�?�g~z3?�֢dO�h?�˱�X3@ 6�5��@a�&��m@��b�@
�$�P��@,��	s"@��V��@��â��@ZoJ@��@c����@�t5� @ �hE��D@"v����@$v��@&����@(��Y�ԗ@+?j���d@-�i��5@08*1\{@1���8��@3s_"@4�Aw>�R@6?|أ�W@7�a�X�@9�,Ǖ�H@;���@=qd&կ@@?nF�l�8@@�}��}�@A�޹kp%@B�cAW�@D(�V�@EFL�F@F��U�*�@G� /mݡ@I	�PuI@Jt��@K�gU�E�@MM6��@N���D�@P(���@P�9}�@Q��m�@R���z�@Sr�#B�@TR�]a@U9k`�C�@V%��K��@Wl��|        ?��i���?��A�ٰ?��i
�u?��'l�@_?��U�u�l@�)�}��@g$��@)/D3�3@)�C|�=@"z�P�@&�u�f��@+�P���@0���O�y@3��W�!@7mK���@:��	k�@>��Z;@AVH3�;x@C�*^�{�@E���tq@HZc���@J��=�@M��F�@PM1����@Q�{3AW@Se_���N@U�� @V������@X����m@Zi�F�V@\V/^^A@^U:��B�@`3 O�pE@aD�`e��@b_P�c@c�	�l;@d�	�*l0@e�2a��@g%��*b�@hn?�%�@i�(�`w5@kO܃`@l�Y��g@m��'@oc�p���@pq��=�2@q5�sOɚ@q�V�=I�@r�N��7>@s��1�=�@tr0�I*�@uL
I�d9@v* ����@wpn���@w���(h�@xݯs��@y̜��~A@z�����@{�	l��@|������@}�W��i!@~�I��@�oW"+        ?lYZ�v?��o<�?�C�^�x�?¨c��ϯ?ПD�wP?�C&�.Q?�#r�z�?�Ww��Jt?�_�!+?�?�.2��u?��4��Z@ �B��5@!
G��`@���+.+@�Jg<�@�;u�@A}ZA�@����E�@J���@m��p@��H�&@ /@1(@!�<�c;�@#Q��?@%!:��@&��|$�@(߂�TX�@*�^�@,�X��@/&�j�O�@0��W��@1��z@3X��I@4S�z�7@5�N��@6���ޕ@8N�I*=�@9�r� �@;(Ct`+�@<�0�p@>)�~~�L@?�����@@���+�@A{�Ls�p@BRN��,@C-�q^�@D�+�̙@D������@E�:��@F�A'1}@G�~)��@H�|V];@I�����C@J�o�|p@K���h}@L���>��@Mٲ64K�@N�	6s��@P�J��@P�J����@Q#e����@Q�ѓ�;@RL���pC        ?^��&5Y�?�j�`j�?��qEse?���&}d?ķ'�$?��-U<~?�7O�R�?�[��N5?� ��#�?�z:J$O?� X?a�?�"�)s�s?��ż@�@�䉌_�@DQR|�@
Dq���@��슙�@�,/�V@a>!�DU@;�l;@O2 K�X@�Jѱ�@ � yI��@"|����@$�E�=�y@&�\�m�J@(�"󐢀@+]Tg:��@-�\��F@0N��1�@1�<AL�@38%��1�@4��o>V@6l��`�@8$�U�h�@9����N�@;�,:��@=·���@?ʭZ�&I@@��#��@BNTu�~@C/y
$v}@D]5���@E�����@Fز��@H&���;�@IO�C��@J���%��@LQ���f@M�+vR�@OO�n�(&@Po����@Q=A���l@RD�O�@R�ٯ���@S���@T�����@U�[�̰@V�����@WwQ>�@XqJ�C�@Yp��Y´@ZuӀb9�        ?c&^���?��;(2"?��Mý�?���[���?ǈa~\�?�+���P\?�ђ�0��?�sW�=�?���=6e�?�D��c0;?�a!z�"j?�El�ɀ%@�z;x�@ǐ���0@
9wZ��@��u�"@��V @������@��v�@Jٳ(�@���-�@!pj��<@#���zѾ@%�A�騤@(<5#W
�@*ψ�t,C@-�HR�Ԣ@09��~o�@1� *��#@3b�֍l�@5�ĭ&�@6�ZNw��@8�*�\�@:�ʟ�2*@<ܖlX��@?	�{�yV@@���-�@A����@Cm�{:�@D^<[V@E�ţ�GF@GۢVЕ@H�mR�@J	�3��t@K����a'@M1l1t�A@N�I��@PH����@Q+K�!mt@R#�3c�@S<��N$@S��0���@T�]��;@Vw)5�@W�%i2v@X)ک�6�@YG.��F�@Zk�nO�@[�'ݦM@\�ЩY�@^��	&@_I��\�@`I�;�3        ?��� BdJ?״ͪSC�?�
����@g��3�@2�x�@���y4@#��AD�y@*�
���*@1�+�LB�@6�Tc�F�@;��7Di�@A>Zx��@DR�~sb�@G�bJ��@K�ן�F�@P����@RS�F8@T��/G4B@WS��1�@Z'��8�@\�	B���@_�9��	3@a������@cB��!�@e}T ��@f�X,eb@h�v]Q��@j�Ֆ+�!@l�p��@n�5Դ�@p��X��@q�ۧ��@r����p@t_Í�@uL�$\�n@v����f�@w�KO�'�@y?.��b@z�/NPF�@|M��l�@}����z@߷�1s@�D�h'�@��,��@�٪�B�@���J�@����N8@�Z���@�9��@��\��@����@�틪���@�܊e1n�@�ψtE�@��zO���@��S�~:�@��
F�@�2.�@���3�f/@��.�q@�p}��.�@��V�pz�@��ޓ�
        ?]{�E�9�?��=�d{j?�z�����?�`�%��?�Iq�%'?�ʉ�#��?֢��l�?�_�]8O6?���HX?굤�N h?���Rk?�h-�I�G?����7��?�����@ ��x�@�9�*��@z�KW�;@	�/1&�@��z�]@#��Ի@�T�+|W@���W�@�n�#�.@CVؓ@XI�v��@�����e@$�GY@ �S��c@"-FFҢ@#�P�ݰ�@$�pY��b@&w�~�@'��R'�@)���:K@+7a�-x@,� �3Z@.��O��m@05���@1 �WJ@2b�ѥG@3
'�T5�@4=ݡH@5��!T=@6 Cv��@7'�+��@8>q�=�@9[��޳@:}|7��@;���5O(@<ӆ}��5@>����@??�ͮ�@@?)��9@@�Ht��@A����g�@B,��R��@B���@C�l�0-�@D2��l
a@D�O<�~�@E��h�.]@FOh1��@G��а�        ?IP�Q�M?wt"�!s?���t�k?��+^�p?����]LZ?°���[?�5ͬFs?�z�F"�$?�*�x9"?�m��?��0�q��?�>+3u��?��K�lO?�Ϣ'&k@ S8T�"@�K�)��@P�|��@lB]��%@�j�y/@y1?Sd@2�����@)3{Ƀ@^˳�R-@�%Od+5@!F���@#EV�Ãs@%fu���@'�q��@*�Ny@,��k6@/S�Z?�#@1�n�@2��r�@4(^�V��@5��q��@7�bqZ��@9W���d@;:��3i@=2N�ל�@?>pT�D@@����@A��atʱ@B�o�7�@D �;���@E\����@F�Dװ�@G�|6� _@IO��k�l@J�Q8�@L*���@M�J���@O1y�&�y@PcܿS�@Q3/츝�@R��~�^@R�z��~�@SŸ�v�@T��s)y�@U�~�u@V����@W�y��39@X���m5@Y��G��x        ?H7�˃t�?t7�Y��?�u_�I�A?� a
�^=?�_	�A;?�E����?�~Hԁ�?�����7?�g�A�E?�;��״�?�m2�6�?�'��}�Y?�W��
�?��
9��?������0@ �Zϳ9@��oQ�@��@
�^�b@|���R@��"KX�@:�@H�@݈�c"�@�a��@�{G��w@��'#>n@!����/�@#����D�@%x�=��@'�,lAh@)�I� �@+��#"@.J;GMX�@0b���&@1��C;y�@3	=u�{@4rT^���@5�E�I�@7p����@9�P�_@:�(xRs@<]_��e�@>��I�%@?�r�@@�����'@A��i7R\@B�r��@C��^ �@D��ѵ��@F�p�o@G,d�Z�K@HRѵ(zD@I���9(@J�`1@K�Ƈؐ�@M:H-�Wo@N�����@O�y�V�g@P���	_y@QN�ju)@R�wD@R��O���@S|:~!�        ?����f]?Í���X�?�~D�ZZ	?�3�?��N:^�@�y(^N�@���s�@4��h@ t�-��@$�n���q@)�ќC@/0Fީ,�@2��3
Ě@6��k��@9�l�}��@=�.��.@A&t�H�@CL���
>@E��p �@HP��<@K
B�?l@M�$7�)q@Pw�Z�w�@Rg�Xa@S���[�p@Up�4q�@W>���aZ@Y�=;�l@[Q��"@]�?�Z�@_2�}�@`�6[��F@a�_(ZZ@b�̃�kk@d(v&��R@ecS���^@f�\��x@g���bd@iJĚ��T@j���l�@l:DW; @m�Iڴ>S@n��G"@p?ƴL�H@q>�n�@q���DX;@r��
 �@sn\u�5�@tDڸ�@u�J�R�@u��u;@v��q��@w��/�Ǐ@x�z���@y���|�@z�d$Ϛs@{x��e��@|o�\0-{@}i���(}@~g��	��@i���q@�6��b2=@����'�E        ?rZڗ;h?�LG���?��*(?Ȇ�;G�?էW��7?������U?�s-R�?�ڄ�"�?�#����?�)����@v�ݵ|�@8��q��@	Z����L@���@a�s�@g��_r@ک�j �@៥�(�@Vq�@ B���P�@"X�8�G@#�+��@%�DBr�e@(����:@*Ht�D@,��:,�x@.�DBb�@0�A<���@2?7��@3e1.5��@4�0��k`@6@^wIUI@7��s�Lb@9P����@:��=4x@<�Q�m�N@>Q&Vg@@�!�p@@�`~-�`@A�݃���@B�S����@C߶��@D��'Zr@E����9�@G� ���@H!9�|��@IBL;�L�@Ji��e�@K�j�0�@Ḷ����@N�Y�Q�@OH��:=W@PH5j���@P���X@Q�(SEP@RFRƩ��@R����h)@S����@T`���@U.*�F@U����)@V�����x@WYm�̎�        ?a�L���?�7�1ԥ�?�%kK<z�?�d���?�S�qU3�?՚-���?�S7�}m?�D���m?ｪ���?��l���]?���:@ �����@ǃ�P4@	6܄(�@0X�^�I@�����@�YaW@K���@��{�@���Ի@")ݳ��@$����@'fs@)�_^�@,�v��D@/��'*@1v���-�@303��a@5�y�!�@6��4��@8��4�@;�ĊC�@=M{?і�@?��Β�@A�b��C@BM�Q���@C�ɒ�@E�p�h@FpI �g�@G��`H@Ix.~��@K�	[{�@L��%><@NpQ��'X@P�ea�\@Q([M*s@Q����ѯ@R�\�Ȁ�@S�q�$u @T�?��S@V
ԛ���@W#<��S;@XC��'{)@Yk���96@Z�����D@[�@EDш@]�N�:�@^]?jo �@_��� @`���K��@a4W��ȇ@a�E[��@b�f��C�        ?YޕZӷ?�Ő@��?�qԉ�?���jƛ?�S�n�:?̵��GE?���>r�?ߩw5�?��*��k?�1�W� �?��"�_;r?�� M�?��2�2�@_Z���@4C�T��@
�Vg�1@OWWI�@P]� Dh@=˻VGP@rQd%n�@�"�I��@�T>1��@!�����@$Ѡ�/!@&v9�^�@(�g�K@+�4�i@.�� �@0��ϡg@2]���@@4��Պ@5�:�$=h@7�!�`@9�p.���@;��`;l�@=���j��@@�4�.y@A6�Je��@Bn8耭Z@C�G�y�@E�l�@F_�͐9�@G�d� @�@I?�`;�@J�2�Dnv@LSRK��@M�I�0@O�E�-�@P�k"���@Q�9����@Rr~H[�@Sa;�@�@TVv@\��@UR0�e�Z@VTo_��@W]6����@Xl�F�EW@Y�r���o@Z��}�g@[���k%@\�ѹ�@^?�x��@_Sb/VQ        ?����5?ك_�?�>�)@�¨#�@��YFVc@~�u3��@%n'S��g@-h���@3WX�v��@8�R��Y�@>��P,@B�M&��s@F2�뾞A@J'}f�@Np�li��@Q������@T�m��@V��\b3�@Yz�?@�@\x�)�A@_�����Y@a|�ޤT@c>��چ�@eԱ<�u@gl�9�[@i
s-?'�@k%���y@mW��G��@o�����K@p��6k@r;�衂@s���x;@t�����l@v1�R<,@w�q�n^�@y��P9@z��ܷ�G@| aX~�@}�uS�@_���O@������G@�g*��a@�K�a�5.@�5���*@�%���`	@�;�@��Р@��8=�@���W�@�(D	&��@�9 	���@�OM� �@�j��,��@��{��f@��ok��@�ܞlk��@���nt@�!RG��@������@�^�\��@�Fj%st@��c���@�NQ�P�        ?j����?��:G1?�`9�<QK?�v
_
Tj?���p�?�j��H;i?�=}3V;�?�/]�7�?�f���S�?�$+Y��1?��o��?���l��@ }p�R�@x�M�m@��|N�@
4����b@�*���w@�	5�@ ak!�@e9�>o@˭&'߱@Sհ��@����@ɔ��P@![���}@"�O�aê@${Ԏ���@&%�h��@'���1@)���YW@+��J�l@-o�A±�@/k��'�7@0��d��+@1��Ţ�@2�+}�@3�E���9@5$m�FVP@6R��Ǒ�@7���' m@8�j˥_�@:}z��@;YY��Q8@<�6��3w@>
���X@?nR��g@@ll�d@A%JFI@A�i�u@B�1��-�@Cd�>S@D*Q�u�@D���}ך@E�x�X��@F�j�9@Gc��
@H:<�53@I��K��@I�]�<l@J���hP2@K�w���@L�DFľ�@M�[(��        ?Q��Q���?{k�� �?��]�?�n ?��A�Io�?�%�!��?�U��<=?����F�g?�����?忸�ø�?��5Ú?�T��@��?�2s���?��j��m@^	ߥ�0@���i-�@�x�
@?��H�@:8r @�($M@�JД# @��r�@\Ah0g@ ���]10@"�!jo�@@$�z���@'��o*�@)��6���@,.A�H�@.�n�7}�@0��HsQ@2�kt���@40[�u^@5���4�o@7��=�@9�VQ�D�@;�`$$�_@=�o7K��@?��2/6@A%����6@BX^'��@C��D��o@D�x��v@F>+:Ҩ�@G�1>g@I�k�m@J����<@L+��w
*@M�}�[�@OuHI夦@P��5�a]@Q{��U)�@Rf��xX�@SYY��@TSM���@UTP�B�@V\`�e`@Wl �V�@X�.nӟ(@Y��4���@Zǹ�h@[�8*ݢ�@]*<}�R/        ?f@)��:�?���b4?�O@�_�?�3Ǉ��?��.��)m?Ѧ~n�q?�O(~�Di?∸0��g?����o?�\��:3.?��b�jG?���K�#?�Ȧ��n�@(�␎N@��;K�@
Ы��z@9��ͨ@��<�,@�u'��@s��J}@|��Ɖ�@��?т�@ ���u@"u��ԉ�@$l�JHr@&���g@(�_�ݕ@+�T;k�@-w薒@0#���j@1\5����@2�TQ�@4<�Ӎ�Q@5�N�j\@7^l��EO@9AmDg@:<���@<��0tZ�@>i�#�@@+j�*y�@A*���r@B2T�3�@CBۈ�¬@D\6��@E~~Q[�@F��BS�@G�8I���@I��D@Jb�s��)@K�o�_7�@M�:pt@NqEc��@O޲��4@P����@QkYh�<@R0�g!�=@R�ʖ�Y�@S��(��z@T����W�@Uv=9:%X@VS�{&:@W5ϣK��@X�^�        ?�Z�A�Q�?�����?�;���, ?������@��$-w�@�	�:�|@ts\�U�@"���M@(�m�&>@/��4R�e@3����@7�0X�հ@<�u�dJ�@@��( i|@C�}�8�@F�2�@I���+�@Mf�F�e@P�8��9@R{B�)�@T����W@V�88���@X�%-uE�@[^T����@]ݲc��Y@`<�`��W@a�/�ҡ3@c��H�.@dx�P>�@e�����@g����@i/қ��@j��E��@l�Z2-�l@n^���m�@p�>��!@q
���}@r"\�"@s 	�e�v@tg/�_�@u1!#@v Z/f��@w7���@xU~_�D	@yyK��l@z�.N�y@{�ϧ!��@}F�	�@~C_��_b@�����@�e�t�@�
���\m@��,�i�o@�^F61��@�jB"@����6�#@�o��J�@�%���r@��ftȩ@��Qr?�@�WJln�@��z^r�@��j��1�        ?ik�F_ ?���s:�?�o�L9�?��Opfi(?͕tI��?�t3�0?�"�?��?�2��Jq?�69�\�?��E*?��Y��5]?�D&�y�@ �,+]@fC�8�@����@�D�,O�@q�92+f@���TD@������@v ��q@T��wM@�ת�@���d*�@!k�l`@#���~_@$�3�d@&v�{�@(KB,��@*35��?�@,.�=�u�@.=TZ���@0/�1؛O@1J��C@2o�6���@3�b}�A@4�}�F��@6��׼�@7d���I�@8���#�)@:~�"e�@;��W�@<�n��=�@>t��c�S@?�}�.��@@�.�>@A�1Ś�@Be!����@C;�4o�@DD���@D�d4�n@E�)���@Fŋs�M�@G��:ݕ@H���L�@I���@J�����|@K��6��@L����@M�PP��=@N�R���0@O�ܲ�)g@PosA�8@P�4���        ?U�����?��%�5?����G��?�в�/?�����j?ͪ[�1��?֘K�$�?�2ϩ�.z?�3���r\?�c6*/G)?��5ڐ��?�МD�.�?�kx饩.@��,�~@s����@	k��lM�@���|X�@R ��^@����K@�(ɹ�
@�]2���@HC��@ pi IƑ@"\���5@$iۡg��@&�;0�p@(�aǵ3$@+Z���zM@-��`Ub�@0TRG�{@1�� �@3A��@4ӣ�"r@6w��ᢰ@8.R���M@9�THe�<@;��r{�@=�$�@?�b�@@���$��@A�C�-�@Cq��-@DA^����@Eq7<Yr�@F�����@G��o�]O@I:D򟑔@J��� 2�@K����@MZI�W�H@N�̅��@P%�lD�h@P�1 N��@Q�ʜ�-_@Rh���@SR���w@T)��Ԟ�@U�
��"@U���=/�@V�#J1�@W����m*@X��gRE�@Y�� �        ?Yz�B~5?�ܯ	�D�?����KQ&?��JӇ2 ?��CRgP5?����6ɂ?�f�g��A?���،*?�R���tA?�k�n;�?�k!s�f?�T��y?��y:j1p@����@W�gc!�@	g9mJ�@���@qi(�5�@+�m5^@%BP�5W@`N4ƒ�@����@ ��=��!@"�}��2k@$�1s��@'K�L��@)�T|~ɬ@,W���^@/Z��4�@0�_�Lʰ@2�]��%�@4 b �mA@5ϡW�W@7�I�3�i@9k���@;Xpe�~@=Z,�-:�@?p�ی�4@@�3.�@A�bmc�@CV��p�@DN�7�@E��-;0�@F���<@H.���p@I����=@J��B���@Lk�lʿ@M�ݮ,j@Ot %��@P�����z@QR�x��@R&�2��@S A�$F@S޲q,Y�@T�LV�7�@U�!�&�@V����+@W�#v��@X�t,I֣@Y����e@Z���d�@[��5ߑ�        ?����}�f?�E
��Z?�SC��ȟ?��д���@�)�0�@%(T��@ 2�9�~@&V�F��@-}�//�+@2��&�`@7j	�HC@<���u��@AE!�xI@D��(��@Gi$դ@J��1���@N�V4�o@Qn��M�.@S��\��@U�.���@XT!���@Z��Єz@]�rKtM�@`4�y�@a�{���^@c;��v>@d��3琍@f�V89��@hG��7e@j35��8@k��`�E,@m�o��Ǧ@o���]@q*��y@r:�#`�@s6N�W�@t[�Jm�@u��ez�@v���t�@x ����@yH�J�g�@z�$>|�"@{����@}V���\@~��.,@��c�"V@���Tn�@��"�\z#@�a�{-a@�,<�d�@���"�@�ͳ����@���)�@�S�e�@�^1t[�@�A �h��@�()kYse@�M��5@��/�2�@��ה��@��0=��@��R5�@�����(y        ?y���@?�aY,��?��¶��.?�٬y���?�EE�`��?�nr�21?���s6?�W�c�i[?���fh�@�f�6�@3���K�@ �6r�x@$��""�@��-�@'Ȏ�t�@��X��@'R�Vb�@ �����@"�h�Ӄ@$�1�ξ�@'gs2��@)�Tm��@,%4m=�@.�9�OE�@0�����@2[����\@3��Q,/5@5��x��@7A���@9��J�D@:ޢm�_@<��tRm�@>Ū4'�@@jc���?@A{,zw@B�:'��@C���Ս@D�H��=�@FZ�#��@GZ�aG��@H����;@I���Q`�@KQ�g�r�@L��>"�h@N%;%��@O�ܴ:�@P�&��~t@QTq`��@Rj�)�@R���>.@S�jR䲑@T�s�kt�@Uu2G.��@VV���@W<�EMVI@X'ν�[@Y��o�Y@Z�DA@[]��>@\���@]u��L@^>�:�@_�h)��        ?^|��$�?���)T�?�Wl��\?���C��H?��n:��?����z��?ُg�;߼?�/�a�\?��ï5!Q?�W�%8�y?������?�W����L@ <�X@���0UT@�JK��@��s��@]~` ��@���D1�@�-湟�@f"�X�@hl�x�@ 		m��@"��@$��@&]��Y-�@(�l����@+QWYdH@.nN��@0p����@1��&q�g@3��zX՗@55�^�bY@6��W+�:@8�W(��@:��Y$Y@<�q?i>@>Ճ���@@����T3@A��ʫJ@B���ì�@DH����@EUiC�+@F�?觚�@H� �'�@In=����@J�~����@Ld�4ou�@M����@O�Rj=m@P�'�J@Qp⯩l�@RO�C�z@S4��&@T���@U�E��@V��I�@WA3f�@X

?�@Y(�sI@Z$gB���@[:�bu#�@\WuXo �@]zC��        ?nI�K�ч?���e�Y�?��kܷ}?�{�K�Gp?��e��M?�j��?䂴~  ?��:�]4�?�`��Kg?���G��@ V�03�@a���B]@�\�E@&F��@�<[WJ@(��5@��jnD@�\o���@ `����5@"����@%#'v�@'�n���d@*�%�@-�� ��@0�OP�c@2=�+ͭ�@4��X�@6-���@8 �#7��@:R̒�~@<�a�O��@?M��Ii@@ԒƎ@B.�,��@C���
�@E��z�@F�B��r@HA�`m*@I�*仳.@K�RFL�@M�p�@@On��U�@P����z@Q�5��@Rǭφ�@Sߡ��� @U ��`}@V+��K�l@W_ؐ
e@X��Gכ�@Y��f�V@[5٩��!@\������@]���_3�@_c�ڇ@`m�a�]�@a.p�~b�@a�H|,�J@b��@�8@c���K�@dc��pM@e=I�h��@f�^n�        ?�_��FDC?�#��h�#?�uV��@��Xذ@�E�&�@$�w߁�@-+���@3� ����@:CJY���@@�g��w@D�<k�@I*;OoO�@Nc��p@Q�*u���@T��b�g�@W��O�?�@[���@^�Tw��@a:���@cBs4y"�@ei�#�Ts@g� zm_j@jB�P��@l��]b{@oG�q5u�@qC�^"�@r}��d@tV�:ˉ@u�����@w?�ɀ��@x�r��%�@z��V�@|�@~����@�D���M@�L�y4�@�]�<!��@�wK�1�~@���*P3�@�ń�c
�@��ס��@�7�P�#@�~R��go@���Q�@�&�X�@��/��Df@���C�v@�3��u�@��Oy��9@���:p@�{tQ��@�F�u�@@��Q^�<@�� P@$�@��{t�@���{�f@��g��r@�i�Y��
@�T����@�C��^�@�7�ɖC@�/�璾~@�,vLt�0        ?y{���?��;F*�(?�|�5d��?ͪ3#�<%?ٸ~�{��?��o��?얷�a�?�p
Sa?�b� 'hg@ ����Y@� � 2i@Blàa@���kL@Ŷ�-?@r_;g�@Pn�Y@_��0�@��!�S�@ %�!��@!ػ$��@#�zz���@%�Q����@'�/a�@*�w�@,T��t�@.�A����@0�ˋ�z_@1��a���@32�7}Ѽ@4����@5�:rs�w@7u�<[�o@8��O]�@:�(3�@<"�"M@=�_!@�@?{[�7Xo@@�k���[@A�ߚ��?@Bk�s�@CZ���]@DP8:�
�@EKAuuEu@FK�s7�!@GR�5_@H]�=��@In�	(�@J�i�}gz@K�J��yw@L�vx���@M����}@O����@P"���@P��6`5�@Q[-T~�@Q�F����@R��1�}�@SC�:x@S���+Ӕ@T�����@UA�^�U�@U�,I@@V������        ?V����?��h=���?�<�QV��?����3?�;�%���?ʳ�#y?�A�T0KL?��5�?�੐���?�T��J�P?��#|�T?�b4�n�?�pg޷��@ ����@L�*�C@�*��z@
�B%h�D@/�E@@�#-cs@�c�@U�t:=)@V�f�*@��C+�T@ ��~�1!@"X��I>�@$M�O�.@&`߬-E�@(��ۍ��@*䀍2Q@-U٪�[@/�y�Js5@1L�Hi4@2���8�-@41�1[�@5�P&�0B@7X���ץ@9� a�@:��>��@<��^[�P@>v&�a\I@@4sy)�T@A6�(@BAJ"/&4@CT�����@Dp��@E�����6@F�-�b�@G�G��@I7�9��@J�P\@K��y��\@M'�<�S@N��ͩ��@O���7@P������@QpY(��[@R2sA�
`@R����V@S��Y��@T�JY�8@Ug0��h@V?` ߪ@W}�         ?e�[�~�0?�L�$�?�Y���:?�N��V�n?Ǿ��k�?�(�d�?ܩ��3j?�M]y��m?뚐f��?�,��?�P�'���?�G�����@���"�@��۵c�@
J%���Q@%r���;@B���@7���o�@s�?�`�@��#�C�@��dw�_@!��0� @$'ʙ/�@&�ʋ�-�@)
?�t�C@+��,1@.��D<\@0ɮ����@2`6�i2�@4OU2�<@5�.�a�@7���@9���z��@;�7I��:@=��4�5�@?��۟�A@A��*@BE�%�@C��藉@DŐ�3@F��W@Gsܠ}@H�J��_G@JPS��E[@K���2@M[yѷ@N��i1@PJ���]@Q"wF>@R  Kh�@R�$���@S�,|@�@T�ؓ�%9@U��G��@V�qs	-�@W�d �K�@X�t/�e@YƤBv?�@Z����/;@[�m�]�@]
�#I@^<�{��@_i����m        ?��5\�G?�TLn�vS?��xCkp@�����@�T�:X@@ (2,�<@'2Q�9�@/�#��\@4�8&|C@:
)����@@8�S�@Cn|<�e�@G9���@K�y�֞@Of`N�n@R W7�9�@Tt|���`@WC�V�@YЂ;8��@\��}�m@_��6b@a|�x� @c*�FM�@d�>�#�@f��0z�l@h���ki�@j�w����@l�-9�?@n��6�@p~�M��<@q��j3P�@rΗ �@tY��@uE'�αM@v��E2	�@w�M��@y?S���6@z��Rs��@|7)XՀ@}�
���@m�w�@�P,|�i�@�b�ê@��T$���@���M]_}@��KŔ�@�w=on�k@�Y�
�&�@�@Ϻ��@�,V�U�~@�LH�w�@����'@�	Y�QH@�aTl�@���r�9@�Q��<%@�1����@�%Q0��@�֌�:�@��!$9�d@�4�予@��j���@�U�}I�        ?e6��|ע?��z��K?��"P?�Zy�%��?�i�xh�?�(��U�?�t��i��?�K�j�i?��'.wN~?�L__�?�>�I-�?��m�7	e?��$$� @6���n_@2);�s@g0 -�@վ����@}����7@��C��@��W z@�t�+ř@,�t3T@�!Y34e@����@�^��@!0+��|�@"�٥n��@$��4@%�%�(�@'*��V��@(��w[�I@*z��T�@,7z9�`�@.�1LY�@/ْ J�@0�oҝ��@1����/@2������@3����@4�gj���@6�2��@7��n\C@8>���@9g��]��@:�Hku�@;͘M1��@=
���l@>No�!s�@?��n�T@@uG�&J@A �_"��@A���G@B�~�T@C85
�N@C�1>S8�@D�om�2�@El����w@F/��y�<@F��<��@G��^~˰@H��B`f@IZyv,�@J,TLK��        ?Wj#�$?�l�] ��?�Z�_��?�g�۝��?�	�)���?�����4?��-��?��2Z��?�S�
5�?���Ǆ�?�Y�J<��?��M"Rh?��^��P&@ L���-�@�q{��@(��@�Й"�@r}�lw@�G���@�hrK�S@����@�S�/l�@�ϕ.�m@ ��Ň� @"�a+PT@$�,11or@&���-{�@(��;��@+Y��Ee@-�'Fn��@0F�K�/"@1��D�;W@3)Aq�NN@4�=x���@6V^{�_@8	%q�@9ϊ%��@;��j�k@=�X�+ډ@?�5;���@@׬��f@A��_�@C�ڃS@D6��{K@Ek�宸�@F��O�,�@G�5e˨J@IK�--�@J����d@Lu�&��@M����y�@O!��6>@PO�Q��h@Q�X�@Q��(�?@R��3�@S�����@T�bj�@Uq�B��@V`�Ķ(@WUi�@�@XO�%V�@YPRt�Q        ?S׆�h.�?~8�6���?����S*5?�C�h9Cw?��f�X*Z?�h��k��?�s�X�?���K XF?��3Ik�]?�Kh�l?�m�z�	?�G�.Z3?�Ι �s�?���2�&�@ ����7@=��z@�n���.@p�� @C��Н�@��D��)@l�t�@X�X-%�@��4���@�T���@!GԢ�1(@#<�Uy8@%Q��x�@'��|\�@)�S+��@,b�x`A@/T��~@0�l ���@2\�h@3�|���@5�a*��@73�bP`@8�T'�p4@:��k��@<����>H@>��J9�"@@k/�*�@A���Y�@B��G��@C�$�D�@E�k�)@FD�l�c@G�j3y�@H�,��@JLC��:�@K���u�@M4����@N�]� �]@P%�;rd5@P�G��5@QȦM{�	@R��H�@S�2��v@Tio��v<@UU�˱�n@VH�.�@W@k?�U_@X>�̡��@YC�i��a        ?��o���d?�m4��?��G(�?�޵i|$K@`9�0�G@��x@�@�/"޶@ �	^֕�@&a�Y�@,�(>�/�@1��O��@5}`�H�@9�2�Ω6@>-�4w�k@A���c@D'B����@F�Q:�@I�m��q@M�v�@P5gI^]�@Q�=�MA@S�t�~�)@U���&�@W���a��@Y؅R��A@\`��yP@^N ����@`T�o�)@a�`��:@bЪ��n�@d����@ew	#@f����'@hGm7��i@i���]�@k@�H@l���FII@nb��=��@pd��@p�_�nfy@q�T���@r�BW�D@ss'���@t\l!Δ@uI�W��[@v<����@w4B*��@x0�&Ob�@y2J�|D4@z8��Ɗ�@{C��[�@|Sp%�c>@}g�1�<�@~�t܆�@�����T@�`�%݆E@��2��u@����F@�!�w_�$@��#���@�X~2�>�@������ @���p�	        ?h�Ӥ̠?�����-�?�@�F��?������5?������?׻�4
!A?�en�^
?�7���?��v&�L�?�YZ�)Q?�[;-ZU?��i�!�@����@��/1�*@	����&@x¢�%@��Y�=�@O�X�@�GX"��@�j���@�@�7@�K��p1@ N	1�j�@!�ScTP@#���VG�@%=�	D��@'	ac<?6@(��'�(@*�<���@,�у �=@.��{�G)@0�ۊ077@1���"�@2�5��)B@4=�*�@5O4'� �@6�?@;	@7��`$2q@9D�D��@:��9��*@<,+~O�@=����<�@?�t�Hw@@Q��J_*@A���a�@A�� �@B��y3�@C�y���@Dx��=�0@E[e��[@FB��*6�@G/���@H���>o@I��X�w@J�J��@KףO&@L�R�Y0@M%cΥ@N(tՓ�@O:��݌#@P(�Gh-p@P��@�9�@QF��        ?U�B#/?���}��?��g3��?�*�%�'�?�/LI��?�kE�x�?�\��?�X?��]��?�KIPh(T?���Gu?������?�gc ��?���myv@:j����@"%���@}��>&�@(��8�@�k(��%@�,Qϟ|@��q R@N���4@@  ;An�|@!����?@$����@&b8� ?A@(�:��@+^�
r�!@.��� �@0|H�X�@29���@3�y�`V@5J���L@7�z�C@8�DJ��@:�7��4[@<���^��@? ��T��@@�D�!��@A�eyw@B����1@D3�@Ӆ@E�V�-@Fִ���@H:�u-�U@I��ԫb@K)�r��@L�D��!@NLAo��@O�šoT@P��%�N@Q�¤��@R��/�%@S�Y���X@T{�4�@Uv�X�@VyЕ�*F@W�踽n@X�<�]�@@Y�ۢq6�@Z��^Fh�@[�2D�P@]$�g@^Z_Hh1        ?Y�c�?�����<?�?"ǪCU?�G	���?�`:�Z?�à�Ġ�?��g�C|?���SdA?�jc� f?���2C?��q���?��;�H~?���Ε�?�T��.^T@<*���@�/��v@	t�=
�@��psi�@�O�i@��t4ߠ@IOEH@2şzS_@T���Q@���Pg@!��шI@#��p]i@%����@'�5.G7�@*G�N`@,t�hU�@.�6��U�@0ՀM�6�@2<L�c9)@3�8X�@5=y<>`9@6�F�d�B@8���/iI@:CkQ�w�@<4�B8f@=�rY��@?�k0���@@�9KS�@B	lk{w?@C!nDX,A@DCT+�@Eo+��j%@F� �i-@G�پ��i@I.�~$T@J�ʂ�.�@K���A�m@MIpޘ^�@N�0z�Ѻ@P�t��@P�k8'2K@Q�o��@Rw��{��@SK`Ug/�@T$a�D.�@U���:X@U�8�Yq@V��7*�@W��/&��        ?��imxs?���Kg>?��韄l$?�q߮��@	�&,!�@W�����@Ɂ	�?@$�͗s�a@+,�n
�@1]�ЉP@5��(��@:Y�����@?�K�<~@B�Wk��B@E�J|�E @I�w�:@L��E�:@P:�[�@RD���:@Tn/ni�X@V����*@Y �NK�@[��g!�@^RJg
@`�_��P-@b�+�{@c�����@e���@f�>y~ܕ@hr�zo �@j7[)J�@l6����@m�O6��@o�I��[@p�$��@r5p�@s5JS'@t/u�]�@uR�����@v~Z��G@w�䰔Ě@x�^�xiS@z0��!w�@{{�qh�@|Ή$���@~)
��@�@ >/@@�z���M~@�3Z>��@���L7oF@��R����@�t{���r@�<l.��7@�(:k��@�׵F���@��Y�D@��Y�s@�]zw�D�@�<}���@�eVMw@�2���@���	�u�@��z2�`�        ?qiXz�;?���!S?�u��3�?é� �?�a��d��?�S�~*]?��8���_?�5a{�?������?��@�d�0?�83b9w@!�r��K@q|w@��.��@���O�@&Y�@D��u I@�H����@֠�@�UhO@�X�Ȇ�@o'���<@!=�xn0b@"�#u��@$�/!᪸@&<b��ܔ@(
��C;@)���G2n@+�mv'^�@-��6�m@/�v\p�@1����@2-��q#@3T¨F@4�X��%�@5��2R�-@6��#�-&@8GG:&�J@9�����S@:�*r`.@<\��u�@=�`s�oG@?C�"$D@@a�?u]Q@A&���M�@A���66=@B��9P*@C����}C@Df,���@E@�(@F �d��@Gox���@G�)ݖ0@H�30�j�@IǎB���@J�:�ϧb@K�9�y�Q@L���Ð�@M�0���@N�(�{@O�p���I@Pi��`�@P����        ?Zc�9��.?�����?�9��w�?�!r�̹?�����|�?��Cfl?��L+�?�~���n?�|J��?쉐k/�5?�aKڊ��?�'R���?��V���@j�g(@�H�ӝk@��"0!@���Y@�Ҁ��@~����I@N��_�.@Z�Mf?@���=w�@ ��m@!�F2�(�@$�2E��@&+���2@(w$�� @*�F�a<h@-y�A���@05�f�@1�m��r@3
��˩1@4��VL@6K%"�X�@8	��MD�@9ܓFxI@;Ĉ7m[�@=���֞�@?�r��J@@��odx@B�ؿ�<@CHj#�4@D~Q��[@E�����@G���?@HeX�X��@I��Fܝ@K:Y�Ѱ�@L��_��@N?��)϶@O�Ǳ�Pl@P�(l�  @Q�3�E�f@Ro�cv,�@SSPu��@T=x�@�@U.%%��@V%25�@W"�6���@X'��)!@Y1�e�R@ZCU.� �@[[~���        ?c��� J�?�jMs��h?�{(�`�?�Q��?G?�J�{'>�?�t�]�?خ�d�Ǭ?ၒ��ӹ?�в��v�?�]$z9��?��w��?�G����?�/O�Kdy@����@��QRv*@
�+�ɫa@�o��>|@^y�p�@0W<�+@Cق�@�qq�@1��$�@!��b$Z�@#�ud�@%�o��)@(-}i�[@*�ry��@-X)�K��@0A�H�@1����.�@3!��ɤ@4�=��_@6�8@R�@8V>��@:>��4�@<>#[��@>T��+��@@A]���@Adr_��}@B���e{�@C�qţ9@@EǸS�f@Fl�
��
@G�4��dK@I>�|�h�@J��g�w�@LF��X�@M�[�~��@O�a�ߺ�@P��"Bb"@Q��Ȣ5@Rig/Ĥ�@SZJ�;�@TR��^�@UR��Y� @VZU�*�A@Wi��Y�@X��zK��@Y������@Z�^�턍@[� ,V@]+�k�4@^j���g        ?�Ӂ�>��?�#,��z?��lL�B�?���YH7@"ls1@³��J@ ��͝�@%��/���@,�,aKy@2X39�@6���9^1@;�����@@pj�[�@CQ��I�@Fl�~pS@I����@MM�|W@P�)��`@R�q	���@T����@Vجw�`�@Y+��@[���L��@^(׀�$k@`iTT@a�����L@c>����l@d�;X6q@fNI��w@g��r멅@i��ߥWW@kR��u�@m�0���@n�f��J@pl˛~/@qg+~�k�@rh���H�@sq�/(Q(@t�"my��@u����t@v��z_k�@w�0�ƌ@y�=��r@zA�bd�@{~�OE@|��*���@~	�V@]����@�[�s�@�
�#"�@���B�Р@�t�35r�@�.��p@����p�`@���g��@�q�O�@�8�|�Ւ@���%�@��a�6�R@��NL|.~@�y�L��J@�R_[e��@�.�J@02        ?s��x��?�ҟ�V`�?����$?�S��ؚ�?�v���#R?�����+b?�gñ�F?��z?����?�Tw�g�@ R�p�Kt@��Ӗ&@��^H�@�S)��@?;0˞w@���o��@^�wW<�@4�����@:��I�@o��ƿ@ ���@"�}��O@$������@&�����@(���m��@*�=��ղ@-*�8i@/�>;�o@1���$@2Sw�K��@3�+N!%�@5����@6�d4z��@8
u�+�@9� 0g�@;5��B��@<��I�@>��%�\l@@.�n��+@A���۹@B	��El�@C���V@D ��0�K@E�Oh9o@F0�o�6@G(�ϔ�@HDd(��@Ig4��&E@J�Ċ/@K��p�@L���@N9"��
 @O(X�w�@Pf����@Qhۺ�@Q�~zZF,@Rnc�s}�@S"��\�/@S�����@T�����7@UTL�{�@VP���@V۽u��        ?OYv�E�i?{[ab=}_?�nZYƹ�?���[m?��R�`��?�<�a?Мr�ȉ?�xT[��?�6�haÁ?�Z�=��?�Ĩ��#�?�ǡ�%�?��Dꘉ!?���y{�@̪��O@�ێ��4@
�k��D@��<�@z[5�@aI'}�@��_��@�%�#@�-�4V@!�oB�m�@$�G�@&wE�32c@(�\�@+���{@.��m��@0�FH��<@2gl5ʡ@4���M{@5耫�S�@7�e?�@9��]�@;��3n@>P�4��@@1���u~@Ae���y�@B��]E*@C�J�@ES�����@F��T�v@H8ݩ�>B@I�j߾�x@KX�f��@L�N<��@N�;nB�@P="�Ab@Q'��Nh�@R��-@SVY�N@T�\�*�@U!�����@V4uӄ9b@WO����@Xsy���@Y���1V2@Z�|TPD@\���7�@]XR�q@^���X�@_��/�/�        ?o^��,3�?��ȿ�`?�"Is[�?�:[{�A?�Ju6�A?��y��?�Cy�IM?�J3�)?�2-Y�G5?���b��?�2�i�0@Ζ�{�k@�`�8@����@���6U�@k�x��
@�*-qh@����@�sv�@!@s�|@#9j�9�#@%�[��?@("��-.�@*��Ǝ%@-��ݞ~�@0b��L�B@2 '(�oy@3�b���L@5�ƔN@7b���c�@9]�fk5I@;pb
0��@=�(��@?��h��@A�L�@BVgg�Y@C��3@@D��Eh��@FM�2�	�@G�`�.@I1����[@J�l_|�@LHa#��@M�xD��@O�/�GuD@P�V���@Q��8q3@Rqu��6J@Saf���@TW��@�C@UU(���@VY.#��@Wc���/@Xt��<��@Y��p�	�@Z�$漬+@[�i��My@\�f���@^/��+�@_h�e~b@`Tgmߜ�@`��5@a�͘A��        ?��[�YQ�?�A�t��?� ds�@͵�myl@bTU�G@*�t�p@#��}9�@*�z��@1�(��@6n��VVg@;�k�@@�K@�#@D;]���@Gڐ¬��@K��.W�@POw�]H@RN�U7@T�tX4��@W^^)���@Z%��י@]�x,^@`�/ �@a��ȓ0�@c~o��=@eQw�:P�@g<��@i>+#�-@kX�$��@m��v�Q@oӟ���@qկ}��@rW��z��@s�R����@t��eB�@vX��2$@wƘ��1�@y@�1�@zǡ��k�@|Z�&��@}��dV�u@����@���# "$@���~�@�|N��@�l��}@�b^f9ρ@�_N�@�b"ݜ@�@�k�K�k�@�{X�x��@��i�d@���jc�@��M��@�����@�(
/��@�]*���@�L73��e@����b��@����*F+@�7q��:�@��E`�I�@�� pZLP@�>t��        ?Z���NU�?�1|��~?��cO!?�O���M5?��?�"Lu?���>�X?�̎�aѧ?ێIq��(?�V��P?�!|�s?�߳+�?�(���?���$�?��yPD�?�)l�2�@s���,@��r�@�
����@	���y+@��d���@h�Y,�@�����@������@�ѩ�'�@�� ܍�@��k���@մW)"@!�*9��@ B�7�<�@!��(�B@"����@$!+G�$@%�V~y]�@&�_:�@(l��@)�d���M@+�ã��t@-#��K;@.�B��yh@0A��40@1"��2V@2	:CHw<@2����@3�t�h�@4�@�H@5�.bIۺ@6��4�
@7�ft�O�@8��U"��@:�?w�@;*�??�@<K,���@=q�e�@>�����@?�G�3��@@�V�5�T@A!�c��@A�!�d|@Bg-�s_�@C�j1.@C�o�^��@Dc����@EmV2�+        ?H���!?t����?�?��T��u?��I�!��?�����?�1�u�H?�i؇
.�?��g����?�h���?��<q0�?硔��`�?�e�4�?�'>
�+g?���Ѐ�$?��r�f�@i��?�=@����o@g��-�@z�w�&@z�`�&�@��@�����@~�@�@�%��,@�;\C��@!K��0�@#9�Qlfw@%H;'��^@'x<��!@)�d��p@,?Y���@.׺�H@0��"�@2:�:�g4@3����׿@5S��IDD@6��Iro@8���;L.@:��F`J@<l�#^8@>d�֊-;@@8zj��v@AH�B�c�@Bc���d@C����>@D��]I��@E�n���!@G8����@H�:N�Q�@I䛇�a�@KKQ�e@L��:ޮ�@N9�󤾿@O�yѷ.@P�� Fp@Qz~����@RO�u���@S+��!q@T3�
T�@T�+��@U����@V��e�
@W˛1�:        ?SݼW���?~Ѻ���?��YU�_?�Q�a�h?�ʟ}{�v?�mrA6y�?�D�Tn�?�	�M��?�XzI\�'?�28�c�?�&�<���?�$ᩧ��?��TF1?�3�1��@@��N:�K@i�h��@�z�AF@��tB��@�0����@L��u�-@�H'�@�
���@1���4a@�Soؑ@!�h'��@#���m�@%���4@'����Q@*_K���V@,��_L&@/��|Y;@10'�X��@2���K�0@4:��u��@5�[c�ӧ@7�DN��@9_�O��.@;?g)�
@=4Z���@?=�6�gb@@�8:��@A�<���@B���7�@DfN��@EV�+�@F���VNK@G�]�e�@IF0��mt@J��4Z��@L$pJM)@M�j�ֽ@O����@PWGv�B�@Q%4�K]@Q��m��@R�R76�n@S��(��@T����@U|46�@Vj|�F2G@W^I���5@XW|S�?9@YVS�,�        ?�a@
�)-?�3+d�(?�2�0��?�~�-�[?�:=� �M@�����f@�����@2��牊@�YI�!9@#�bH0�%@(� �S@.IB6�<C@23���@5�{��5�@91h1��@="}�h'@@�.���f@B��U�p�@Ebo����@G�Q���J@J�����@M� xh@PP*js�|@Q��U	�@S��(Vo�@UZ>B���@W0���@Y���c�@[�����@]-� (m@_U�%PA�@`���F��@a�E�b�@c#�}k�G@d`��4�@e��BIk@f�
�J>F@hT�9��@i�2N�d�@k)�xW
O@l�� 	�@n'���R@o�VF�:�@p��h�p@qwM��@rM	���S@s'�ϻ7�@tWew�Z@t��$Ԝ@@u�h�.Yf@v���@w�3�kN�@x�y�2@y��Z��O@z����W@{��y�8@|�Q�_�@}��[�$@~��s�M@� r��}�@���C`@�!?j�`�@��&Τ/        ?x��R�`�?�t���8�?��aax?С颭��?�X@~�b?����>?�Y�*
{?��|�S�~?��Gyu�'@��Q�RZ@�dY�Od@�5$?�I@�-]@<�O�
@WxM:�,@�L��t;@����Q@!P�E��@#rf�2d�@%��Āο@((=�B@*�}�g��@-7���D@/���Hp@1m��ʩ@2펢���@4}�f@68�?�M@7�^a�K@9�f"�KU@;^Xx�X�@=>C�z�^@?.:�]X�@@�'D��O@A�EtȻ@B�y��@C��sє@D���,@Fo�T��@G@��� @Hy$9��@I�Iq���@Kh����@LQj�r�m@M�J́ە@O	��֥@P8NIJ%�@P��v�$@Q��x��@Rk6=>-�@S.��d��@S��?o�@T�X:ٚ�@U��Z��@Vc��X�e@W:�9�L@X�FZ#�@X�\��'@Y��P|2@Z��5��9@[�v�uQ@\�j��U@]����L        ?q�����?�I"����?�I���_s?�b?Q�?כ��-04?��v���?녨��6�?���E��?�oo0�m�@ gP&¸�@�u�)�g@	g��Ǫ@��l(MT@YB�H��@�">���@4k�0��@�9ت�@ �(�?�d@"���lm@%b���v>@( ŚI#@*�N*i�@-� {BӢ@0p��.8@2%�E@3�>�K��@5�zK�@7��w��@9�H��g@;��ۙ��@=�_3���@@zw��b@AQ�bl�@B�k@�/�@C�=�p�J@E2lV���@F�7@HD&�!@I�%�ܑ@K����i@L�of}3�@NGI��@O�����b@P���@Q��F)��@R��{?z�@S�0R�h@T�i���@U����ް@V�'��{@W���k@X� Io��@Y��D8��@[����@\9�g�$k@]m��/@^��b�[�@_��L��@`�s^%x�@aA�0Xxk@a��\��@b��z.U+@cQ2�r�        ?nG���/?���G�?�M�����?���)y?�@��u�?�X�%u�?�Re��|?�	x�L?�A|��<?�"�Fցn?���Dj
 @�.��@h3��@s�E�@��ʬ�/@�y��C�@�PM�M@����O@�/�Q@";&sF�@$��(1k�@'=��K^@*�Kͼ@-���0f@0"�{O@1ȩ��-m@3�_JҠ@5x�Llک@7yJ��@9��R���@;̃H/�|@> lkm�@@H{���@A�?���@B���F@DH�]�2@E�^*8�@G>Z�ID�@H���j�@Jpqʅ�J@L x�P�@M��n��o@O���Q�@PƬ�X�w@Q��(�|�@R���hI�@S�6����@Tѱ٢(@U���$g@W�v@X,I&�@YY�u��q@Z�W�m�@[̱|D�W@]�Xz�@^^�yX�(@_�b^t�@`��=��@a9��K�@a��w�z�@b�w9~k�@cf�ʉ�k@d(E�u        ?�%�Q���?���|�@{| ���@�X�;��@ aF����@)������@2jz��K�@9��	�@@f��� @D�_O6B@I��#H�@O�/��@RuT�+^@U����j@Y��r@\��6r@`^�qu5T@bw����@d�i�9�^@g�{(�Q@i� 虍�@lۧ�Ya@n�P�J��@pӤ7��@rN��$�(@s٪�nc@ut۟פ@w.�5�@xצX�P�@z��s�5@|yB=n?@~aO���f@�,n�+��@�/�� u�@�;8_>c�@�N5�!�B@�h�}�H @��BDv!@��>�L��@������6@���F�@�`�ݔ\@����m`k@��#ґ߸@�O�I�@��5�UZ@��YgYd�@�?���@����S.�@��7��>�@�xN�)��@�<�<#�%@��]�@�О��S@����|-@�r!�$%@�HMw@�!J�s�@���r@,@�����N�@��AC�om@���Bq
�@����,i�        ?k��9���?�m�y5�?���Q?�^����0?�N ]*�?ٰ�"�p�?�c���?��r[�Q?���aZ��?��t�e�?��qd�@ T��EP@�wQW�@��_@
�wX펿@�w��@���1X�@
��zb@���I@6���R]@s7A*�@�B�y�@!���)@"�%Yb@$r %�s@&@��0��@(#ԌA�-@*3K\@,)o��G�@.LTa�e�@0Bh_�0R@1iz��N�@2�d<q��@3�&�\��@5�p���@6r8�E@7ϊ��8@97��Ơ�@:��FP��@<(���@=�!V���@?F_X�j�@@r��t�@AH,s��Z@B#�,P�@C��gQ'@C騳N8E@D�N0<F!@E�vJͯ�@F���#�@G��R�@H��2�@I�>���T@J�J��k�@Kޟk��O@L�6���@N��,@O2���G@P,-N��@P��>� �@QZ.ˮ�@Q�
����@R�vQOY�        ?W����W?����(@�?���@l�1?��G���?�T-�쇅?́~�X�?գ���9?�����w?�H(�YP?�=��\�D?�<��X�?�	_�&��?��N�5hU@l�~j�#@���?vs@��n;N�@Y�z�M@����@��]�@��-1��@�=���/@G�.9�@ |g�m�8@"wǶ��@$���5#�@&��M5s�@)D�z�/@+Ӕ'��@.��|�}@0���H�@27F���m@3��۪�@5{7��@7<}1p��@9����@:��܎\�@= i^][@?ؿ�9�@@��
�9Z@AĚW�l@B�Č��]@D*E���@En3�A�@F��,���@H�YaPX@I>1�V�@J�j���@Lo�����@M�nw�~@O��WcH@P�V�Ŕ@Qo���@RK�~��f@S.���8b@T\���@U0��R@U�IX @V�����@W�)�c@X�bN��@Z�-��@[R�^� @\9�B�d        ?p?/�t?��r�f�?���Z���?�U��g�$?�E�x�?�}���?�<t�v�S?�0IM�?�ֿrJ�c?�c���h?�ȝ4z�@�
���@ W^rM�@�����p@c}�J�@.�i�8@>rA���@�7���3@5/]pb�@ �Ph
�@"����\@$�4�6�M@'^M~ɵ�@)�����@,�#�k[\@/�����$@1]{c% @3 0~�Y@4��y%��@6������@8sx�$d7@:t5
4@<�O���@>���&@@�桞�@A��Z�)�@B����px@DA.��D]@E�ɀ�@F��C�&@Hr�3��@I��#g�@K�ԤUz�@MQ�T�(@NŁ�Xm@P>?����@Q ���@R
+�+7@R��;��@S�pa��@T�c���@U���s��@WL	 �@XfƊ6@Y7	��bn@Z[G����@[�3��K@\���7�@]�a�K�@@_9Ȼf�@`B�A�@`�E�4�)@a����        ?�V�n&�?ت*���-?�U
fF@�[06��@���>	(@�厙�B@#�4c��@+\-�b]�@1�jQ'7�@6�\ӻq�@<M��0�@A.C�יs@D�E:�o@H赜5�@L
M+��@P ]0@S@Ra��i@T�ͽ�!@WX�_y�@Z�&	)h@\�͇�:�@_�{���@a��f��@c:�p��@d�ם�o@f��A���@h�l\v>@j�|�6A�@l�joc+H@n�f��#v@p�E����@q�oZ�hv@r�1�樤@t)���̱@uq�����@v��y%�@x!=���|@y�Y�@z��$�+@|x� ���@~ �6�~w@��?.��@���	�)@�m[G`ޔ@�G>� �@�&�S�C�@�Zp�X@�����E�@���î��@����&_@�Ӽz j@���n&�@��1�R�x@���ߓ��@��!
��@���vcd@�ha��@�9'��.@�-�,7�@�����X@�XW)�YY@��KC2�@���[�5,        ?Z�&Κ��?��!}N7?�!{}�?���ޭs�?�?���?�!)t�?�Q��0i�?��{�^?��|���v?���Ԩ�?��;��6?�H	Jx?�LU���?�@�蠢�?���|��P@FʛF�@��=�@S�0�}�@	5N��/@Fjx!�@�ꎙ8@{��l�@K��8  @3��0e�@3M3�"v@J�3	��@z?��{Y@��-��@ z4��B@!L2kv@"��y��k@#��/��c@%G��&�@&��8�y�@(+�B}�@)��R� @+?p D�@,�e�	A�@.��L_�@0۪:��@0����@O@1�Co�u�@2��@3���&`�@4���DF@5�>D��@6����r@7�'E]�@8�����@9�F���@:��~#�@;��	Z@<��i��@>P-��@?<Ƽ,�@@4;a�6�@@̲��@Ag�h��@B~�'�@B���!�!@CH�q0m,@C�>V>�Y@D�M�n�         ?Ai=�cj�?p P�$r?������?��\`k��?�s��s?�����8<?����~�?���b��?�)+�)1?��WC�q?�����?�T8���?��}0׿?�E�,<?�?��e�@ qO���@��#��F@$0f�_@�-��9@\�:��@
�����@���n"�@h���Ɯ@n (z@���p��@ �o���p@"t�º=�@$s(�>�.@&�<��r�@(ң���L@+4�ie�?@-��#���@00��[�p@1�N����@3�f\Q�@4��茪w@63���~@7�b~�a@9�ċ��@;w���5�@=_����@?Y9��e�@@�3&j�>@A�U�@B�����@D K@�A'@E-%曥e@Fc� ���@G���F:�@H�^�أ�@J@��{�@K����&q@Mh�B�*@Nt˜{��@O��f��@P�]���e@Q�(���x@RK��mu@Sd�2��@S����@T�0J�~@U�m�D �@V���L{        ?K!���?u���$��?��Q��А?���'"�a?��|�8��?��4�97u?�y�'J�?�y/�Xs�?�U�$<ɂ?�}]3��?�G�9Jt?��'tTW?�"T{?���B��?�={Յ��@�&s��h@��t\�@X�k|)@H&ܚ@J㟈��@��.4+�@)-nv��@�Bf�N@��]�?�@���Z�@ �S8Y��@"e��I�@$EVB��@&?�_.�@(V#1D�@*�c�#@,�!E�[@/@hΖ0@0���@25��Dx�@3�-'��+@5z���@6��>�c�@8F���@9���d��@;Y�B=K@=QV!�{@>�n��D�@@]��s'�@AR��@BP/"��@CUj�"�@Db�x���@Ew����@F�Ov�mc@G���ܝ@H�I��@J���Z@K[�E'�@L��� �@M�#�m�@OE���M@PQ�ӒX�@Q)R�e>@Q�[�<̏@Rw��.�@S6�����@S��୨        ?�<�%
�?��9j�?��ax��f?�Y�,~M?�-)��9�@G%[��@�I���@�\ w-r@�N����@!�S�0�>@&v2�� �@+�ޠ�?H@0��_�@3���s#@6�>���}@:�߲�1�@>�u�i�@A[ۅ��H@C� 1�`�@E�E�h��@H�v1:�D@K.����@N QIe-B@P{���@R	���Z�@S���3@U]a��@W#W��~�@X�Q	��@Z畋�k@\����d�@^�K^ƨ�@`���[��@a�Sţ@b�A�/�@c�q�l�/@e3��AP�@fs挄�H@g����On@iS�˩@jhT��s�@kʺ���a@m5k���@n�Nr3Ã@p�����@p�'��7@q���(�@rb�	N @s/�j̴�@t ��jM @t�\E�[@u��{�bQ@v�$��ě@wn��'�@xT��0'@y=����@z+/,1 @{�7Ι�@|o2��>@}.���@~	��/�@��!�@��J�r�        ?p�
�#XK?��o2?��!�t3�?�mG��?Ҫ���~?�`Ѿ놼?�Y0�u�r?�Qi��?�M@2?��?���"�n?����/�6@����bJ@A��@
>����@��h�{j@���g�@�sT�@�_��@�@���%|A@���/a�@�ƑX@!�}���N@#^m�;��@%8]�b�@'([�� @).~M%�m@+J�3Y�r@-}yDI(
@/�n�([@1�Tf!@2M��@3�ر��@4�,=D�u@6A�l�$@7������@9�$�s�@:��R(n�@<$�@z@=�y~���@?Y�^�H�@@���[#@A]�0�K@B>�k0@C%�u�7@D�!�Ҵ@E�4�@E�`6F�5@F����\�@G��=���@IB�V@J��Y��@K&�>:��@L@>q�|3@M_�"�@N�����@O�x"��@Po�)���@Q
v��A@Q�O3ә@RHz2��/@R�:)R
@S�z�Yf@T:ɍ5�        ?cO�ˁ?��dv�D/?�5�/7?����?��x?#�A?��
r��:?��,V{��?��L`�G(?�j)�|�7?�7���!r?�x��M�?����P��@���j@�_��@
ᯗ��%@���ۺ@z~��@_e)���@����@�ds�p�@�rΰ�@!�g�Ȱ�@#��0GK@&:��@(���Y��@+;���@-�����[@0mt��w@1�W���@3������@5<��$j�@7 �f_@8���b��@:�P��c@<�Y��3i@>�84,�@@�ۓ,@A���,!�@Bۓ�cZ@D��}7�@EX��n@F��e��=@Hz��@`@Ii�+�kK@J۽T�`@LY��/�@M����]@Ov_�	 '@P�|�@�@Q`�Pr5�@R<"�P%G@S.C���@T��	�C@T�>2�ɪ@U�8���@V����@W������@XٶzX��@Y��>��7@Z��[�L�@\�4��@]�g^�@^:&R��M        ?g��=�?��3>�d?�4�]5��?�dd�?�<4L}�?�`@�1�p?ܵ`{/ ?�#�6�E?�!EغYN?�c7�{-?�����?�k�в/@3�~!e@Ú��@�.����@*͌�Af@W&y�c@�p1��M@�����x@���\}@2.���@ qV+2�@"k�A��@$�o�`�@&͇y@)6�зc@+��u�_c@.z�WWi�@0�P7��@2/���s@3Ǜ��^N@5t��j @77w���O@9��T@:���^k�@=��\�@?!&J�@@����~\@A�m�f��@CP~���@D@a+�c_@E���s)@F����@HE�w�@I�>G�K@K2F��Eo@L�L��ޥ@NSs�l1�@O��2�x�@P��(<�S@Q��	J�@R�&�\e"@S��jmV�@T}Bj�<@Ux�ϼ��@V{���@W��"��@X�� 3�@Y��|�@�@Z�x��A�@[�Њ�B8@])쩇g@^a�S��        ?��W�P�d?�����{?�F@�i�^@�7n��@���T@>cV�@$lA�o}@+�<	�@2PG)��"@7D ���@<Ѥ��a�@A|���L�@D����C�@H�ɂ9�@L��"��Q@Pi8�C@R����ʹ@U'��{�@W�L��K�@Z����0@]im�N��@`;���@aֽ��@c����(�@eF����z@g6b�@iʵ�D*@k6�X�@mˋج�@o3�{	\@p�DʆS�@q�;�ǚ@s�^r�@tA����@u��fq�@v�t<�u@x#}D�Z@y�Fܣr@z�6$���@|[��}g�@}���#�@[�s`�@�u
���8@�@��af�@�����@��Mє@��`�% �@��l:q��@��>���2@�l�Zf��@�Z2��@�LMf�1@�C$6	@�>����@�>���j�@�C�/>��@�M�P>��@�[�K��_@�n�3�>@�C%dp�T@��6�;Z@�a��u�@��7�\�        ?mZ�2� ?��E`�?��'gt�?�D�#�W~?���~<�?�e-����?�m�fY2?�iB���?�H�4�?��-�a�?��O�j\�@G���g@�T�=G@	��(�W	@�{8Y��@77�]~@�f3�+@L͚���@O ��@�F�@0�z�@!>����@"��
0�@$���S1@&�%�y�7@(���ƨy@*���@,龍�x @/'49�|@0�/�ъ@1�y1��@31?�Q@4{rԊ֝@5�����-@71VJQ�@8���5�@:���c�@;��;lm@="���F@>�Џ��2@@/���@A&U���@A������@B����[�@C�Y��?@D�J���@E���Po@F�w���@G��ь�@H�v��O@I���v�@J�h��Z}@K��~,��@L�tF�3@M�ҹE��@O�e*�@P�J��4@P�Vt��@QJ�@3@Q�,�$�@R�e�i�@S+~���G@S�w��q�        ?]vs&�pC?��\�K�?�O�,N#?��B���?���j�7?����x:?��C����?�ߤ�֬?�魁� �?���f{?����#�x?����H�~@ ������@�Du�'@��'J�%@C?%�7@'=���@헿�@��lvD�@EIR�W�@ھ�ax�@ ܘwU�?@"�:���@%,%���@'�1�JD�@*/*mgp@,��0��`@/��ۈ��@1V���@2��5���@4��rK;�@6`�	��Q@8:5c2��@:*$�7+@<0�F�6@>M�,Ku�@@@�S��@Af0��k@B�)�~�A@C�����@E�h��V@Fq!i{�U@G��B��@I>����@J��jZ�@L=>��z@M�.��b|@Om�Ma�	@P�7�aT�@Qg��W1@RI�����@S1�a�p8@T W3�˥@U�%L��@V�"]:@W4.��@Xy����@Y&+M>Ϟ@Z:$}��@[ThP `�@\t�x]K�@]��)��@^��(�4        ?M���2̊?wB��)�T?����>)�?�����|?��=��D�?��F���X?ˌ�sF�u?�L�a��;?ܒ8��,?�cԚ��\?�H�?�oH�\8?��u�%ap?������?�DxI;@�Aǜy�@`�>��@
WBF���@��|S؋@�bUM\E@e�x��@B�7|@[k%�I@@�Ys�d�@ ���1�@"���I��@$��
��@&�(��H�@)'��]|O@+�����@.>�Gv��@0�O�@1�b�~�?@3�� n@5�.`��@6̴h��@8�]��$�@:mbP��@<](��@>b��*@@?N�7g`@AXY�Ai@B|��?g@C��|�70@D����@F/�_��@G�"���#@H�'u�@@JLF��Ys@KÝq��@MGFWW��@N�[�O �@P9��8��@Q��r@Q钴	�Y@R���?��@S�����@T�,x���@U���c@V���a�@W���ӌ�@X��&�|�@Y��1@@M        ?��;o�_�?���xE?�5�Q�F?���o��@�����@�#@ q�(�<@& �C���@-*���#@2��o �@7#��@<-��^�]@@ݭ�`��@C�<5���@G0�|E��@J�m�(z@N�XWZ��@QM�w��@Sv�h�B@U��9�l@X+:��^�@Z�zt̾@]bV���@`a��t�@a��4�X�@c��L��@d�o��hQ@fR�G�,O@h	�0ߵ@i�J-sۈ@k�@'b�@m�;�D��@o�Թ�i@p�y}�@q�S�(��@r��y�@t	�)�$@u.��ES�@v]��	*@w��ʏ8@x�[�J�Z@zb�l9b@{h�L�0R@|� <��z@~B��@�g'@�{Y[��@�73"g2@���@��
I. �@��6@�O�Q@�H���@��2�@���E��@��o�Z�S@���Z��@�m�����@�WISR�@�D\���@�5��H�@�+�*H��@�%��6�        ?st2����?��1�[=?�e��0?�#, ?�K3��?��UU3@?�`����?�H��b�?���݈�?��z��@v�8�|@@�?�YC@	l���V@�m��p�@u_���@�d�&�@�ǋ�}@/T��o@FoQ]@ \ǧ�T@".n�K�@$]Y��@& ��f@(?���%@*y\��(R@,�.�V�@/;<�MX�@0��ڳ�K@23%w���@3��j)A@4�l~��@6v]�.T@7��92e@9��!:�{@;0Il��@<������@>�\}���@@/�"�WZ@A�5�@B
�r��@Chz�@C���iA6@E7�ܑ@F�P�@G����]@H1�v<�@INa��@Jq	8~� @K��k�x@L����Б@M���h0@O8�Үc�@P<�<��@P�e%�@Q�̈�O�@R0!A�)�@R�^�`�@S��3��@T=}҉��@T�N(���@U��H1G�@Vd6ĸ�@W!86˥q        ?jZ��r�?�c�Q6��?���с?ã�s��?��d�Ak�?���%p?�\��T'?�<7j�~?��!�t��?� l�䯨@H:�=�@��B�c#@
h�՗@ޘ�Q=@��A�@]
�M9�@�1���@(��:��@!L�,@#��|��=@&K���R�@)T)�=@,�T��@/A���
@1R����/@3��5�@5מ{l@7	��-@9(�v��@;bVF��@=�, �O�@@P#�Q+@A\�m!�_@B�̞Nī@DPD�h�@E��=z�@G��ݧ@H�}l�Y�@J=��7�2@K��_��@M�[M�3�@Oya֝��@P�{+i�@Q���]@R��� I�@S��M���@T�,�؜@U�W��E@V�o6 �Z@Xt8Î@Y=g���o@ZsK<��@[��!M�@\��|�u@^D�I��B@_�8� ��@`{�Q�&�@a.�틫@a�UY&$�@b����G@c^�� ��@d!.�i�@d�VC        ?fDп�ne?��.�qj?�8 �ik�?���W?�(WJ%�?�R�(���?�Qnk��e?�]֤x�K?��G�#?�߬&K=?�
�ҳB�?��{ +�@\�:��m@(}�U��@
d�ʬ�@�ȕ^3@�l�r@�#�/@t���_@[�"���@�:T{v@!h�#B�t@#zE���@%��w!@(	�t��@*�G���@-*���t"@/�&�>@1q3�@2��9^@4�w�K+@6J��FE�@8
�@9�0TN�@;�����(@=�n��@?��<�@A�"Ԝ�@B$@rw(@CL ���@D}�?EF@E�ؓ\�@G q!_@HPf0A�@I���@K*�F�@LRsjS�@M�����@O}A��J�@P����@QR���ȋ@R$�2�2�@R��}7@S���-�@T�$�8�@U��e�@V�@@�B�@W�0/��@X{��� �@Yz����@Z~8?z��@[�*��w�@\���[�        ?��,ׇ=�?��6Vu�?�`�X0�e@	5h���;@j���@!�܇[~@)��?�@1���U_�@7;����@=���fTK@B^�  �f@FV4���@J��N�7�@OtB�[@RM�1�T6@U2�U@X��J0@[:��y@^�:o�DV@a���l@b�<��@d�����@gUS�+�@iF~`P�@k��sx�@m�-���@p?]�[@q��MR�4@r�N��@tR}�m�@uȆ��B@wK�/�y@x��1�@zx�#��t@|"���w&@}ٖy���@��ࡿ@��^��9@��z��*@������@��D���@����� s@������@�����ή@����@��}��70@������@�N��@�>,{@�m�hK"�@��m�+@��y�h)@����`��@�2���@��;��(�@�����dn@�+�7�U@��$�Fo,@��@���@�;�m��@���?�SJ@��F/!x@�a�,��O        ?^���h6^?�����E7?�Xۇ`�?�_rB�d?��ߢ#�?��9ᚾ�?��b��?�N.�J?�����?��4�uDO?�dJkv�&?�H"-�?��l����?�I�a]�@��FK�@yh���s@s�]'@
��c�׮@
�YC@�:���@���N@�r��Q�@�LT��@P�?�&@t�a��@絰��@ ;W�&�@!���D@"�K�I�@$fk%�d[@%毧�7�@'utԫ��@)�`_r�@*� <��i@,y�ܝ��@.C�b �@0cD�@1[�&�@1�ㅜ�@33�U@4��"�@5�l|�@68!ge�@7Y� 0�T@8�{�q@9�eϲ�@:쌜&-�@<,���G�@=tj��;\@>ï�ɦ@@<f.RB@@�_�VJ�@Ao>�@|<@B%ח%;@B�)��$@C�3�1ON@D_����$@E%o�=�o@E�s4@F��bou@G�4t �@H`�+�Go@I8�([�v        ?M�&��h)?z�nB!zA?��{b�֬?���1%0+?��'f�?ĺB?��v�t/?ל~ߪ�;?��q�ɼn?�H�6a�?�6����?�{����?�u�����?��r/U@��wT@*@��@		Ʈ��j@i��!� @f��߬@���H�@��8N�(@���9@A�)Bd�@ y� �A_@"vu�Ҡ9@$�6᡼�@&���)$�@)N��Sd�@+�\<j7g@.����@0���.@2P��3�/@3�\��?@5�>��F�@7rP��j@9U'��Gz@;OI?�@=`xU
&�@?�����@@�`C�8�@B!���@CK4��D�@D�����@E�����@GA��]�@H�mC��@J&+9i�@K���
I�@M>����`@N�_%�Q@PFRJ��@Q#��#p�@RJΑ @R�%�@S��j��@T������@U�Fh�b@V��(�@W�D�Ȯ�@Y���@Z(=Q�@[L��fW4@\x�:k?        ?H���/ڳ?s��B�o?�Z�R�J?�5*��!?����~:I?�ަ��0D?�f��h?ҏO]�A�?�5;�Lr?��0�B��?�ۧͅ�?�Z|<a��?�($J�?���XRhX?�u|�@|��@�$^��+@���j>�@��j=ш@�18���@(��#@Էy�,@�ˮBk@�A_�O�@g��E@!�4E��a@#��YH6@%�Yt��!@'����H7@*A�l@,�Q���(@/s��2�@1"�4��@2�o炏�@4-� 9
�@5�wO7X@7��T�*@9TF��@;4�1�c @=)��� �@?40<��@@��N�o�@A�R�ܟ�@B钔�+�@D��=��@ET�?s�@F���#@G�����@IG����Z@J���RQ@L!>�s�@M�qN�gE@O&��uk@P]I�86@Q,��T�l@R��B@R�SKuy0@S�����K@T�s_�|@U��=:�@V/� @Wv>�r�@Xr�b���        ?�{�QN?�'�:sF?���C%?��:�?�3���� @6_�g%@۶���2@ӆ$���@ �.Ka�@%;�O*5@*�q��"@0G]��J�@3��i&ti@76/_�X@;(�*��;@?n����M@B}��@Dz� ���@Gӳe�@I�҅�W@L�R_���@O���U��@Q�O��q@Sb�u���@U4�!6SL@W�o(	]@Y���g@[1!��)@]]*�dS8@_�p�K��@`��� )�@b6�;�d�@c{��Ap@d�)�=�@f*�G�d@g�qf�*�@i
�0)�O@j�M���q@l�顮+@m�Ux.��@o`��M�@p�	����@qlǦ�=@rSy�l@sAT5�@t5���a"@u0]D�۬@v1����@w9+�]��@xG5F�m�@y[��*NO@zvr�W@{���F0�@|�I-��@}���fΔ@!A��@�-���7�@��2�L�E@�q��DX�@���V��@��w9���@�o��X�;@��9�@�        ?u1,o��?��n�Ş�?�����m�?��e\�J-?��-f�ڠ?�>�ne�D?�hЎ0t?��[�ߖ?��E��+�?�s2���~@ Y7�F�g@��\
��@���k�@�	��@��[�@x!Y��|@��or@�$��{�@�cX�{�@�t���@ o:9p�@"Ñ�c2@#�j�I  @%�B:���@'�^'�I�@)�ҷz�W@+ʴ]�(@-�Z��@0�948@1LВ�aS@2��f}�@3����&@5���.@6n[yD� @7�ƥ"�@9?�P>�@:��y��@<<i�+|�@=ʠˑ�@?ct>�L@@�m�0Y$@AZf�^,K@B6�CW&@C�4�@C���!@D�x��@Eۈ�*��@Fў.�c7@G��S<��@H��H)�@I�2BaQ�@J�\B�s@K�oW��1@L�ae*y�@N'�8'@O5�sao@P,��'�@P��sȢ(@QUs�CHb@Q������@R�P��0V@S%FdhR@SĔIܛ�        ?S��W��?��L�X�?����u?�JO^��?�pRh��E?�.mMCn�?�1�D���?ۚ�V#�?� ����L?�I�P�w?�`~m��?������?��X����?��N�:K@@�_-@�A�@
���cw@+�����@Y�4_@�w-�~@� �k^@��2��@=j��:�@ ��Ne��@"�uJV�@%]W<�@'C6��:@)����V@,(<G%�I@.є&��@0�����@2JP���@3׬��"&@5xo[�@7,�,|	7@8�����@:цn%�@<�I�``@>ǥC@@p��t7@A�����@B��:��@C��A�_M@E���Z�@FR�qӽ@G�Iv
_@H��L�']@J_\�D�g@Kϩ����@MK�D��@N�Ju1%@P3.�W� @Q��Gc�@Q�R�j�@R��d��t@S��L"Yi@T}sD-<�@Uk{e�c�@V_�i��^@WZTȿ]�@X[>��k@Yb�`u��@ZpI�L�        ?h���n�?�S>H{�x?����Q�?�ӻu ^?�����D?�1��?�hQ¡i?�:PS�j�?�)��?�ѓy�t�?��҂�?�x1�+H@k��s/@D ��|@
�����@T/l��@JW��B@*�rn�@M�ʬ 	@�L^KR@c,�+@!���B��@#�_�ʹ@&{�jb@(��JZ�@+���f�@-�w���&@0]!�sH@1�wIX��@3�oYsS@561�.T�@6�'M24�@8�2[mg�@:Ӓ$�z�@<߂���@?>v��@@��U�.�@A�z@?�@B��Mufz@D:�R�@E���I)@Fޱ��A@HB�!
�g@I�Q����@K0%��7@L�q-;�@NOL���@O���rg5@P�}Q\o�@Q�t`U@R���)�@S}�X���@Tn�����@UfGZ���@Vd@�jJ@Wh���A�@Xsn2��@Y���h�@Z�F�xAH@[�Y��}@\������@^	���qy@_;YU�>�        ?��u�x��?װ<����?�����@��`G�@I�,�Ʃ@ep�� 1@"K��f��@(���9�@0Jg���@4���%�@9y?���g@>�����@BV��l�\@E��k��7@H��4ގ{@L����@PE�:+�@R[}q�B@T��\�0?@V�>�X%z@YY3�\�2@[�w��@^�l�c=@`���y�@b1�v"�I@c���O�B@eS7�톭@f��� ��@h�٣��@j{�Z�,S@lS���9h@n;RJ��
@pM�@q��|�@r'����@s:���w%@tUj�ނ@uw�����@v�Lt�ǀ@wҋ���@yF߈ȳ@zKxA���@{�	��,@|�gR�2@~8t�x�@�
d�X@�}����@�3��ݠ@��D>��@��~>�z@�k@E�5S@�/��@2�@��=��˾@��h��&�@���sb�@�b� ��1@�8<��o@��~yI@��ʻ#��@����?B@�����'�@��HX*��@�}M���        ?q N��?�
}��n?��� �-?�~�EL�*?��U
�?���?�!�i�� ?��[z?������G?��+���R@Y�Q��@�e��n@	F�7Tk@�m7�P@\���Ĵ@�?�@�A�Qk@�D�v�@R�A�Q@ B����@"���@#�(-s�[@%����Y@( `7/�@*D��7��@,���8@.�t��@�@0���\֑@2�aTχ@3` ^ss@4�0���=@69?��͝@7�`�{m�@9F�:o}@:�4f��1@<��֧@>>Y�%��@@ ��4[V@@��7�r@Aה���_@B�O����@C��Vm`@D�P�Y��@Eל�O��@F���"[@H �ui�c@I�� h@JE��,��@Kr3�n@L��no��@M�=F��@O!�*�@P4�aX�&@Pܧ�o��@Q����@R6yB�t!@R�"��@S�J�_�9@TWl�0��@U_OnH@U����t@V�~��Cc@W^W���=        ?_-f�Y�)?�W��1?�/���8�?��Ʃb�?�iP�U��?��?l �?�3��'�G?���w6�}?��:�{k(?�o��F?�h9gBP�?��umm��@(C	=ȳ@��jCT@���sT@,ɏ/t�@	̳���@�/(IY@���iL�@�2�A�l@M�=��@ �9���@"����X@$���@&�CʩW�@)_� �\@+��L�)�@.�Xw�fB@0̸�d�@2TV�a��@3��A[[�@5����@7jH���G@9Gԧ���@;;��
i�@=Fa5-8@?h�rzf@@Њ���d@A��}̢@C-5d܇�@Dm�ʩH�@E�U�L$:@Gm@��D@Hy~��@I�`ʦl@Kj��j�@L��'@N��銢@@Ph���@P��uQ�@Q�~$���@R����&@S������@T��\��@U���%��@V�7ܖ2b@W�üQx@X�@$B.\@Y϶����@Z�2E�@4@\��}@]@j0�#L@^tA@�|�        ?d��=�Ʌ?�I�.��?��Tߢ�?��Kr��?�Y���=?���I{�t?��蓩�?�&�u��?��u��]?����{?�PD`�?�� n��@�eB@�-� @VB����@.�zk�@��F4�@��x�@`�;e�@�r��&@ ~X��l@"�3��D@$��T�@'iԷ�@*�[8�n@,�Y�bj@/�E�%(�@1�$j�q@3:¥Q��@5ٚ��9@6��й�@8�{�i+@:��8�
�@="�!�D@?j���wp@@��"z�@B$VZ^@Co<"}4�@Dǰ/���@F-�A��@G�����@I!�L��@J��{ �@LK��,��@M������@O�F��?@P�L	fv9@Q�܏@R�U2(\"@S������@T�����5@U�5���@V�c��@W��l���@X�e*�@Y��6[;{@[��Vo3@\;�&�\�@]pE���@^�
P�@_�p���@`�M��:�@aA�kk{�        ?�<f�-&�?�'���?�ӯ��P@~2`�@����@c�X��@&����@/&�q�w@4qix�O�@9��͸y�@@��nC�@C���#�@GE߰��.@K\u@
��@O�6�\�_@RB�hS�@T�SI��@W���6@Z\���~@]c�r�H@`JBo��R@a��f�"[@c�鮿�x@e���?�@g})�O� @i~~
[�@k��.K��@m��`8�@o��B��	@q)�T3��@r^�S�e[@s����I@t�4��~[@v=G�Z�@w��!I�z@y�q��@z|ĵѮ@{�@�F`@}�ZH�aZ@{Ӟ�@�_Yu+H@�5�(�z@�B��@��c�� @��{�l@���?Iam@��T  @���c�_@�������@�����u�@��Dm`�U@��M5Ѣ@���G h@��,mOD�@��i��@�6�M��A@�0L!/@��'��k9@�bϵ)��@� Bbj��@��|~v�R@�Cz��c<@��9q��        ?��W*��?�`�^�<�?��-h��?���.1?��fr��I?�dE�*ő?�"�=�i�?��鈜z@��:cq@�
�]@���r��@�e5R�@i��Y�@1OHb�H@Iy�ex@ �J�Ou @#6ua�@%�aFq��@(k3G%�X@+C�\ @.D�M�9@0�-���@2a_��@4����@5�3$�@7�Z6���@9زg��K@;�07U�f@>�����@@(!�c��@AQ�X�ä@B���C@CŐC�"�@E1�) �@Ff~���@G�7\�@I3t1��@J�$�~=@L.1�&�@M��#�@OV�=��@P}���@QV[ߞ�o@R4�@�a�@Szq
�@T60F�@T����q@U�(z�o@V�q D�f@W�Ͱ!�@X�ܶQ�?@Y��e��@[paI@\$���Z@]D�1�W@^j^9�+�@_�\e �H@`dCAk �@a m�㰰@a����N�@bB���d@b�t d�&@c���Λ�        ?Y�����?�J�����?���O�?�I����Y?�B%��?�5�0ʲ?�8�M:�?ಔ{�-�?�A����?����6�?��5�a�!?�T��b�8?�{�&��@>L���W@0YyY�B@��= �@=��n��@��e��@� �~؟@̊ԛ(@��	��@ &[��@"(s[�j@$M�! 8@&�5e}@)\7\H�@+���>ri@.J��l�@0�"�0�@2��d(@3��TQ�@5D'���@6��фÇ@8���ٽ�@:�H�8[A@<Z,�N@>y�ڿ�)@@B�dۭ'@AP�q��]@BgPݬ��@C�&ח3@D�)����@E�>�U#�@GMz�@HR;�Jc~@I��\��4@J�a��6@L=k��0@@M���ul@O !s@P6/2�@P����>�@Q�f���@RnY��i�@S2Γ��u@S���LO@T��th�@U�چ�rw@Vf�)2Z�@W<z�I�@XM��!�@X�u{#��@Y��I�q=        ?�X��:�?�Ro�^a?�k�˿?�b6��F?�`+8��?�����?��z�6��@ڹ�ƞf@�5&E˨@����P@��� f�@����@���)k@!�e�~@$�zG@'5ɸ_��@*��Z��@._���K�@1/E}�D@3RW�b�@5�eY.^@8��@��@:��}�@=T����@@ʧ�M+@A���Tw@C6���'@D�y_�
@F�� >�@HwH�I&�@J`2@Q�@L]�B
�@No���@PK/���@Qh�n#�9@R��c��@S�[�}�@U (_nE�@VGU�i��@W�ᖿ��@X��;��H@Z[�9�Y@[˜��@�@]F� ܊s@^ˮex#@`-��<WH@`�h�1��@a�[?b@b�b��-�@cyXbr�@d`�4M@eF�i���@f1�d�ѡ@g!�هW�@hҮKS@i�����@j<��=�@k����b@l�E��l@m'vHR�@n8���'@oN����$@p4�6��m        ?��:$GG?���6��@	!�I�@�*��p@&hl�@1P8 ���@8�.�n�@@ԗ���@E�J6�@K��:��@Q��$b}@T�V�XQ�@X��ȋs@\�t�9\@`����@c)4�^��@e�L�\v@h�DB�w@k�ug74@n������@p�,��@r�k4!�@t�(��y0@vmqZ@xiS�I�2@zz� �]@|�<9�@~�s"��~@��R��T�@���tv��@��%��@�X���C@��ٟٔ�@�M���@�}\h�,@��:�d��@�x�C�@���l'@��J�c2G@�$(��a@��󫅨`@�ۊ"ǥ'@���yְ�@��+f��W@��?��K�@��3�>l@������@���uWk�@������@��L3��@���A�C@���0�8�@���R�Q�@���)��@�C?~V~#@�:ֺ���@�� ��cm@�v|K;|�@��uΒ�@��]%n��@�f��#��@�f_���@����r        ?t|z/*�c?�㗡-?�e�h��a?�铕W?�?�'���v?ࢷ��g�?�+��J�?�o�\�:?��x~"��?��4:@O8M&X�@�Z�A@	;$���@�����E@\C`xL@�P�Ml@���Mz@�v��v@@��t�@ ^F(��@"6�ح�`@$)��а@&7V�@(_q
9߃@*�����@,���0@/v5���?@1�#1��@2Y��z�@3�7-�C�@5-�y��@6����@87���y@9���Ȏ@;vv���@=)ݳ �@>�aa|��@@]Y[�n>@AK��r�G@BA�7��@C>@��,3@DA�K:�@EL��a@F^d^���@Gw��%�@H�����@I�Y�=@J�����@Ln#��]@MZ�&!�@N�g��e@O�����S@P��G�c@QGp},>�@Q��=��@R����@S_՜� |@T�TN�@T�/��@U�u�J@V\��u8@W$�H��@W�"5��b        ?`0���F?�m��}��?�a4�50e?�h@���?�r{�YQ?Н�Y��{?��3t+�)?� ���9?�%�3�,�?�����h?�hr� ?���M�z?�����=�@*�1�F@�k��L�@,�7Ӈ�@׾�m�@|�P\�@K��بd@Y����9@��
�4@=-3�Y@!�ы��@#����P�@%μ���@((+A�f@*��M,D�@-N�R⚥@0�	���@1�n����@3�<?@4���I�@6|y� }@8M�lc}i@:5���
@<3��L@>I+���@@:�QA�7@A\��F�@B��aO e@CĨנ�}@E
��+�@F]>*��@G�fV܏@I'��U0A@J��⭒q@L$�I��@M�k�Vq@OUQ��ǲ@P��ߣ{@Q]q� @R@�Bh�@S+A��W@T���@U��5�@Vg���@W�mC��@X(f`��F@Y=��p�r@ZZ��@[~"�� �@\��{�K@]�/�7        ?k}��Z?�e[k-�7?���+&�?�H����s?�}��e,?ւ;�.�?����[?�Y��Q,�?�b��@��?�m$�-N?���>@ �`s` @��S��@�f`�y�@�&CX@�� ��@32�WQo@&�j��@[���@�W����@ I՜���@"Ma�Wȗ@$u�9��@&�'�ʪ@)6���)V@+�#$̥*@.��Q-��@0�jשG�@2G��GN@3�ێ f@5��*/�R@7aL�5��@9?&P�s�@;2���U*@=<#�\��@?[�ǯ:@@Ȭ�	[%@A�7��p@C b���@D\�!/�H@E��_#h�@F������@HW����@I�o/w�o@K8̀`�@L����@NH��'@O��O^e@PÊ�U�@Q���!\�@Rz;��@S^\5ܼH@THW��L@U8+�d�@V-�3K�@W)^w5M�@X*�y@Y1��[�@Z>�����@[Q�D��@\j��4@]�����@^�v|Dv�        ?�U�m["?�]߄��?��7c?@G=���@��*J�9@�ҦK-�@&7�@.evv�$c@3��6�6@9\���*@?qM��E�@C���<�@FϬٳ��@J��z�S�@OC�)"�@R(��@T��@��@WE�?�/�@Z+�a�s@]>�~b��@`?�ug�a@a�#�(N�@c�H� �@e�:����@g��[Q�0@i�Vw$�@k�q�yθ@n!E���)@p;���3�@qr��@r��<b�k@t���~@u[����w@v������@x1D�@y���&�@{4���v@|�4��@@~gqmu
@�	F��f@��Ɯ�@��6����@����;��@���1A;@���5��@��α�ws@���Q�<@����/��@��>�A�@��A�ˎ�@��s��[@�ՋXqe=@����e�@���+G�@�J��4��@�>��>"u@�ڜ+=I@�y����@�i�+4@������@�g�e�}�@�$+ԁD@��r*z[6        ?_�|��Ho?�6t����?��dfP�?�W�]�Vh?�y65��?І9����?�x��"G�?�	��pg?櫊���x?� ��b*?�4����?�C��?)?�� �`�?�� �I)@w�h��@T��@fcVSM�@���G�I@'��n_�@k�\U}@[��*��@f( *@�j�6_�@Ŋ�H�@V83:@��P��@ ��#%{�@!Ո�MP@#0{��[@$�h�c~!@&
F���@'�
�$+w@)�q�@*�:��z@,L���t@-�в�$�@/��C�Q�@0�D=��L@1� �3�@2���ݮ�@3�Q�
�@4�t�wGp@5��N��@6��Pmrj@7���k��@8����"C@9�aU�}�@:�˸*�b@;��gn�@=(��!5�@>V�cAa@?�a)-@@a��r�@A �z�	@A��`�[�@BG0��v�@B�KS@C� ��[@DDJ��"�@D�!%�z@E�|�݌@FXT���@G���(        ?FFz��?t�Iwj�?��ӆ�%?�D����<?�� ��V??��K���?ˢayb�]?�Tm�e�?܇\�L��?�K�8lB�?�W��g�k?�>�r?�f��+V?�.��%w�?���tH@`ի,�@Ψ�uFC@	�@�د@�s�̻}@5�L�|o@���PM?@t���@iW���@���ْ@ �ʫ��@!֋98�@#��g�@%�e_���@(*DĮ@*l�?^�@,��[H�@/�V��@1"�"��@2�����@4�V<@5��4	�$@7^0���@9�� e�@:�{���@<�:yܨ@>��s�+�@@nČ��@AG��c@B��3q�	@C���6@D�ݍ��*@F-oB��@Gs�P%@H�y�(��@J":�-@K�Q�]� @L�ܛp�@N|�{L
�@P�%�ȶ@P���/�@Q�%80gB@Rw�Y2�@SS�z��8@T6��ow@U?��@�@V��� �@W\y�Ȉ@W��\��s        ?a���P�?�WK}X��?�����g?�'�P�~"?Ē�	�?�ꩼor?ٜi���9?�E�!֥�?����m?�vl��?�$�+Oi�?���{)�T@ `����@�Y����@� .�ow@1�n��@�=Y�(�@,�;y*@?7}��@<�D�@��^��@ +�`˩�@"&4�'@$D���)X@&�,ҍ��@(��tD
�@+|	#�`@./b��Q;@0���pC@2I���@3���Ѽ;@5B5j���@6�	�ı@8�tn���@:���Kp@<��J� @>¸�_+�@@tu\�m@A�mrT2@B�_!tB@C�dWo�x@E.���ϼ@FyG��@G��9�"@I06��@J��P��@L�c�K]@M��*K؀@O)�e���@Pb�Za�@Q7�Į@R"�s�@R�Zh��@S׷��z@T�Aō��@U��IQ��@V��r��@W�&��z.@X���'�@Y�J��e@Z�>��)@[�u�g��@]����        ?�����F�?Ƿ���'�?�2�?��9�I�@�K����@2�@W�@A�Rz�@�)/x+@$t]Oa{@*1;����@0RO���@3�D��@7��`��@<!���@@cl��g!@B�$�T�x@E���_��@Hh�+=�@KmO�W�@N�k`d_�@P�#�4E�@R��_g��@T��p�@V�|o)�@X���4�@Z�A�-�v@\���P\@^�ƛ��@`���w��@aج�:�6@ct���t@dY����@e�p��@g���@hc�w�>@i��G�y�@kE	I9�@l��$7��@nK�X3Kd@oݚS�%O@p�T�� @q��@.R<@re���!�@sA%b+�@t!q��?p@u`S��b@u��{Y��@v��n��0@wЀr��@x�s�)*P@y��()�@z�YlZ�P@{�0{�n<@|�;�^k]@}�sGG�5@~��W̘�@�G����@���8Q_@�0��e@��rr)��@�<�_t@��ÑY^�@�f�4IAF        ?b�L���?����)?���7�:K?�#9��k?ǔ��*?��+%���?ۡL
��?� ��-r?�Y-�;�i?�=�jPxV?�D]V/Wn?���,��?����d�@��8�x@��[���@�%*��@����@Ķ�q@Uۢ&W�@hu�)E@�T��`@밦|5@\���@��@1�_@�XyJ��@!8��8g�@"�ۇ�|@$;|)��'@%Ջe<�r@'�)��x@);��2R@+�6Vع@,�g�'l@.��6��@0e�w�.{@1l��%@2z��}��@3��N�@4����j@5�-1~�@7��i.@8;/��5�@9y����>@:���-@<Nv�R@=d�z�@>SY/�@@D|џG@@�-|��	@A�U���@BDĊK�@Cp���V@C�
:M�L@D��	�5@Egj��@F9}�c�@G��$�Z@G�B�n�@Hțw �@@I��vۼ @J�?-�@K{�Fʐ@Li��0-�        ?Qԧ"2rD?��G ?��#umB�?�=��+wl?�p=4WF�?��8�,?с)�L#?�S�ՂO�?ሎ��(7?�t��>;�?�Zv�O?�hZ�į+?�6$��K?��[����@�s���e@z��^�@	cAdi�@��2(O'@=�B���@�����R@����*@��#�C>@��W�@ W�r?�@"Cit#@$O�2��@&~ד���@(�su3��@+ED5N�t@-�̅�%|@0ME_��@1��꒕�@3AI>\�@4�f��h@6��ك�R@8<�I�w�@:��@;���"@=�N]*�+@?�&�z6@A
1w��@B$�b��;@CIe�h�|@Dx�Y�0�@E�y���p@F��P�.v@HF�$@I��5�W�@K��d�@LtoJ���@M�.�G@Ot�����@P�է�
`@QP�n�r�@R$�jU�@@R���_)@S�� �ҡ@T��9�H�@U���x@V�G�kP@W�T����@X�4��)]@Y�뙑�        ?U����u�?��¼J-�?���2yk?��#p�$�?��0��.?��6?�z[�цX?ھ��kaP?⁣�|U?��J�XI?�e�tZ�?�dq����?�c�) �?��+�:�@�(a"<P@a��u�@
f��)�@��ޑ9�@ۃv���@��]�@i桞��@���i@�_�)Jr@ �m*!&�@"��Qm�@$Ƣ�l��@&�^��@)MX����@+�Ɲ�P`@.\���@0�G)��i@1�ɩ�j{@3}�m��@5Ef�1i@6���[,@8m&��@:7%k)m@<�UQ0@>ī�eD@@U�6�@A�rţ!@B ��uR@C=�KB�8@Dd��I�@E� ����@F���ds@H�Q�D�@I_�@�F@J����q�@Lfgz0@M�:@N��}'P@P8�3P�\@P�`��eX@Qč����@R�~�Z�9@Sc0�m}�@T9�%��@U��3��@U���>I�@V�Sf�zr@W§����@X���C%�        ?���X�;�?ʣ+b[LZ?�rX/r?���0M@I�1;�;@ 8�t� @�:�w@ I�`��@%���?@+�~j���@1 p��d�@4ߢF��@8����@=��%|�@A1����,@C��iI�@F�X)[�A@I��Z�-�@L����X@P$���Y�@Q�;W��@S��5~@U�y���@W�$"��@Z)���@\ja�*��@^�C΍��@`���*+@a�,`/@cL�,�@d��As@f$�%�G-@g����U@i0MK@jȺ�D'@lm�"��@n�@�h@oݕ �g�@p��0q$�@q�Y���:@r��Q.�@s���(@t�P�i�@u�7���-@v�7�b��@w�L�ы�@x�q%�t�@y��a���@{��s:@|A�q��@}oa��K@~���IM@��X��@��$u��@�2S���8@�؊K2�@���Ɲm>@�.�F�@��c<
�G@����%`@�E'D��@���j�@��R�n        ?td�S���?��y��?��J�?�֞/�<^?�9Az6f?�m�^7?�b��oQ�?�v}v	�?�p��?�j��5�@P�F�E�@WU��,@
�����@�G}�@}��j�~@]+�4U@t��B�@�T����@OwV��@!��{�B@#��Y�*@%�ר_@'�76�)�@*?\���@,��sny�@/Rť�y�@1�_���@2qx��Y@3����4�@5xDK&��@7[>.6�@8�[p��@:yY��c@<De��bH@>�p��%@@l�B@A*�yJ�@B	ށ�@C0�j@D-i��)�@ELI�ۍ@Fr���Z@G�_x$��@H�5W�U@J�	|U~@Kcd���@L��'vW@N�ÙP�@Oq���j@Pn�	�P�@Q(�^|�@Q�F�7��@R�Gg���@Sq�>�7�@T=�D��@U!R���@U��d�@V���Z@W��Q��E@X}w��@Yd���@ZO�ʸ'@[?��O�h        ?`�!�1Z?�$�N�C?�����?�cmb�?ɶk�\ �?������?�3�y�?� �:r�"?����:�	?�jG�?$?��K���z?��g��H@�O|��:@�|����@
��W�;1@���h�d@����@e[��@@�!x�G�@�4�a4V@�u�+(@!��PG�@#����*@&9��#k+@(�yyQ��@+C���'@.Z���)@0y�>e�@2S�ba@3�𦄯�@5^�Y��>@7-����@9o����@;-D�}@=#M�2@?O��4�@@�
Z��%@A��A&,@C3���fC@D{^��!@E��eF@G1?D͇�@H���7T�@Jw���A@K��kHH�@M;LƧ�@N߻z�>�@PI^��e@Q)1����@Rp>!CH@R�Σ� �@S�X�!�)@T��F��@U��1c@W \wt!�@X�=�q@Y,���:/@ZN���@[v����@\���_�@]� �# �@_���Q@`1�ck�        ?q/�}UG�?�PL=\w?�R�K=�?�3&_w��?�@�^F�O?����F?�j�A�?�=ܿ�T)?��[�� ?���'�@(@*d)s�@�[�b�@���=��@���	�@��T�@c����@A'�S�@|����@"U�3��@$�pX~�7@'@V�$g%@*)Ԃ���@-J�6��'@0Rb���@2�`�@4�n�c@6�.�L�@81�YУ@:v�~,�@<�sF|/Q@?b�s���@A6^�~�@Bi�4���@C���B@Eg8��^�@G &�d��@H��@��	@Jg����@L6��t�@N�B�q�@P�1�S�@Q	AD�0@RF�e@S,[1�u�@TL4�y8�@Uu�e�@V��E��@W�H��t�@Y+�C���@Z{|�|��@[��E�@]8mŀ�@^�{���@`&_qE�@`�ro�V�@a��T&+n@b]��29@c,���S(@d ���@d�v�	1@e�)����@f��)_�@g�,M���        ?�_��`m?߿���ag?�2ےd�@
*�3�f@Rl`7T@"k���-7@*�P�[�@2p1�#z=@8J���l@>����^�@CC|{#�5@Gwg���p@Ll���@P��,�iS@SW��6�@VQ�n�c�@Y���h@\SkV@`J[E- �@b:���@dGG���@frV�s��@h��`5��@k#��,��@m�B~�F�@p'�J5<@q�$7�*�@r���Q�@t|�����@v\�|XJ@w�Z��<�@y\� F�N@{�8�Q@|���ض@~Ȝ�arf@�[R�w�@�Y�1�>@�_�f�YJ@�n�� �@���bf��@��s�>�m@���o�9�@���+2�@�)Q�5N@�e���f�@��f�hfR@����j\@�J�|�~K@���Rz�@��B�0�J@�;	�"ֺ@����Ft�@��Ur��x@�s�>(�@�9M ��@���{B@���J�@��2���3@�v[�g¼@�OsA���@�,x�O�@�lX��^@��M4��        ?hP8�LX?���P�m?��e�;�?�U�n\?��Or]¢?؅A$��h?��Kl��?��g~?�=��-��?����ag?���$��?�Lt�N@�"e�@8��r�@	��n&�@d��Ʋ7@�!0�Q@�估Nb@)C��}@��@7o�@���]��@rR��`@!(� K@"��+
@$33���@%�y�.hY@'z�19`@)5���x@*���U��@,���2�@.�=����@0\iW�P�@1_��y�@2j��ύ~@3|�_��@4��%o��@5�0�� @6��X��@8wH-�w@9I~ڙ}'@:�5�#)0@;Ю*@�@=��9e@>wOUQ@?�'��	@@��=o�T@AU��d@B@�sbp@B�z`���@C��T$S@DZ��;��@E%���
I@E�[=�.!@F���Ɲ@G��� �*@Hx0>��r@IV�%�@J8����)@K ����@L	Av�z@L�M���@M�G���R        ?`��G�j?�����?���t��a?�?m&Y@?�� �O�?��6�YeM?�~�]Pc�?�e܄;�?�ǡ!�i�?���K~Z�?���N��@ ��B��@��n�@�<N
,�@���l�!@�ީ�r�@��S�7@�i��}@���p��@x;�P.@!�2��@$(��x�w@&�oF���@)D��o,@,Mh�.@/�nMf�@1#1��}T@2�3i3"@4��\�o+@6}/��c@8w��|��@:���B{@<�C�L%8@?�Ѩ��@@�h�R��@A�7Pdr�@CA��ȊD@D���F�_@F��p[@G�/��q@It�R7@J��%[�@LA�d�J@M��y^͓@O��2�RL@P��^�з@Q��E|*=@R���sހ@S��?3J@T��bJu@Uʼ���p@V��c�W�@X$�xi@Y.��q@Z`eFlY+@[�}͙v�@\��k}j�@^'�;��@_{o���@`kv�kn@a��T��@a�*f�@b��\�}        ?G��4��?r�}�ͫ�?��S8�'|?��2[��9?�a��m�<?���L�m?�]���?�E�JR�?�\�^��?���i��?�ה��(?��8$	�?��o��?���>JG�?��F�|�@ �_��@�c{[�@v�H�:@
.�gv�U@C�|:~@\� p4@�Klԭ�@i����a@>��h@K2�B�@��p~I@!�pp
�@#d��'{@%`����3@'{��[K@)��I_<@,�P��^@.��� @0����@1�����@3kW|Ƭ�@4����@6��Sz)@80&|�I8@9�YW	-@;��ný7@=�Mmͳ�@?��lr��@@�R)��@A�_̯�@B��#P��@D�b��@EH�	�a�@F��6[�@G��澦=@IꪍC�@Jg���0@K�ɖ�Ȱ@M6Ԣ�#@N���@P��k��@PߗVٱ�@Q��7*K�@R}ն�oA@SUD �^�@T2B	Q�)@Uҋ��@U��ٓ�        ?����3�?���d%p�?��oɞ�@ ,#`(��@���`MK@��$CP�@ �c]Ub%@'	"�BR(@.].�Ot@3[ ��Vw@8G���@=3����@An�>@D��î@G�#�t�	@KT��CE @O`��,o@Q�M+�� @S�:���@U�����'@XP��@Z|븵�?@\�L�_�R@_�-F�@a&��
�@b�i��ܝ@d]E��@e��q�x@g�z���@h�s��g@j[D��Tn@lM���@mֈ$_�6@o����@p�:͞�r@q�D��@r�p���[@s�c�S�@t��]�@u�s�Tg@v�ሯ,�@xi! X
@y*�!�@zU�B���@{��[��@|����a@~ �G�o�@GM���@�Jva!��@����s��@��n	p�@�S�!Ƹ�@�5(��[@��I)��@�{����@�:�*��@��P���O@��D�,;�@���,P��@�Y�����@�*�!6�@�����6�@��z�\��        ?^Ƌr�@�?�y��!;=?��:1��?�����[?�tr;,Y?��L�?��>[�o9?�|�s�?�فE�v�?�{wH��?��ȍ"�?�O�z؈?�Z��?�B?��y[�@ �A8��@`P`F��@(�A�L@	"7D4�@M�K��@���6��@����	V@}@�j�@vJ���@�=1��@�垗��@�?V��?@RN���@ c��*Zs@!�V��@"�����#@$]�QBZ@%�t�C�@'A`�n�@(��NO@*WA�~Щ@+��\��@-��`xJj@/Uco\�@0�3�Bx�@1s��Z@2a�jk@3V`���@4Pyjo�@5Q	�Qr@6W�7�P�@7d�:���@8w�f�!�@9�6�"@:��RK@;�SPӴ�@=[��Q@>4��N�@?ms�S�@@VO�;�@@�%�j��@A�G�Z0z@BH�k.�Q@B��x=�@C��*��@DY���@E#���@E��I@F��S�ǖ        ?Nq�p��d?{
d9���?�s�k�L?�D���2S?�A���v�?�voC,M?�*|�#?؟�by&B?�Ec_��?�]3���?�� ��?��X��?��7v���?���5PD�@�oC(�@Xߤ+z@
��[�c�@7����#@0�f*�@B]��@!�*��@���e�Z@-v��@!�(�)��@#�����@%����(�@(m��?1I@+	u���8@-���}d@0a;����@1�	Z��@3��i��o@5T^>�@7)<���=@9�Hq+@;���K�@=8g<Y�@?n6��
�@@ޯZ#;@B��8F@CT�D-@D�&~&�@E�e6�=E@Ge���@H��ڋ�@J_i'N�k@K��ח@M�����@O<���)@P{���@Q`d�&��@RL T�@S?I&��@T9<��s�@U:�;�,@VC��-5�@WS�NL��@Xk����@Y��U�a�@Z�hϊN�@[߯�</@]��x�O@^S���        ?K�����?vT���?��|�
?�ft�@�?�:�ۼ,?�3$K�,n?��q��Jr?Ӷ~���?ۚv^�j?�!U�g?�e���Og?�/j��?��Q��?�A�#{B?��<H�*@g��u�@��|X�@a\J�u@��D�@O�n$<@Q��C�@���@f�(j7@7�L�	@:<^���@ 6��`�s@!�vt��@#��'��@%�)��d@'�%iz��@)�#`�N@+�'��ã@.3S�z@0Mc��@1�N�L��@2�|��@47�_��y@5��[��@72���@8���$@:,��\�@;˦M��7@=x����@?3]�R�@@~�S+@Air�y��@B[��ny@CUz2�<�@DV4���@E^!��V@FmK%�$:@G������@H�iz]@I�c�c�@J�P�^'@L&%�H�@M`䷸)@N��}��@O���z@P�!aٟ9@QI�Ft^�@Q�u�'@R��z.        ?�wQJpA?��_��	?�]^=z?�����
@ A����@	�>;�57@Z3NH@k��%�@!�m�Q$"@&i�Z�t@+��r�@1Je�Z2@4qu��|@8&@a'Y@<,GƵͼ@@B&�F@B�^���@E(���@G��v�E�@J�i��D@M�I����@PY�hK��@R�Ow�@S�'IK� @U�y@�&@Wux'�o@Yp$��hm@[�M��"@]��Fգ@_�Kʀ�I@a�/d\�@bE��(@c�%=��]@dƵ�XI@f���GC@gp�v�x)@h��Bo�@jC��-�@k�p��5@m?�f��@n�߭��@p2/5.S�@q��K�@q��<���@r����@s��c��h@ty�S��@uc/P�(8@vRqgɞ@wF����@x@R����@y?�m�@zB�Tg@{Lއ&�@|Z�=٨"@}n��c��@~��3��@�fp�Q@�e�_w\�@��$5Q��@��Ut>��@�.~���t@�̨˜��        ?bP{��N?�c��:?��C>\�?�ڕ�X�X?�W�5;�?��G�-q�?�Tq���?���8���?�Ŏ��`�?�g���?��>.�@?��Y��?�� �@ XE\�}�@�wp�@ ��\@	';�U�@�2ro�9@�sc"�@�2`���@���q@ɜ�|�@U�x*��@�����@!���њ@�B�j{@!/&�t�n@"�`k�A@$��� @%�$�@'�J���@(�^���@*\"��@,����@-۫o�PC@/�Z}�X�@0�p�f��@1��$�@2��I��e@3�d����@4���b�@5�I<���@7 M�Y��@8 �%�D_@9HS��m�@:vG��E@;��^_�@<����}�@>'�(� �@?o��z�d@@_i�t@A
����@A�����@Bif�'�)@C�|�R@C����@D����@EO��v�+@F�aVė@Fֽ(n�n@G�D�K@HkT9h@I:LV*��        ?Q@���P?~�����*?�R�)a��?�3�a���?���5� x?�1���t?����?��e�yq?���1�/?�&�Q/��?�s^�,qb?�g�g�?��=�?�?���L{��@�B#c@an��@
#
�[6�@�HL�S@�}�oHp@g\�Ѱl@OfQ�WX@u �S�@��܏V�@ ���(:�@"��R��@$ǸP��N@&�Jߪ=�@)W,�ڮ@+��)�j�@.q�-@'�@0�.~��@218�G�@3��k�_o@5*@�k�@6�z �@8�a$?�@:a�c�%@<C���k@>9��tp�@@!p�=e @A/�L�@BG����	@Ci�!E��@D�r���z@E�1��-\@G
�<�N�@HT���o�@I����@K+W �@Lo�\�yq@M�FIv@O`���@Pt �"��@Q=5�V@R�*\QD@R�XX�J@S��k�A@T�W�Q�@Uz�EWa@Vc��{1@WRB�.�@XE��&_�@Y?n��B        ?QϢO:P?zpX�he?�7Į?�vAG5K?�Q���?ñ�j��?Ν�0��?�j���@?�^�&�"	?�.l!;�?���	�?�̡�m+�?�X�ݞ�?���,��@ �>8M�@!~{hV@��՘@Ixpi�@X����6@❷(��@������@�a�2}e@��A�`@{a�@!�+��@#��e�E@%�y	���@(0-�-�x@*���+B@-K2!9��@0
%�	k1@1�%yD;@3�B]�@4�=�q�"@6m3e�ۑ@8<Vue��@:"�	EO@<ѵ1@>2�y�CH@@/w�;@AQ����?@B���@C����Y�@E���}@FU���N@G��~�o�@I$��Ȭ@J��<]�@L'ӪM�2@M�j◺@O`}���@P��#��@Qg�l�n	@RMӕ�<�@S:�?�n@T.�jp�@U)�1��@V,9"��@W5l���@XE����@Y]��͝@Z|�+��@[��=�V        ?���6m�X?�jQ�{D�?㬱	���?�~�Z9̌@L8�t@���'�@g�� @�gQO>o@$e�#By�@*$\�@04�x�Ƶ@3����K�@7��l�V�@;�+M�}1@@?tI��(@B�`�Y��@Eh!
?�@HB����@KM8��}@N����| @P��Q,P�@R������@T�Иw�@V�Vz|~@X�wMk��@Z�/D{j�@]#~Z���@_}fm�ڽ@`�ta8�@b<³��@c�W��$�@d�p��E!@fPBO{�h@g����@iBܯ���@j̓�D�@lc����7@n"���@o����c�@p� 7:�}@q��5}-@r}�o�"<@sj�Vw�@t\�w.�@uT�NU��@vQ����@wT�:��@x]��z�@yj�2�[X@z~d��a@{�^�Ä@|���oU@}����@�:�@��W_T+@��9̖�@�Q��i$@�����F�@����4��@�:�M�@��)�X@��w��@�=m%M        ?T�� ��;?��=;��?�3�?l2?��n�u��?��0����?��e�h�?Ҳ5�!*?�C%ӑ�?�>C�?��BA�r%?�#�r�R?�?T*M?�gǬ��?�||���^?���4 ��@eѮ��@��ry+@��s���@	���nU�@
E�#�k@8�U��@mG�;�@����@�<�,2�@U-v�@6�S�@��x@��Y�,\@ ���s;@" `hO@#Y�^�?�@$�^��@&1�鞩r@'���p#@)<��A`@*�]PC6@,zga�]@.,�e�@/�Z�)˰@0ڨ���M@1�~ڗ��@2��vBq@3�T��ץ@4�]Ҭ�@5�����{@6��c�x�@7�!�@8��F]"�@:�+u@;1���,@<]���V#@=�p�@>�h"�B\@@c�ez�@@�C���@AMN�ܕT@A��~�m@B��xQ��@CRV��u@D�m
;�@D����@Es�Q���@F/py�g�        ?Cm��q�6?rgA�ܵ?��!�J��?�����t?��YH�Wo?�<��U
?ɷx�u�/?���\o?�$j^�?�p�ژw?�a����?�o�&�?�֎�d�?����/��?�D'��@���@}ͅ��+@	Kk��e�@}!p� @
�Na�@�>6�~L@C��a�@2�ڼ�C@Y��@�@�1�4)@!�]�Nk@#�e���@%�'ȩq�@'�V�@*8n�K�@,z=��@/��g�@0�C�Mw@29��o��@3�-LIi@552����@6�%ɫ�C@8t/���@:-v\�t�@;�!>�s@=�R��7�@?�)��b�@@����~@A靿���@B�TK}�@D�]��@E9��(@Ff��v�@G���gC`@H��x�V�@J$%�GG�@Ku���2�@L� bd@N3��@O��lN�@P�F��r�@QJ�*Ji�@R�	��@Rׁ
�F�@S��[�@Tva6�10@UL��/�Y@V'h���        ?D�jK3�?q��ԃ�?�hm��&?�j΀�??�F�~��?��k�,?�z5Kۑ�?�T�xu?�-WT���?�@�M��?�8F��?���ҶZ?�I�9��Y?�;J]�+
?��b����@�L���@;u�F@
:�ڙ�@���;�@�U>sj@i3@��B@L��5v@mW�ي�@̼.�e@ � ��@"��]��	@$�k2<.T@&�(��$@)Ba�S"�@+�����@.Xq�K�{@0���Iu�@1�i��~@3���.�@5�6�v@6ǩ�ϝE@8��J^G�@:V��M
�@<;�^Ş@>3����@@��#�=@A/�l1@BH]6W�@Ckn���@D�D:@E��q�"d@G1�Ew@HYB��c+@I�
,,@K
�S�_@Lq��3��@M�wPɉY@O\�k!�%@Pp#@�	@Q7W�m�2@R����@R�l��@S��P׺W@T���C	@Uatн%@VE�y`�@W-`D��y@X��]        ?��K��?�Ʀ�O�?֟ ��er?黃+��?�����|@{
��50@#��/?�@{Sx"�@~�����@!П7��#@&sa�@+��%�@0�<�ʩo@3�f��� @7lO=0@�@;8�Ĝ��@?S�?@A�
y|�~@D:x,G@F��W��E@Ii����@L<=�@�@O7[W�N@Q-3��@RҲC?��@T�,��3O@VY�{;@X;��%Z@Z0�T��@\9�艩e@^WBtNv�@`DE��6@afئ�3R@b�Q���\@cɩ�qص@e	݉Ul;@fS�dB��@g�Բi*@i���A@jmG����@k��[I\@mZbÆX�@n��2���@p7��´�@qXNQ7�@q�J���@r��`sC5@s�Hg��@th�����@uN\�~�{@v8Ν#P�@w(+<M|�@xm���@y��8�3@z�[�Ĕ@{D/�u@|���/@}*���@~;�R�`@P�@$x@�5}�4w�@���r�6@�V�w�@