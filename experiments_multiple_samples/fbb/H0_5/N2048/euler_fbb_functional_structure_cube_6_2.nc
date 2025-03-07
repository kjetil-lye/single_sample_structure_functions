CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T102736        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            ?�              ?��-�)��?�_���H@y����@���H��@!Bϕwq@*�M\~�@3I@�{��@:Ay� J0@A*�63�'@Eã���'@J���T�y@PU'�9+�@S}Z �g@V���?�@Z�v>��3@^�S���@a�(����@cϛ!�H�@fA���_�@h�����@k���F�@nozah�@p���Z @rI�����@s�k*m��@u�l��D@wdP�o�@y8��>�.@{_���O@}���]�@4*�@��?hv@���̆�@���3�@��fF`�#@�����@�3"K��@�h�v��P@���r VF@���M��@�5:^=@��bdR?@����3�@�AS����@�Tdi=�@���d�@��"�7��@��)�*@�Eg�c�y@�
���'@��3�3�@������@�l�|�5\@�?UG"@�{�0ֲ@��@¸*@�̩=_!�@����pD(@��j�2��@�z�g��@�f�W8�@�V�#��s@�Je��p        ?|P��s�3?�PgU[?�Wf�#�`?�#�!2?�IC&��?�`d3��i?�_�0>O?�/�K�^@�Ww�"R@��t�/�@\i��@[�xR��@ޠ����@�Xz_Z@�^+ pl@!8�&D~@#��r��@&D.�;��@)���r�@+���@/!����@19hQ�@2�~|Aki@4�Y�-�?@6˂�+-o@8��m75�@;����m@=f���~@?���U�L@AA��^�@B�(��-�@D(R���8@E��w�&@GuWgP�@IF堜V�@K7��Z��@MI~/J@O}.�s)�@P���ʋ�@R*N�݃@S}����@T���ŉX@Vf*u}y'@W��NR�@Y���`�x@[v��F�e@][�=��j@_]���@`��߂��@a�3w�L�@c�v'�@dO+�?��@e��2v@g��J��@h��[��@j��M�@k���O�4@mg��J.�@o6l6>��@p�h���@q�
F*WA@r�U'C0�@s�P,8��        ?�B��ƅ�?��֏��?�U�߯��?���y=<?�Y���?�ҏ	.ٞ@ �H���@`�,�`p@Hr��|@��U� @����n�@���[0@"�sr�B@& %�$�@*����@.x��y*@1��rm@4EW���H@7#@o�9@:@��}G�@=��ru/@@�8�]@B��ԑ/�@D�3.8A@F�&}�7I@In�RG2�@Ld��@Nز/�*I@P냵��2@R����@T8�ˌB5@V�
���@W�L+�^@Z�ҊTK@\,����@^w�����@`q���@a��q��:@c��U�@dz��L�7@e��T�ľ@g����K�@i!U�5_@j��{�Ȕ@l�^��I�@ni,p,@p'��`��@q$�&?�I@r+,?�0@s;Zon��@tU����]@uz�y;�@v��p�@w��K�&@y-i� �@z���K��@{��ʴ�b@}RH���@~��t/2@�.s>R3@���c��@�����;@����s��        @<�BxY@f/�D��@�q�r�@�6ue�M@�������@��"_�(@��vH�-@���,ʫ@��ݲ	�G@�^ߕ���@�� ��1�@̺j֠�@���^�@��P	�)@�6����@�p��f?�@��\��q@���p%;_@���s���@��|�0�@�0�ٴ)@�{�\�n�@�����E@�Y��"_�@�u�1J�@�ɐ���E@�(}�L��@��tC`�@�*ʧH'@��j�K�@��3�Fz@���S��\@�:qL�ӑ@�ߺ���@��o*1ǑA �4`���A������Ah��O�AR,Mׅ�A?���A1��F�A("U#9A"����2A!�}��A	#�0"f\A
*���IA5yz<�-AD���)�AW�b� Aou��b�A�Sf�AUǺ�qDA�o7v�A|�B�ϔA�$F�OA���ݙ�AH�<hzA����fA��׭�A(R�-PA��!NAt' ��A�yߘ�        ?D�G�-?V��Ydv?��;g9T�?�Pd�W��?�6 �?�4?ҵ�6���?�RI�� �?���Ӝ�?�=-�C?�'q�Xg#?�o��Ԯ?�*��N�U?�Vc���@x.�xn@{T	��p@��nN-@!�1;��@Ĉ9^�@���M�L@�U1���@�]�wi@>��f]�@�=ON�@:$P/�@��Z�9@!<M���@"�"Dp}�@$'���o�@%�މt\@'R�"�O@) �i�Y{@*���2a@,�p����@.rʪB��@03�\�@17x���@2D� �P�@3\H�W�@4}�o*��@5�A*Ѕ@6��Ѵ@8"vH-G�@9n�-`�c@:�Qq�BD@<(W��$@=���L�@?��BN�@@F�u���@AkU��u@A�9�Ļ�@B�,���@C{Ї5�@DU�&V�@E4o��4@Fd�N7.@G�^K��@G� �k�@H�/؞jm@I��{d6@J݀)�X@K�[���@L��e3�a@N(�{        ?*����?j#�_�?��{��?���\��?��
W��?��Kǟ��?���\�G&?�:=���?��*����?�"y�)�I?�,�*��?�G�����?��")7��?�%�bd|T?�0��|l�?���f�UE?���pd5?�/����@��Ӊ@ �P���@H3lOn@��x�'@�)I;@t�*$��@�"K @4! �@yEp�'@?臆�@!��z���@$��9|@&���;��@)�� |�@,���qb@0+P����@2qtpi�@47��z`l@6���k@9Ž��I@;���k�@>��7>�@@�R ��@B���r��@D~:D��@Fy�^�Z@H��xo)�@J��Ÿ�-@MS��|+@O���@Q\m��l�@R���@Tk�E�@V�囗�@W�V����@Y�r�4�@[��^���@]�1��)@`"�>�w@a.c�\,�@bf��Vcb@c��?�7@e��}5@fm�j�mw@g�<���&        ?�O7S��?J�fa�@@?lO�`z�e?��5oS�^?�iI�1%?���{�m?�̟��.?�B���s�?�QS�6�?��|��e�?�e��'R\?���p"^?��P^��?܎v���?�FP��?�'���w�?� ���:?���M�?�Iz)�?�@�%��O@ �%�d�^@�̣�@�^Mݸw@P@�@�Hh� @��1�xE@��R@�9�)M^@����@!�����_@$B��Kq0@'}sl3S@*5���@-��y�]�@0��z��@2�Z�1�@4�Ǵ��Y@7P#���@9���e@<�.�Ʋ�@?�-�Z@r@Apل��@C(s9@��@D���z�@F�t=�I@I��,y@K<�M�/�@M�8k8.@PxX���@QV���@R��?׼�@T-� �8d@U��C�dK@WQ�_��@YrP�'�@Z��W	��@\�e4�q@^�ǧqB�@`L�d;�l@a[^�n�@bu���<A@c�����@d��>3pI        ?�4�JQ?�S�21$@ߒ����@/��bV�@?�wb�s@Jk�n�]@S���
��@[��_��@bV�:�G@g`�Le��@l��0G%A@qqzV��@tć,�@xE>	���@{��,nY�@���@����0@�B� gFe@��8��@����)�T@��!�U�@�:o�z)@������@@��
���@�����K�@�!F��@���(H@��9�K(@�YP 1�@�9��x�@�-��.�@�!�H@�'R�C�@�>�۱�X@�_��;U@�����@���#6`�@��g(WW@�N��x�@�����wn@��;�2�@�w{dnj�@����@�x!.�\n@���v��b@�S���N@�(� ��@�-�l�g@������@��M ��X@��S%*�a@��#���@��^�v��@��v��T�@��Yݐp�@���i��@���M��z@���Ϗ�@��A��c@��ڥ��g@��b���@����m�@�CѨ��-        ?v��:��?��ڦ؁?�[��c?�F�%�~?���S~�@ ?��7�@��tzAQ@@��i}�@d�hjd@>L�o;@ 硒�/�@$�=1p@(�˝���@-[8�oM@0��ig@3��ɸOG@6m����V@9�.���@<�e�+�@@@f0"J�@B/��q*�@D?��\@Fp�<�@H�(/�$|@K4�zq�@M���j�%@P;��<h�@Q��)�Z@S{���@T�Wl@V?G�A_@W�r�|�@Y�>��L�@[yn,��t@][���A�@_P/[��@`���ƒ@a����2J@b�}�N��@c�+�[�@e��L�@fPs���@g�|�Uk@h�r_��x@j-ۉ1<@@k����f@l�QM��@ng��*X�@o�.8e[X@p��}�$@qy�já�@rCSY��@sw�=f2@s�ي���@t�S̈́z8@u��>я@vdO_㊸@w@ұ=�@x mi�s|@y6���@y�Kv1Kp@z�Є��@{���d�:        ?a��.�h?���0�*�?�/`���?��*Q?�5~PG�?�jӓ�Io?�D���@ ȸ��@S�V]6@<(��'@� Md̩@���l�@�� 0�@�6��z@ ���H��@#�@	��@&M�(5�@)J�pr�G@,}��H @/����D�@1é9/��@3�D1�@5�q|G�	@7�I5/�@:D=�>8�@<�a(�@?c�Sݸ�@A ��	@B���5\�@D8J�;I@E�:Ճ��@G�0N�{z@I���D:@K�L$�@N�s���@P6�=@QxO}��@R�߃O�@T5�Y�@U�	��Z�@WA.OŹ@X�F�q@Z� C��@\p
ٍ�`@^V`
m�@`)��Q�G@a4s�L�q@bKC*7u@cn��o�C@d�#�#(�@e���n@g(�:\��@h�G�߆�@i�;�c�~@k`�U�G@l�j(�r@nyc�\��@p h5@p����U@q�j�7@r��1�@s�?�{��@t��O�        ?�v���?���Bu��?����P4(?�/�y��@ ���ۗ@	�L�K�c@�|Ou��@����ժ@��oC�@"z>�x%�@&*K��E@*���=@.M�����@1d�� �@3�C�Q��@6W�eg?�@9�R0i�@<�/"�@?:QxK��@ARi���@C'�����@E�I�J5@G7ڹ0U�@Is�cדS@K��xu�@NUmP��@P}�쓟@Q��:xs@S\���p�@T�ǃ��M@V�}7��@XE��N2�@Z�w�D�@\ sk��i@^V��i@`�Ɔ|�@a0^/��G@b^i����@c���F�@d�����@fO��s~�@g�7���3@iN��A�@j�`)6X@l�q���@nk��oa^@p&�l�@q#�,s��@r-~��@sDa�h@ti-K�l@u�5vL@v�D~�@x/�	���@y��H۷2@{���@|� Kӓ@~+���@�f��g�@��V�~}�@��</x�@�|�����@�m�ߐ�        @s|wҁ�@G�ؚ��@gL�}�I�@{W�H��@����Ï@���.Hm�@�����@��}E2E @��Ǡ�c�@�^���K@�8@|y�`@��MKg@�%\^sKQ@��L���@�,%Q+:@�O�J�@�d�^�@�ȿ�P�D@���2m��@�VZ��@���Y�]@Ҟon��@Ԛ˸O�@ִ�2'�@��5�@@�>���	@ݫ�����@���q��@�hM�,�@����BS@�+�z��@���v�@�"@���@讛N�@�E*׆ @���#�`�@���-+@�G�'ȉ@��p!�KT@�k���%
@�YyfL��@�Nwz=@�J��bo�@�O/&�@�[N�8
@�o>�8�@������6@��Y�	0�@�ր��2@�����@�9��-*@�r�@��?�1�A v���|A�a�QCA�8�CZA]�f:esA)B��GA����DAR��3A����H�A��[[�AZ��p�        ?`�
��?��4�bd?�����C�?�N"�S�?�Qk�/�?�U�d�|?���!���?�)�fP�@�5a�(@	T�B�@��o�;@�J��@�|����@#�	��@ |����@#����8@%�\�&�@(ހ!��@,	����G@/d���ğ@1wU�7\@3Sm����@5FOS
�@7O��ô@9o)̰e�@;��GT�@=�<?�@@(����@Ad �'7�@B�.4c�@C�~���@EVk`}�@F�<�2�@H,Z�Dr@I��s���@K+형L@L�Y�x�@NQxd�{�@O�0��@P�#5}~@Q�?�9F@R��`�ձ@Sj��|��@TQ�,��@U=c�'�V@V,��c�@W ��;�.@X�6|@YZ<`�'@Z]�Is�@[�z��@\�� e@]$/���g@^0�Vv��@_@N���n@`)��s[�@`�o����@a@܋&�@a���Xc*@b^��d@b�َ�@c��W��@dW4�@        ?Bv�F-�N?��H��de?�<S�h�?��L?[?Ǥu�?�\��߀?ܨ>�g?�٩�.?�Ho\6�?��P��E?��tѮP?��۴�\?�s�A?�'@� 梭�@m��4��@
zd�%�@C��g�@$ؒ�p�@�x��@l���k@-�f��@ 1^�&�@"�,���f@%,5�ٺr@(�u�q�@+Q�{�@.�!�[R�@1f���@3�go���@5�K��@8w���"�@;A���("@>H�Nn�@@����Ѭ@B����^�@Du=�<�@F�	\Ⱥ@H���U�@K�:6\�@M�{�z�@P�A�{�@Q������@S��l@T��J&{ @VG��<�@X��S3@Y�f�5�@[�)�*�@]މ�R%W@`.D��F@a �(A@bK����@c�O���@d�&�of@f �"���@g�����@h�6k�>@jq����@k�?�L @m����_�@oC���T�@p~��Үi@qc$�d�y        ?1E�x��?hXrؕ;?�����>?�2l���?�6���޳?�Qg�5~?�?��g?��3$àP?�#j\��?�^q� 2�?�|���9?݋�Z���?�W�V�6�?�Py�?�iSW5ޯ?����>K�?��}+|�?���Вc�?���J�@ f.%��@,�ʠ~�@MRR��:@	΂Ko��@���N �@�S~�V@k�V�@�$���@�!���@��KP�@�βx�@!�6!,��@#�t�6�u@%�TKw@(& ���@*�5�H�@-d�T�	@0'Љ~�6@1��y$��@3cn,}�B@5+��� @7�8^� @9\R�@;9��u��@=}De��@?ᷡ�JR@A3�f���@B�^�2@C�o m
@Eg7\mo�@F��K��@H�x�T��@JD={��@L
܏��@M�6c���@O�o�S��@P��gm�g@Q�KKZ� @S{p�}�@T6�s��@Ud��/Nf@V��J��@W�F돣@Y2�        ?� W$G˫@m1�"3D@5�j��@JT`f��@Y.)x:�@d��Y/�<@n�t�$J�@u@k�:L@|3tp��!@����_@����j��@�x�I���@�qf�e�@�`��aV@���G��@��M0�b@���K�2�@����q��@����_�@��r���@��H��@�Z�v`S�@���{$M6@�N,�z�@�v��z��@��`�ӱ�@�:N��@��X�1��@�.t��ְ@����q�@�R���J(@��Oc�E}@���%D@�`R��C@���� @����ф@��d#!@�܁6گ�@�Իӗ�z@������@���힞�@�ڝ��@���
I�@���{@�	��� C@�"���@�?��&@�`Ѕ<M@Ά��}@ϯZ���@�n/J�R�@�~��J�@Ѡ�]D؜@�<8��@�فB:�@�xT�3[@��=,V*@Ժi�Fgh@�]��A]�@�l;�@֧�6̹�@�O*�5�3@�����Ա        ?w�LѯAU?��M��?�ڟ�e�?�6[tD�?�7���X�@U"y�	$@�_��@P�.��@�}cW�@ �bdk*@$�6m]�?@)�ks`�@.�'��s@2M��^��@5g����@8�O��@<W��{�y@@OؔS@B"<��f@DL�j5{j@F����X@I&����@K��71@N4֚0�c@PE;�A
@Q�!>�^@Sy�6(@UVбw^@V�	��@Xjk9��@@Z1�fm�@\
�`��@]�Pf���@_���@a0����@b;=m �@c2�1/-@d[�2��@e�A� �@f��L��@h�l���@il�|��@j�AC͖%@l6���"P@m���@o,�v�E@p[S��L@q%�uX @q���9��@r����S�@s�ځ0]@t��/`@uh��N?@vQ�]+�@w?�,$i@x2	E���@y)��z�@z'
&ʦ@{)3~�e@|0��E��@}<�DB�n@~N��4@e��~�        ?S���t�?��>[sy?��7�8F�?͘���N?ޜk�p��?꼇��\g?�쵂���?�`	��w@��FZ�@��IB�!@�,�`C@0R�E�|@K5���,@ �SC�>@#�M�v�@'l�j�+�@+{�#��s@/��(�@2}��#S*@5>a�E@8D��@@;�����s@?2(�Q�@A�>���b@C����8@F ���<�@H~�D�!@K.G�O$@N���@P���g~�@R>��r�]@T0z���@U�yY��@W��IK@Z��z�@\S���@^����N@`�Po�@a� ��@cZ�Ǒ\p@dӰ�'��@f_j�z�@g��^/��@i��G�@@ky���N�@mW���k�@oLL��/@p�H9q�q@q����6@rݬ�@r@t	����{@uB���@v��o�?�@w�z�O@yA�&���@z���00�@|4�Z��@}Ş�@�W@f�9��@��]��2@�n
��P*@�X�����@�L�A�J        ?K�4�>=6?��z&�T?�{6�<\�?�^�eAb?̂�̈́�>?�D�zb�?⎴伮?�mo��?���f�?�n}�1�?�۳���I@�#�'�g@�&@�v@��_g@��l�9�@�Ċ�@��l��@�9�f�h@ '����D@"�F�� @%���͛�@(�7�Aĝ@,�b�α@0Q���@2�*�7sM@4���c@7�c"��@:���X=1@=�c� @@����i�@B��2���@D�ײC��@F�Ny��'@IK�ب4�@K��i\P@N�����@P�3v| o@R���:K@TE�,�`@V$��ô�@X%_�N�@ZG����@\�fT�@^��J'0l@`�?l�@b!�_�@c��D�@e����@f����@h7*U��M@i�؅tI�@k�o<�s�@m�:�Q&�@ohjf���@p����{@q���K��@r�?
�e@s���S^j@t�8�E%@u�]�x��@w	hQ��@x-��O�6@yX�q�7�        ?�I|���{@*�e3|�@KÅ�0{�@a����@q���@|� ��@��_�b�@�Q�����@�Q�^���@�;�DJ�@�r ����@�%e�sMq@�7��2�*@��6��)S@��j_�@�V���m@�!ԡ�@�A���@�L2����@���V�@���U�l@ÉKD�8@Ŋ�z��@ǧ��ZjV@�� 4m@�6��l'�@Ωo��W@МjM|!@��8^�B@�Y(*���@��n����@�SC����@����k@ٌ��6{@�A�P���@���u@��J�}�5@�c�����@�a�ϟ�@�g+�@�uд~f�@�o	�A@�ӿyF+@����v%�@���a@�C&	�@�'?b��@�ѯ��@�%�{P�l@�kM�@����}m@�ʌ@�dP��I�@�"����@��'��@�F@�w"\e�@�F)�Ú�@�gڮQ�@���+��=@�̦<��p@���?Q�@��9Z�W        ?u?8 �Y�?�H�%��?ō��$U?��ֿ���?�IyNx�?��R?�7��D~@CjH�s@
ӳ!_@%���%@U��y@�lC[�@:7׻@"P���ڧ@%S���I�@(�
�e6@,�7͙@/��6�@1��)�>�@3�W2c`@6,�?��t@8�q�`@:�ϓѴ!@=��^��@@��Ms�@A~����@B����@DsUT��@Fg��ha@G�j'E��@IJ)Ռ�@K�`pv@L�ο���@N���g��@P>��M�@Q6J;�5�@R4`���@S9,vKJ/@TD���:@UV�;���@Vo�B��@W��Xt�0@X��*Chf@Y��6���@[���@\DS,/�@]}�b�LO@^�"�vC@_�mFQ@`���t@aA�*��@a��in>@b�Ii�d�@c.���n�@c�%8&��@d|ˀ_`�@e%�Q?��@e�$80z@f|�h~`@g)���jz@g�k��C@h���@i>��9%/        ?P5D�e'?y� �B �?�g�pa�?�?����V?�r�m��?�<�N�J?��~N?�M���?��K�H�5?�̿E�'?���GoU?�nk�k�?���-=�?�K��Y��?��EPZdZ@�3 ='�@c�ܩ@
X�3��@Ԭ枑@��U�x@��`	�@�.Kl�@�����@�#��Ǆ@"q�1o@$���> @']C��@*t�v��@-��h}'@0ԑ��@2ꧩG�X@56��)��@7�ۿ5_h@:��D��u@=��D]YN@@l�M<�@@B;{.Zn�@D3j|�K�@FWsmJec@H���@K/����v@M鯞�˗@Pm�"��0@Rt1g��@S�⛰�}@U���)u�@W��z�ƕ@Y�����P@[ޯdt�.@^Aŗ�I�@`e�"n�m@a��+��@c*����@d�f��@fC)Ru�@g�a�ש@i�3��%@k��mr�@m���{E@o�����@p�s���,@q�ȋ�t@s��#�        ?u٢��8�?��<Ή?�r���}�?ґ����?�f�M�E�?�5��=�$?��x	Ȝf?���j�@�H'ߣ@�9^Wd&@eD�[��@�7g;*@0N�1�@�U;��@���h	%@ ST��@"�����@$�h+V�@'g�|G�/@*�|@,�#���@/�#��#@1�_31�@3-�ޓ�@4�Z,.q�@6���tVG@8�_q��K@:�pg��0@= F���i@?LID0@@������@B"d���J@Cz+�Ye@D�	e7�@F`�2Β�@G�Ȱ̞A@I��H�x�@KM�5�a�@My��@O �� X0@P}�9q:�@Q��˗@R�ٵ� H@S�8�o\/@T�g�Z@V2�ܨgW@W�"JRf@X�R��{@ZTk;/+�@[�� @]t�S]�|@_%�$��@`wA����@ah+��@be�Nd8@cpʖ��@d��{X�@e�ѯ�� @f�sB�@A@h#�?��@ir�噱�@j�����@l:�1Mt�        ?�x�Ga��@&���(@C�a�Uȉ@V���sP�@eR��2-@q)�y-��@y/&�~_�@�U{�yZ@������N@����j?@��~���>@���1d�.@���z�~@�>����
@��^n�@�zZ�;@���:��[@�ΰ�2�@�����h�@�U���L@��?��M@�����c�@��I���@����w@��ӣ�°@��#5El2@��;>��@�1ɓIL@�e��,��@£��ۅ�@����>��@�=t�?�@Ƙ�E�@@��U���@�kr`F��@���q?\s@�c�,��@���$"Z@ρ0b��@Ў�
&�0@�a���g@�9%�Y܇@�Ӊd�@����� �@��B�{�@տy(N	@֩�����@ח*#���@؆�u1�r@�xq9�@F@�k���!~@�`���@�W�A��@�PWZ���@�J�Y6,k@�Gk"@�#5r�I@��6=�@�&�U;@᩷O.j_@�/F��@�5SX3�@�?Q���        ?oФ�v��?����2��?�~iW7{q?܀�7��?��4z��q?�#��Dz@d��:@`D�*�@<t�8�D@є�y�6@����@���a�@"ǘ�fL�@&	��|��@)����@-7�8j�@0�OI;��@2��!a�@4�2/S�@7��7R�@9�w�/��@<iχ*@>�X7-G@@�����@B*�6��E@C��-kt@E?� ��$@F� Sl�@H�MTP#@J\��gfN@L2��/�@NRp��@P	V44��@Q��@R"[P�g@S0�V���@TOk9��@Uu�"|�@V����e@W�Pհk�@Y�iO��@Zj�4���@[���,j�@]�
'kD@^����
@_��)�@`�cy��@atd!��@b8f���@c K�J�@c��n�@d��9�@en���@fFr�!b@g"NK>Ŀ@h�Z���@h��/���@i�˄��@j� %�W�@k��@�P@l�8���@mǠ�UU�@n���Е        ?b�f�h�u?����4�?��J��J?�\(���?�x�e?��&](�@C��/�@/̈́�.l@�[rּ@NH���@��Mi�@!���^�@$��Ća@(A��@+�]_��@/���4��@2��3�`@4A �HE@6�C���J@92�W��@;�w��@>�7�9b@@�^��@B���^"@DGu��&@FN�˚@G�,mW�@I�*sj�@Lk��@NH�'}@PH�ohR�@Qy��y&�@R�>���@TB���@UW��� �@V���`�v@X)�J��@Y�t�*�~@[-vo�cD@\�-z��@^c�� v@`	��L��@`�i��D�@a�|�Cω@b�/ >$Y@c��ݺ%@d��`/�e@e����,�@f�QY���@g۵%�ȳ@h��$-�@j$��2��@kV�@QdR@l�~�|ץ@m�8ݑ��@o"�Q�@p<���@p��MpyI@q��S�@rZ����M@s�Gq�@s�b�{ �@t���e�        ?Wl�!+�?��d`���?�b��G?���^g�?��V�?��s��o�?���l���?�w�%#�?�f]^�m^?�
���?��Yǚ�(@q�j� �@���5�;@X���#�@�~����@��Y���@"Lp�U @ր��@�>���@!�k�!@$D
����@'	h��@*d���C@-j�J�aN@0�Ā+d�@2����A@4�?4p��@7�NB�@9���s@<_��/-�@?[�m�pn@AI=�̾@CVG��r@D�S�[tY@F�JO�;[@H�#��I@K4�H�|@M�,�zf@P�8%7@Qcu���M@R�,f�LP@TB�
2�@U�6;���@Wi����@Y�Ϯ"�@Z�ј½@\�K�蠯@^��%���@`B����@aF�i�.@bT'��@cjP�t��@d�:�dC-@e���t�@f��a�@h�Ҋų@iY�ђ�@j�O4���@k�3�:@mI�m@�#@n�L~�\�@p	��(�@p�_
��_        ?�~�� [^@-R%�%��@PVo�u�@e��p?JG@u�J]�m\@��,5!"�@� �E.�F@�����p�@����@��*�:$�@�c�1q@��(��d�@�N���o@�*{{�@���YX�@�j4�v�A@�L.5v@�S��.��@�����[O@�j8Z�R@�'w��@��z�Тf@��� �-@�֬�^��@��
OXI@���'
@�:�����@��!Aj0@�����@�(���@�j2IB	;@մ�+�A�@�J��&D@�d	͗aF@�ǩ7ڠ�@�2�����@ܥ�>u8@�{8���@ߟ��Os@��e�w�H@�Z�+�:@�&Y�`
�@��w��@��B{|�@䞆����@�w���X�@�T;;M@�2��-�@��1��s@��%]�@��Lٷn@��Tc�Wn@�wh'�@�"���e@�����@�rc;���@�hW�W<�@�1���X@�&v{��@�5���@�B���@�GH�p�@�ղ��m�        ?���H,x?�`�h�Jo?� �y��;?��w�_�@
	d��@�K����@(�n2�@$��t`nn@+"h����@17��Hl@5Ji49 �@9�U6�i�@>�Ido�@Bt/�@D�-K_�@G��k��@KA�	�@N��u��@Q@^l�@S<�r+��@UX��
 @W��!���@Y�X<fw@\g�?��7@_���@`���Gh@bOC�
w?@c�L�.�@ecϱ|��@gXU\�[@h��eU��@j��[���@l��V��@n��X\q�@pW��!@qt,X�|0@r�f
�fs@s�۬�;g@u�oöS@vs��.�P@w����8�@yL����7@z�io��4@|`�t
�L@~ z�s�@������@����=K@���/7bt@����V}W@�{|����@�v��F[�@�y�����@���֮�.@���zc��@��<��F�@��Rՠs@���;@+@�)A��@�`��9�@��t�~R�@�商��D@��w��&�@�C�3��4        ?\VoVI�
?���'��?�G_A{Ï?˽�k:?�z�i8?�g���?��Yv4n�?��Ė/?�7�,�@���@JhR@�46Ɖ@,�p���@qN�&@���N@����@ C��~j@"��f��@%`;fr�{@(NB\#B@+��1̭�@/n)ɪ@1k)N�x@3��Z&�b@5��)��@8=�I��@:�p�De@=�3Bw��@@z��-@@B+ԈЉ�@C�M����@E�˕>�#@Ha�B�@JPt����@L��&?@OU}*o��@Q��T�@R��Un�@T"r���1@U������@W�%17@Y��e���@[�+P��Z@]���P�@_��D�t@a-y���h@bn�B�@c�Y�#,@e$Hy�@f�f�(@h�F�
�@i����x�@kd	��,@m!�s�B~@n�C�	W�@pj�.GM@qe��#@rhuJ�n�@st����@t�h�,P@u��tsCY@v�+��;@w�5<�J        ?|g�J�Ƌ?��7L��:?��*$��?�_���	t?��܁G �@Q���!@0�Z%e@~�:7@ �=�0ݠ@%`��ڽ�@*�4�5$@0� �]�@3�r(�@7�{��]@;�X��\�@@=�4TX@B�6)uV@E{��@Hu_��n @K�zv�JH@O7�r`@Q����@S����@U�t4�i[@X9|L�eh@ZҜ=�;G@]� �*`E@`Qr�^<t@a�l��o�@c����	y@e��~��@g�|��@j1��@ @lԳ�P�@o��,+d@qr���@s+}��=�@u8S��@waA�+�@y)��ݖ@{qB�1�@}�E�0�@�9h�?
:@���׃e@����e-@����Y�{@�!ʷ� ]@��GU���@��G�yP@�[�L4�@�A~�S�@�;&Еt�@���@�i�@����a0@���|pBs@��>�E��@�){H[A@�e���@���_6�@��E�͊@�]`��c@��XȆ�@�;U(w
�        @v�W�
@J�Mz�mU@h/�`��@|0�w<��@��z�ٙ@���L�Z�@�k�L�I�@�����@�^�����@�U���@�cC>���@��!}'$@���x+�@����o2@��^$�y@���
!�@�#(Wi�@Ύ�0D�@� Xt��y@�H�d$!@�0u�a@�j<ǒ@���4�S@�EU)d1@��?#(�@��aɭ@�N�I���@�ة#��@�v��hM@�*O2�:@������I@��}�@��c"b�@���AyM�@�8��y@�Ȃ��7@����n@�5�� �U@����@���[�@�e�o)�@��h�w�@����q؉@�,���@��M��T�A W�tB��AE����A:���ǎA9&5�`�A?��rAN�u>�qAf]7�	�A�[�b�BA���r��A	߳�*�A��;_AZhS��A���ڜ<A����4A'q�>t�A��D�HA�71���AD3����        ?�Ȏ�cW?Е��u܃?�/���?q@]X��?@�{�K@	����@"/ц7>�@(��!,a@0G�٣
W@4���mQ@9k��A@>���%�T@B3��GV�@EF�sz�@H��i`B�@L
}C:Pl@O�-�8�@Q�c�@Sһ��@U��hz��@X(D�J��@Zuێ�=�@\�>���@_U���@`��%��@bFyI۹b@c��7H�#@ew��X�@f��M�^�@g�\s�@i�*�v��@kE�h@l��L�4�@nY@S})@p�G�i@p��&6��@q�C��l�@r�%��l@s����cT@t{8�ܾ@ul<fг�@vaN��@wZ/�yj�@xV��p@yV���6�@zY�If�}@{`5�|,w@|i-����@}t�j�^�@~�`�b @�8e\b�@�RC��@���&G�@�f�m�5�@�򧤈>I@���{��@�z�I3�@����5�3@�,�A�&@����@�PC�j*@�㾂�wv@�xT�Ќ\        ?L���iI�?��g��2�?�m�;�?¾q=kww?��w��?��%��H?�d8gN��?�K�BE��?�I&��!9?�3/?���@�FMj�@��E=�@�I(��@��=A@*hNn�@�B	��
@c�tC-�@����@"(1��@$�Ms;<1@'D�#x�@*<LX,7>@-w��0Q@0}#���@2e�/@4wa��Vv@6�y���@9"��xA�@;�8�O$@>��G��+@@�z�D�@BoH� �@D,�t��8@F�;*>@H^���x@J�{��@LP�R�#�@N��0�c@P�8-T��@Q�.�/�@S1#�Y�!@T�����@Vk�߷@W�І�>@Y"mP�P�@Z����>^@\i�i��@^ 6�;j@_�ߴWٌ@`��I�5�@a�����@b�G@@c�)��@d�Z�R�@e�
r�c@fӛ3���@g�i��}@i�'�Y$@j;��x�@ko��� R@l�����@m������@oG�{��        ?~��ڇq�?���EDNE?���XN�?�\��a�k?�n9��?���_�I�@�y��@
���'9m@;X0�?F@���-�@^����@�!=��@"��f;��@%�{ 7�l@)>3�w8�@,����fe@0� �tQ(@2�2O[$o@5�]�@7�N�W�@:edSڦ@=^5A���@@GQ��D�@A�@t��@C�$wO��@E�6�*@G�����@@I���j!�@LH
��J@N��e2�j@P��f�@Q��ekLb@Sb�2v��@T���@Vi�"��@X6���C@Y��/�j@[{Ht��@]R2^�@_<�d	��@`��#�@a�W�9x@b�D�rE@cݵ�(�@e
W`��@fC���)�@g�ʮ, @hݙWC�4@j?n��d�@k��⯺@m/�Vw�@n��7�,@p.0gɢe@q��H�@q�|z]��@r���i�@s�O^ݘ @t�Ӓ�F�@u���05j@v˕��n�@w《�$�@y��$T@z33�O�&        @Ő�X�E@Fm�O�\�@d���@D@w����3�@��Q�ͫ�@�W)�y�@�"K1�+�@� ��%'/@�SP�K�C@�"i9��@�D
łR@��8Ԛ��@���__�@���gښ@�bo��@¡� L@���-��@�xe��@�G�Rm�@̽���4@ω�)��@�81��)�@Ҹ�6�g�@�F�̨c�@���[�@׉h~[{�@�>$)l�@����fF@�ͫ��|�@ި9U��3@�G��D�@�A/C��@�@�<��@�F�E��~@�Ry>+@�dH�=E�@�|�/�@�����@�Q��_@��vs�@���63X@�JPfGr@�I��i@��ee5d@����1�@����/�@�NR���@�������@��w�B�@�Lzo@�����n'@��U�	��@�XP�$'�@�	���=@��A�8�@�p<�5� @�%�~�) @��Z��Ԙ@�����:>@�N=��l
@�	l|@x�@��#� �B@��k����        ?`�	JYu?��s.b?�����h?����r��?�崴�!?覄��#�?�]p���G?����c@ 䘙vѢ@�Fy�j@
�t���@.����@BJ�FO�@�#^R��@ ]e���@���b�@ ����І@#])ϓ@%NHf��@'�E�;�^@*����@,�sk<t@/?6e(��@0�h��T�@2gv��t@3ݞ|���@5_��L[@6�����i@8�J��T@:,^,Lg@;ܹ�D�I@=�,o\[@?^�'���@@��0�@A���i��@Bxz�#��@Cp�ۘc�@Dm�9��0@Ep �)*@Fw�;z�@G�	a�@H�����@I�� �g�@J�����@K�N�-Q�@M�O`��@NM�̨F�@O�HŶ=$@P`w���@Q겐�w@Q�y�P0�@RN�C�@R�ʖ >@S���k�0@TWd��B2@U\wp�3@U�av��@V|^7�)@W9@5W_�@W���4i@X��	���@Y��9u�n@ZIZ��,|        ?P)=�>@�?�15����?�yJ�:?���p��?�3�|���?ݧ4����?���^�j?�ɘJ��?�g���?�e���v?�ې�$�?@櫋Mc�@���(@���Sl�@e�/�x�@@6��j�@{M��ȟ@�N��"@�!H+M@x�}l��@��?Ք�@ �� ��@"{?aJ@$���@&޻�,�@)a3���V@,x��]�@/K[��@11Di�Ã@2��MVq@4�>�L=V@6��)�	[@9D]*�}@;�Jѫ�@>X�!2j@@����@B�n�L@C�}d��W@Evdl)
�@GO�P��"@IH!�O@K`�k�b@M�rn�F*@O����M�@Q>T��@R���;�(@S�mG��@Uxm��@W
ҽ��@X�z��@Zs=��Tr@\J��Go@^;;Ԫ�J@`"u��NR@a4O抠|@bS|FNG@c�G�M�@d��1@fና�r@g[AX\I}@h�^�x�@j6|��U�@k��DK        ?FE>8��I?|�8�?�T��n]�?�E�\�˒?�Sq<��?�g8��#�?���a	Bj?�J;�@�?���@?��J�Y?�8-� v?���5��q?��"�!8@/���@)�J?@����w@gп��@�7��V%@!�D�*�@��%���@�\�s�$@�9�;@��PJ@ ��DY�@"�X�][@$��$@'I*�Ѱ/@)�s2~��@,{�6�{�@/_�|���@1<�I�@2� ��$@4��r��@6��c��@8�Y���@:����~"@=
�?���@?6�i�@AT�@Br�Ѐ@C��@E���ͨ�@G0@\^��@H����:@J�ӂI�@L�J���@O�=���@P��"n@Q�m�[�g@S�~�u�@TpєV��@U� 0I:@WYt��@X�+X~@Z�p���@\Q蛛�@^%Y��d�@`u[v�@a
IK�_�@b��~#@c3�v#hh@d\8 �"@e��@�m        ?�(��@@��_$@53��G�@J���m�@Yǅ�*�@e6���@oz�/v@u��*���@|����T@�$谭�@�[Q��}0@��`U��@��(Gʄ�@���
{a�@�e�!M��@�_�"�@��ɏ�2@��IT���@��V)qc@��w�h�@����9�@��Ω�3�@������J@��h�,ь@��Z��bP@��8ܢ@�@��r�yt@�����@�!a�@�#��~@�_�����@����r-@��=in�@�?�"z\@��ɬ��$@��Q0q@�[,IL@��E���@��nΔe@�טc�9@����^��@�X�P0�H@�e70�@��YO���@ĳ�Ֆ�4@Ń�_��@�W%�]?�@�._&��@�	lnћ�@��]�H��@��3߯�P@ʱ�Fٌ�@˜^=��@̊�U@�|��2y@�r	��}@�k�-\@�3��Ŋ�@гR���X@�4�si��@ѷ(���@�;Ar-s@��΂�C�        ?l^�s?�ݓ��v�?�΀svB?�&���?�H�yF�?�����\?��m%,�@-��o߳@�b�@�H���@&ݽ�Ʈ@G�u��@����r@ Xn��@"�A��%@%ԓ��[d@(�iT��@,`c�@/���w@1���S@3�7���@5���e�@7ҕx�f�@:&)y��@<��K�@?�&� @@�[�I�>@BH=z<	@C���^ZQ@EH�ȑd@F�'�B%�@H��coV@JN?#�=�@Lf	%9�@NRX�d@O�A� ��@Q1��o@R�Ę�@S)A�
�+@TK`��@Uu��@V��N �0@W�, ��@Y$�!��n@Zm+��R@[����o@]�Lh��@^q�]�7@_��;���@`��gF��@a]��q�@bG���@b���@c���sRO@dp�` �@e@&A�xf@f�-�.�@f�`�q�@g�
�I۟@h��T��@i��w#*O@j}c@֮@kno�8D        ?;T��?{EtX-?��y��?��
g�T�?�'��^��?֖�N��?�!��)�?���#In?��1�*�k?��EU�@ ��YJA�@Gr���@
�u
�3@Q=0*��@��8,��@��Ձu7@�P�'��@ G<ė@"��f�@%�����M@(�w`rA;@,.���@/���4)�@1�2�qw@3�f�{%@5�3"u�@8EpO�@:��Ѹxi@=cf6���@@��@A�k�V@C+��i�@D٬����@F��M̢�@H��b'��@J�I�/+@L��g�8@N�p�:;�@P��냇\@Q��f>@S@=��@T�ݪ�S�@V*t�g�@W��+@Yl�G�eN@[1C�*�@]8���@_D�ų�@`��G�^@a���bz@b�h���F@d��`q@eL�Зq@f���ˍg@hpt<�@i�̠��@k���8@l��U3�1@n~�W1�@p&�L�@qm�}e�@r{$Xv@s!`O_��        ?a*��Jg ?���bOQ?���8N�=?�K���S?Ը��*Y�?���N�ӧ?�;f�D�?��47:�?��Q$p��?�wX��'@ �T����@w���hU@Wc�A<@��'�޺@�|�(�!@`��g@���E��@���ǹ@μP�>@."�]�@!hJ2�Q@#^�faY@%���@'���ع!@*[Z����@-!�7�@0ȭH�@1��?�@3zW���.@5`ff��@7iu��e@9� }.@;�Ȭ�G�@>\F;@��@@|��O�@A�#�K�7@CXfRK�@D���Z@F��)��~@HIDԪp�@J 񓔸�@L���Q�@N0T�޽#@P8ɣ	Eb@QnZ�C�@R�[��@T��ٞ�@U��tl�|@W�I&@X�����@Zbȭa�2@\) ��@^���`[@_����v@`��k�U@bP)�)@c)��n7�@dQc���P@e��R�@f�-�c�@h@2�@iv�Z:@j�k�R܎        ?�D�d��z@"�nѿ]@Bb��\[�@V���%	�@e�ӝ��`@q�(_]�@y�M�{O@�̲��F@�e���ޅ@��㘡u#@�O���w�@�.F�k@�?\޾�@��m��-�@���XA@�Se�Q��@��q�N@���$0S@�ޱ_8�@�0{XX+@��8�J�@�� �$A@��J�~,@���%7v@����`<@���Z
@�nK����@�p�6�\�@���%S�@��J�2�@�s����)@���#���@�ifg�"a@���մ��@ʛ�0$@�L���@��y�H@��:"�:N@���z)p@���\�-q@�Ѵx6ʇ@��ꛇ�#@����FjD@���&͗�@�V
l^A@�:7^g@�<��d�@�bDp��U@ۍ�o�=@ܿ�a���@����^�@�60��1�@�=�n�v�@��m[�@ጟ�۔@�9DJ�Ά@��p}�@�9H
��@�T�Y7�@�7��q@��0��v]@�U����@�Y~G�O        ?�d5�V�?�ύ2OS?�E{�L3?��_ڲ�i?�
��Z�@�����@ kq�5�@�c�ܻ"@|�����@X�=�@#*���y�@'%��oY�@+v����@0�]k_@2�/MB_]@5*�*^�@7��[�N@:�Qv,�^@=���|��@@�D�5s�@B@Kw:�@C�*)�&@EЯF(�j@G��굵?@I�OP� e@K��=��@M���J@O���"��@Qޣ��@RB�+�\@Sq,�_�@T�N=@>�@U��0�*@W*%XY�Q@Xvg���j@Yɵ�I.�@[#��A!�@\���@]�����@_[ԋ�|@`h�.�_�@a&�N�Ӂ@a�RՁ�&@b�4_�=~@cut��Uk@dA`_�@e]��@e�cd���@f� JPb@g��׺�[@hm2��@iL��yS?@j/���k@kϱ��@k�gh4H1@l�i��J�@m��JC��@n��@m@o�z��B3@pa�X�s@p�h��zV@qb��g��@q�46��=        ?bIW�3g�?��T��W?������?Ҵ�Ӵ�?�Y)˗o�?�c0C96�?��x|��?���I�q@1�`���@	_t
�\J@���@��V�+k@�W���@h����@7|����@ ����@"����@%!+%�U�@'�G����@*1���@,�S�~8�@/�B�<�q@1{��h|�@3΍%a�@4ףop�f@6�1=?Y@8����@:��]�@<��8e�@?sHZ�@@�����)@A���U�@CBl�b�@D�����@F�搖�@G�+���@IH�� ,�@J��z��o@L͇�m@N�����@PY�
>�@QfV��W�@R��+�i@S���u�V@T�Ϊ\l�@V)m��2@W�k�I:�@X���Ë@Zef�h�@[�ބ���@]��}WV�@_H���%t@`�V�n��@ayWK���@bt� @c{���@d�9$[w:@e��%sΪ@f�nP��@h)Vl�@iZV��t@j�荈��@l3���        ?u�����?�vCte��?��e��C�?����+ښ?���6�?�t�?��?�k�~�@ 8 )w@$�S.;@
�.�<@�9x@P��O�@Y�rPkE@ϵ���X@ �}��@#�3��@&���P��@)��FS�@-Y�^��_@0�2E}k@2���Z�@4��~?b@7f\�V1@:$�
�@<�I����@?�a�C
�@A~:曢�@C3���#@EDA=E�@F���/�@I9.�#�@KVYCp�L@M�S���@P0 u@�@Q����>@S~��=`@T�`l��@V{vzyf�@X[`��"d@Z]�/�Y�@\�n��P�@^�چ��s@`�.�p�.@a�A�X�@c]vL�@d�0"�>�@fy��e�@h/����@jj8f@k��.��.@n{p�-&@p)�?s5�@q[�,��@r���^A@s��WL��@ud5N�@v�Tm֚@x{��@z&��u�@{�5j{�U@}�4�'C@�V��@��v�,]        @ �w�ef@2	��X�@Pv�Ǫ��@cuO��h�@r1��(W@}
>�K�@�9�:�3@���j@��7���@��t �@�e֊j�@���-&z@��S��n@�>�r
�@��(��@��K�GG@��ǡd�@��AhbsS@�Z��@�_�"lǭ@��3�x�@�2X,U��@�����@�3\dQ�w@K��E�@���s6�@�x� ��J@��jݲ@ȍ�4Wq�@�)�m!W@��P˹�$@́T�n @�<a���W@Ѐ�6�&�@�g����
@�S��0�e@�C�+�s@�8���u�@�2x���@�0�����@�3Jf�%@�:�$���@�F|2���@�W4{@�l'�ρ�@܅�}� @ݤ@��j~@���.�@��`v^�5@���ċ�@�%
zU�@�Fq�t@�[���1@��{�4/!@㛅)�4T@�>�ABy�@��H�>@�����@�7b��D�@��z3�@��%��@�FM���<@���u��        ?�<r�9}?���9U�?��U��a�?�R�0��?�գ,j��@V\�°�@��b1@��Eu0@�4Rs@ ��[Ww�@$�tN��?@)/Kn@.UPz�#@1�iR�i�@4�Mj�!�@7��K�+(@;"<7���@>��p�E@AGC�/�@CP�u��c@Ey�L���@G�ɸ  @J0k�Ø�@L�UB?@Ot{'�D�@Q'g|�5@R�&JG�@T=d��f@U�/cT~@W�h��P_@Yy�n?e@[c�X�[@]d����@_z����7@`�5��<@a�k��i@c$xG5��@d^t�5>�@e��k��@f���H>@hV���Y@i�����@k;�?�@l�����@nU��"G>@o��(���@p����F)@q�ҟ��@r��Ǵ��@s��2�,�@tx^Bm@uq�'�a@vq��߸�@wx�WJ~+@x��}�@y����@z����9e@{�LZ���@|�;ǈ4�@~$Dr8�6@V^&�h@�G@��J�@��S\�8�        ?7Hs�� ?uG
F��4?�� )!�?�w���?���At4_?��i�4y?��m�'�?�`�� \�?�'Q��9?�x@� ��?�fD��f?�w�# �?�Z�ޓ�?�W���$@ �9�"��@�)ɒ�@�¾}�@.^8l�@}���@M7���3@{/�1/9@�wy��@�i���@!R�'���@#��� �@&�l9Y��@)�Q��)^@-bc��@0���t�@2����@51B��3@7���e�C@:�'k(�@=�aBW@@���3�r@B�Rl��@D���F�6@F�`� Z{@I8��V)�@K�`�0״@N�+@=��@P��5�l]@Ra*=]�@T��u�[@U�<YQ��@W�$�y��@Y�1�!�&@\7$x�W@^���߅@`�̷�@a�y�>�@cY��5�@dߑ�8DR@f}H÷H@h3۸5Z@jk��	@k�$��/@m�C G@p	�9	�@q1x��Y!@rd%٘	�@s�λ��@t�6���        ?��Y�x?��d B+?�r�&�C?�z�7�?�'�aTݏ@i�TW�
@�@�4%�@2���{�@�O��@u@"��&&.�@'�^��J�@-G�7�N@1�6���@4�Q]�@8{�� �.@<w#�&W�@@g�N��@B�'Eq�@ES�$�#@H����@K��a#L@NO��OE@P�ڕ@R����`@T��.@V�1�TR@Y(����d@[����[@^.���Z@`we�G@a�3�yܘ@cv��w�@e�An/r@f�jxH�@h��`�γ@j���L�@l{Q�i�@n���0�@p]K��Y�@q�@r��L8:@s�{��L@u58X!H�@v�r�\��@w�K�(@yc�X�@z�=�Em@|rĔ7�l@~��l��@�W��@������@���L���@���KF �@�}�	� @�xS��@�zo�ך@�� ]��@��c�@���NG�y@����2�/@���X��@�*@����@�c��U	        ?��H�Hx@1����5�@Q�����@e[ނ��@t,u�ngH@�f 1JԦ@�;8 4@��}o1��@�0xxPf@�Y��V7@����e�,@�z���@��	��h@�Vh�r��@���9��[@�f���n�@�T>}��@�xe�l{@����ys�@��͏C��@�zã@ħPr�3�@�Ϡ�q\�@�.p+9@@˅. �6x@��9�5�@�d��y@����{�M@�R�V�.@������@֑�".@�P_� ̽@�$+
r@�K���@������@�n��^@�%��@�E4W	�a@�p�=�VH@�H����@�����W@�7��$"�@�z٥s@��d�iFz@�l���6@�����@�y�%��~@�	�B��\@��[V�\@��{b+@�u)�@�v��"�@�_��4B�@�N�'��@�Bg�j�s@�;�p��W@�9լ�X�@�=X�ͻ@�F	�#�<@�S�S9��@�fﶶr�@��v��@��n���W        ?S��E#ؽ?��l�?��"D9�T?� ��F?�GP�&(�?���jeI\?�_}9��?���S�?�)؆� u?���]�?�P�$���?�p��6v
@	�ZV��@���@u����@�r��@��3�@��t�@�(D\��@��BL@���"�@9Bk�@������@ q�'z�@!���Ü!@#��ɓ�w@%3���L@&�ާN�@(��r��@*�f���`@,p�ba+@.j]�|ɽ@0:���@1I�q�o�@2a�m-�!@3��t�@4��J�@5�����u@7#Bգ�@8l��l��@9�Ĩ~9�@;O]���@<���M��@=���ٕ@?{�SN�w@@����2o@AMq:� t@B���>�@B��M���@CϪˣ�?@D�TO�@E��*j=U@F�"o�[�@GyDk��@Hr)����@Ip�LY`�@Jt�!'@K~:0"�@L���WC@M�q�ly@N��ی�@O�-7���@P|�!9z        ?bit���#?������?���u.?�?���O��?�v˥X��?������?����L?��-m2?��U�?��C�6��?�j<����?��(��?���k�?���p��8?���R*t@���ͼ�@����@,�ط@�g��@.C��@�c��%@=�
᳦@0�o��@t�F+v�@��N�@!�k��-@#����è@&*���:�@(ٹ��}�@+�VF�h'@/�$W��@1P+���@3Ev��m@5h���-@7��Oޞ@:J.�>R�@=���"�@@q��]@A�K��~�@Cd����s@EGQ�}K@GM�Hq@Ixt��B@K��,�f�@NE���@Pul$�#�@Q��Gn��@S\�e�7�@T���2�@V�l��@Xhu�R�@ZHґ�x�@\C%8��@^X�sM@`D6��t@aj$ D~<@b�q>��@c�XG�-@e3,��@f�A&�@h�b�
0@i�_U�X�@k���5        ?P�$_�O?�y) �R�?�Ƅ5?���-$vO?К��g9?�?.1|?�y��Z�?���9{?��][�H?��a���-@ ��T �o@��Bo@��4S& @�d�@m��,�@U���@�x�G�@�V��@�d<G@!���)�@#�_ұ�@&jג�;@),3l�.�@,,�-�Z@/ri�\�6@1����b@3sV�Eү@5�����D@7�_��S|@:j��l�@=*�|��@@�w��@A�]IB	�@Cx���/@E`E,ɾ@Gmg��@I� ��}�@K����@N���c+@P�O��R@R	���@S�G��{O@U)��f�|@V����4@X�����:@Z��f ��@\�(�!0@^����@`i~A���@a��<@b��җx�@d	��� @e]4���@f��ܗP�@h1��g�0@i������@kG�(I=G@l�0��@n��H�l6@p5����@q#N��l@r|2��@sm�|"�        ?���"�@@-{GܝI@(?��a[g@=5m�j��@K� /@�n@V���
�@a��`͉@g���U@@o��|��@t5I��@y,C��P�@~�fw�I!@�b��he@��J�F�@�W����@�F�=`0@����f��@�
�*��z@�|����Q@�~�~@����C��@��Ϡ�g@�tc=�@�d��,@�����@��"Yw�@�}�Qz��@�s�����@�~@�sp@��5Dx�@�ѹ��%/@�Z7�@�>�(�C@�z��͌U@����Z@�H��Ez@�v��g�@����S,@�Z>-�W@���K�'�@�o���^D@�̞f[�@�[�0�@�5��VY�@���m��@����s(@��""/�@��vK@������@�ת��e�@�ݗ��M(@��ýo�@��1�H��@��J�t@�3�stP@�X���~c@΃=2j@ϳ���M@�t��m�@����vH@ѱ�gs@�TD��@�����        ?���i�@�?ί�W�|?��?�jt@Eb�A@c6|c�0@�*��K@'�z��@0��c2@62)�UE�@<~�̄|z@A�3bJ�@E��*���@J{U�>b@NȦ٘@Q�e"@tp@T�w�K9@@W�{�x��@Z�q�f�w@^u����@`�����@b�=�np@d�{}l�@f�4���1@h����&@j��^�$
@l�¦2�@oK3�B@p�/{M7L@r�4?ě@s[6����@t�����Y@v� )�G@wjT���<@x�
�	Q
@zR#��@{ը@�@}c����@~��(6�L@�N��pr\@�$�+��=@���ׂop@���;%�@��wP[]@���v�[�@���Z&e,@��=>+�@��ʻ�7�@��/}�o�@��nf���@������@��|2u��@��B��2�@����u@��$\(\@��'�R`�@���	u�7@��@���@��[��@�Jhx��Q@��Β7@���l*��@�:
B�@�����        ?�0I��3,?�g���A?�����O@&j�f�#@�[ꡎm@�[�C@'"�Z�x�@0/	} �j@5�Z� �@;�uB��@Ad<Tk��@EMб�"@I��\��@Nb��,�V@Q�d�^�k@T�����@W���V>�@Z�ѣB�/@^UI��c@a6�IyE@b�w���@e
0�J#@g84��x@i�LM���@k�52��@ni��6@p�7
{�@q�!8���@sH{�5/@t�5����@vCD�P&i@wԤ�u��@ysVl��6@{Z�D��@|د/ |�@~�N�â"@�9��ߟ@�**���@�!`��*@�BC�$@�#��(J@�/Y_�Y
@�A�:E_�@�[<q7o@�{�vb@����n�e@��N��@�
KP-H@�H��o@��w`�n@���Be�@��&q�.@�Ipp/@��ߊYe�@���T?��@�p�oY.@�1�D2@��	�;$@����q@��FM�;@�a�ԄN@�:9
Z�/@���FZ9        ?�}�?f?��q:�_?ݵ�B7m�?���<D�@)h��@����+�@K�r�e@጗5�@"A�[�u@'��d�#@,h�3���@1��=�q@4NWu��@7�N�s�@;~(�,Z@?��c@A�W4�L@DA�Ph @F�I�.��@In�<�s�@LLg�p6�@O\HVu��@QPM*��@S�v%�@T�W:y��@V�$0�!�@X�	��@['�B�@]{GO�A�@_��c,�@aD����@b����@d�:b��@e��?�~z@g1�O��@h���@j�&�LSf@l~�]JlL@no�*@p<T=Jخ@qL���~@rh�e�@s�1����@t���~�@vI���@wU?TH�@x�����@z�xnx=@{���(�@}PT��S@~��M�@�0�:	�@���d�K�@��/R��%@��8�P�@�� 񲧿@���qS�@��ɞӄ�@���$k�@��J�R@��Vx�a@��R�:��@��۵P[        @!3SS���@YW�6D
@y�T8{^@���4k�@�g����@�j�-��F@��k�K�@���̩��@�07�7�@Ā;&k��@�DG�"8@�zl"�@��с��@�Bj��@�W�m�/@�ɜ�@�l�U
�@�,7{�@�7�+l�@�j�|�@����Z�@�*~-��1@��(%l@�����@�^�'��@�rx#,@�U��G,@@���	���@��Y���@��D�ԍ@��ՖtV�@�7H"l�@�x_+��@���$aw"@�5���m�A m/i/*�AC�+�hA"*��oA��Y\V%A��Tu#�A�$���A��x�q�A��A�� 9rA�Q�NA	�e3�A
�)Ce��A�}Sw�A��Z�A����*6A�Z�m�bA��L��A}*m}cA2E A�y��A/��)ʽA���H.�AY�/��uA� I�eaA�!)�͚A$�X
H�A���p�A]��4|�        ?v��k8!?���)��t?�a8=D�%?��o� ?�7�&�@�H��]�@
i��p@��\�)b@�M�]5@��Nک@#۳:̬0@(E���2@- %���Z@16=1Ƞ@43�Bd�@7.<�V�@:�.h�#�@>n�)S@@���F�'@B�Z����@E"df�ݯ@GpR!��3@I�Ϯ�A@L~�*�jO@OB�����@Q,�'ĕ@R�~��@TQ-�ud�@VP��	@W�s_��J@Y�͸x��@\b�x�@^C̼��@`KY�W�@a���k�@bǾ����@d�p @ez�0�I`@f�e�и�@hf
g�_C@i�[U�;@k�Ԝ��@m5�b��@n��bt�/@p]D��Z@qJU��'�@r?���@s<�6i�9@tA���O@uNL�9�&@va�ӗ@w|sm�D@x���@yƘf��?@z�2y)L�@|,�x<�9@}j��hHX@~���@����>@@��AZ���@�W�E*�@�
H] �@���Ќ        ?N�2�1�u?�#���g\?���FT��?�o���3�?�唫z��?ݤC��?�0e��=o?�����?���4�L?��ܫD��@ �	 ���@c�騫W@�@IJ�e@:^��!@0����@	���Z�@.5i��j@��	rX�@p�Ŗ;�@!M�=�t@#��Yw7�@&��${@(Ƹl��@+���2�`@.��B�x@1-��f�@3
{Z=�N@5�=��@75�c��@9���W�@<�&��^@>���z@@�|���@BK�H�/+@C���H@E�u��r@G���ǡ@Iv�+@K�Ԙ�n�@M§�2��@P	�K?@QL��'=7@R���d@T�Ho�,@U}�t���@W�k�6@X�hIb�~@Zl���UZ@\>�'<�@^(ұ�g�@`|��s-@a"�E�@b<��"P	@cc�]��@d����@e�_���@g(n��@h�j����@i�bF�@kjp�*�@l�*����@n�/���@pp��        ?�S���w?Қy��?�r3�=@ \d�]@�Zn�n+@!ǆ����@*!��*�@1����%@7p!0��$@=���[<@B��L@E����@I�w��@MԜ�E#�@Q&j2^�@S�"D�B1@V���a{@X�����@[�Y��@^�w~zv?@`�i��=W@b���n�@d^�'�2Z@f;��g��@h0�Ԧ��@j=��ϸ�@lco�]��@n�(�~]R@p~ؿ���@q��6x��@s��-(@tY��75}@u��� wK@w2�#e6H@x�QD�D�@zGa t[~@{�8z���@}�W�-@^MW8h�@��Z��}�@������@��=W��@���t��@���g�D@����$�@�߮�Z@����@�J]Q��R@��WO7�e@�ᶂڵg@�>���:F@��v�5k@�.j��@��{Zx@������@�a�;�@�4�h(
?@�8۲��@��E�D,a@��D�t�@�·;h�&@��l�k@��U�oP�        @���p�@C�N�@@d2{��lk@y0F�L�.@�'�u�q�@�ͭZ{�@�Z1c@�N"���@������g@���[F@���vE+@�O�I�J@���Q8@��BF�H}@�?'��	@�!Z�
�@�1K���@�o�$z�*@�n�0ɂ|@�>3��@�'#�Y/@�*k�N�i@�I����@ڄ��r�@�ܢ:�?@�T����@��c����@�W%�;w@��	q�~(@�S�����@��3�pB@�kM{�N@�f�+���@�>=���@�'�=��@����@��>y�@�'����Q@�?�l��@�aus�Q�@��Z�\Y�@���X�ۚ@��?X�K@�G��$Dq@���3>f@��1��	�@�\71/�@�ˬ�k�5A "Z��A �q�-%A���h�Ao�W� �A;�eʑ.AC��kEA�{����A�����A�QL�>Au�K�/IAZ�v�AA	C��.�A
1�6�q�A$��OA.�G6        ?Me�)��?���e�?��!ҷP�?���d+�]?�P���;?ӋG�N:�?ݍ�~�p?��Wl��P?���{?��wI��?���w�n�?���xs�A@ �F5b��@Ȥ��G�@*�?	�E@
��q�%�@ˠ�+D@�ڛ`�@��IR��@>&�uC@�KE�?�@�J�&��@{*9?�@ ��dA?+@"`J�a�:@$��L@%��5��@'�u�n�>@)��!�>�@+�(;�q�@-��Gk@0�rn��@1+HI��@2a����@3�-��4@4��y*@6P��t2@7����f�@9&��J@:�C����@< 3���@=���uT@?8��6�@@gu`��Q@A5�`A�@B2�F�i@B۩�|<�@C�E\�0@D�)&�c@El��Zm�@FNsH;�E@G4̓�@H�/�{@I
�r��@I��A��@J𮼜n@K�t��F�@L�'6z߿@M���>�@N�h�Üe@O��B��@P�/�`Z@QL�Ei�        ?��Q��;?R�1j�F?uǙ>��J?�XI���?���N��?��ꅧ�b?��D�B?��c��	?�P���?��_�?���3R�G?�u����?�)����?�G�x���?�0�:��?�>2�?�����H?�����a?��x��=�@ ��
�@��	Cp @HX���o@b����@�!O�@�+*��m@��YW��@�)��+k@�H�y�@ [���@"����N@%(�{]U�@'�9+�Mc@*�<�-M@.P����@0���	@2��p�g@5�X�@7pU-a_�@9�/�l)S@<����=@?��g)�@A[b�!'M@C���W<@D�/J�@F�ؖ���@H��+�Y�@JИ6\�@M�Z3_@Of���j�@P�XN��@R<����@S��n���@U�ǔH�@V�P�h!@X�t��@Y�ٚ�-]@[c����B@]'�w�L-@^�r�c�j@`t)v�a�@ar�f�D@b{�:Ծ@c�ԍ4��        ?,q�W�?bH�=w_�?�z���!�?��&���?�U��D�?���ш;�?�y��||?��4�;�?�/Ɠ:x?ֲ��s�?�7A��(?�n����?����F:�?�Z@��@?� -D}?�����X?��&�D7?�&��Z�O@1CǑM�@)@<��@����J@F��|M@y�xS�@�ƞ�@���5��@$0ww~@�����@2q(b@ ���`��@"�}�Զ@% ˑ�bu@'S_pk@)��z��"@,}��M�@/X��DiL@12}R���@2��rM'�@4��Ď��@6h~����@8`�Q;�@:yR���@<���w��@?b��f[@@�u��3B@B�vi��@C{��,�P@D����$@F}k�O�@H�t&�U@I�cCf��@K�0�^��@M~!�٤@Ox:~��4@PŽw�0@Q�a{�@S i6o��@T2&[ �@Uq�CB@V�� C��@XK�As�@Y����-A@[�e1�@\��#b|        ?�߶&��?�yU�l��@��&�i@.�ӡ�r@>�۳�#�@J<A�kEN@T��+��@\i�n���@ck��@h�w</@o%��kC�@s#.�y�e@w%���@{g|��ߖ@���]��@���<�i�@�a���(@�Z�4t}@����)��@���y2`�@�I�5� �@�6m1�P@�?��(��@�e�C�O@���"�6@�	�����@��ϰ�@����$�&@��<�-@�d�\"f@���nR8@�{W˧"n@�"-'vֹ@�ۣ��m@�������@����#u�@�t)�2��@��?��@����UA�@��>���q@�ݦ<���@����Zؖ@�h�gH�@�6(�I��@�]��6�@��=�6@��e�d}�@��_���`@�,T �~#@�ls<�w@����F0@�~[n�5
@�&uIu��@��8�K�
@�~����y@�.��bl�@��L��I�@Ė���q�@�Ny�h�_@��G��@������@ǅ��bT@�G�itH        ?��N���?�^���%?ٰj��gJ?�F��fe�?��F ��@;�p��@ u�a�Q@(��@ �O�@%K�T�V@*�RO�6�@0*h���p@3W���@6��~�@:��3��8@>�Z���@Ac���%�@C�����@FE�Th�@H�����
@K7'�b,N@M��4C\@Prd`�4D@Q��w@S���F��@U,��@V��f"Ry@X��1p��@Ztk�b��@\W?H��}@^JA��1�@`&ǫ�5@a0�zk��@bB�L?C@c]	{��\@d�~�@e����[@fݴdCH�@h$Y-U@i\˓j�@j��mk�/@k�~�!1�@mXgE^@n�F�9>@pB�A�@p�ݺ��@q�����@rMK�%��@s߷>�@s�Y�"�@t���+AW@uz�����@vP N*�@w(�ܓ��@x�` �@x��Q��@y��'7@z�ga���@{���n�@|� �Y:@}}1K��^@~r�j�\i@k�l컮        ?���}�{w?�տr���?��l���?�G�6]D@�!K��;@����J@�*iq	@���/ݮ@"�� @'E�_�V@,f�JXA?@0�ד�~�@3ꜻ��@7��=�@:])*l-A@=�'��@@��I-�@B�P�Z8X@D�j<���@FȞ��@H�`�$�@KB8q�&@M���R�@PV��4@QY�iW
�@R��,��$@T���=@U�O��ܔ@W�ƅS@X����z@ZFs�ut�@[�ܥeh�@]��
���@_�|�)�@`�"����@a�},!��@b���@c����:@d��p���@f'g�$9�@g\�8� �@h��/��@i�uG�'@kE�s��@l�Wc#�@n +d�"*@o�&j�@p��3Jc?@qelSwpV@r9ϛ�
�@sٿ�+V@s��h$z@t���m�@u����@v��]/� @w�=�
È@x�u��O�@y�k���@z� S���@{��(�;@}�����@~8����v@d70Ϙ�        ?�]|�	?���.]~??Ҿ�:k+?�dQ��X?�ِ�<��@ �۹�a@X/n @����#@��ϡy�@}�
L@ �,�)@#�7�Ġ�@'5fg:��@*�̳��@.�&j��_@1l.cL�@3�d��@5��g�@81&{q��@:����@=Bh7�w@?��8L�j@Ah��)n@B�Q�~#@Dso���=@F���@GʛUg1�@I��,i�	@Kt�훯@Mk�
qYi@Oz��{ߘ@P�g�@*�@Q�f�/@S"$EjM�@T`g�W�j@U�j���@WX�@X}m<D<�@Z Ro7Y�@[����V@]A{�S+�@_w���@`k�B�̈@ab�N�@bdD҉��@cr�O?hu@d�c2��@e�#����@f�=f,��@h-"�d�@i~K
v@j�9��K2@lMw'�8@m̖K9u?@o\2B���@p~xA���@qW�YIT�@r:TI�E�@s&��f�@t�i��#@u�����@v*����@wA����        @h�N�t�@B_��;�j@a�[J?=@uD�b��B@��\���@�l+@�w���9@��/�f@�!sh��i@������f@�|�Y�F|@���"���@���D��@������@��6�>*@�� �@�z5�}m@��9�k�E@ɕ� ;ǚ@�Qҏ���@�,~n�|@��e��{@ҝ�`l�@�7�o�h@��w�X�@חv)���@�\��e��@�0y���@�/�,��@� $��@�~(�:8�@�뻦X6@�.X�$@��CT�@䷸�l@�������@��ۖw�7@�#�e4l�@�S���s�@�s�r@�����@���6'=@�L~�2$�@�"@�uEs�-n@� �\t%�@��}�DN�@�Ѽ�dj@�4��Th�@����h�@���'�J�@�b8�*�@�!�$��@�㑐&�@��V(�~@�o�
[�@�9���,@���}I@��8�2�F@��E��8@�|�W$��@�T_�A@�-�-T��        ?us7$
ѝ?��5�Y0?��q�50?�2�T9?�t(���@o��'�w@*Ǩr�@v��Vdf@^�b)p�@!�2�v�@&'R2q��@+-Y���M@0]A]B�@3gR��.<@6��)���@:D�N�V@>$��i�@AAxm�y@C>���@E�$𝇂@G���@Jq ���'@M�٫A�@O�7Z�Fb@QQ���@R�2��a@TN\\�	@U�w)��F@W}O���D@Y'�卄@Z�c��TD@\��7�'s@^r7�@�2@`'�L���@a1�@B@bW�|�4@cZc� 
@d&=����@e6��Op�@fN{�n�@gl�#T�1@h��s�4�@i������@j��A<�1@l' ����@mej�r�j@n�
��.o@o�狄��@p�	� ��@qN����-@q��	!@r�/o�1K@se����@t�/�H�@t�r3.��@u�r�yX@v^�\,)@w&�2(@w��d��@x�c��<X@y����Sv@zg���y@{A�m�j�        ?\�;Z4�?�}��+�?�*�5��?�CB�+?��/���v?��.�P ?�SQ�݇@ V6�l��@ϼr�@N��@��q�ݡ@��P� �@<�ݍ"@�7Zk@"Br~T�b@%B�0y��@(������@,%�(��g@0	���:{@2-~����@4��PcE@7�iO�@9�S3��P@<��"���@?�����@A�Nu�%@Cg%����@ES����@G`�ݓ{�@I�7�JyA@K���@NM��*@Pp��/ng@Q���,>�@S9|X��@T���	::@VL�͝�l@W���0�x@Y�
P`�/@[\���@]et��@_b�m�@`�\�yE@a�?��tw@b����V@d#؋+#�@ea-/�@f��r<��@h� ��@iif!M�z@j��0��@l[�L��@m�n$�B@o�4�|�@p���Anb@qn� H��@rO\)��@s6�X~��@t%0�ļ{@ur��1@v�'���@w B���@x$�u��        ?6E�Eo��?iߛ��[�?�p$ě�?��w�/*e?��:7��?��~<v�7?�vX9�R�?�+��9�?�����i�?�z�7 �*?�T�j�?�F
^n�?�0,��'?�Z����?���ܨ?��c(�f�?�kSr��'@ ��\�3u@����1@�%�BMp@�K�SZ�@v�I,�@MAg`ne@���luJ@"�V3g@2B�Y �@!]R@N�@#�f��@&�a�MG@)�Pgb��@-�6]�@0fRh��
@2j S�1@4�~�pp@6����Gy@9�³7@<V-i��@?T9��0@AE�o9� @B��ı/�@D�	�[��@F�"厉@H�%�mV@K/�tpc�@M��ZL��@Pl�q�U@Qlf�@��@RܨA��w@Tcbh��@V Z��A�@W�x�o@Y�:5�_�@[jy ݳ�@]l����@_���eT@`��M-�@b�E��@cE�;-�@d�fPLo�@e��<��@gS%h�@@h�y�[f@j[�ت:�        ?����1�@(	���@Is��-��@`>1xh@o��1�@y��ڛU@�(��Hsj@���D�@����W}@�ֿ#T�N@��6��Y@�jz����@���.�@��U#��O@�°;	0@��ۥ��@��Q��K@�i�r��@�
6��@�̴��1@��~di�@�X��L�@��ێ�@Å����Y@�0�H��@�裉t�3@Ȭ�T��@�}	���t@�X���e@�?�I~B�@�nw���@����@���\�R@�*��ET@�=8o�@�V,�y�@�v�T@ל�|>�s@��"��@��`�S�;@�9f�i�@�{*�c4@�Þ�9��@���q�@�4'��:@��5<{��@ᓂ��S@�H��@� p�@㻏L��v@�z�����@�=,lR�g@�|��/r@�͓
��v@盁���O@�mZ��@�C/[�R�@��ؘ�@��}V�@��&���J@��z��(�@���{��@����fT        ?{-�{M�?���ɱ�?�}.1�{�?����P�?� ��U@vY�q΁@
(��_�v@K=����@\<P�Y�@D�-�>@#�����@'��Ea�z@,~�k�L�@0�Ғ��@3���.d7@6�5��\@9����@<�\�Tp@@D�Z�?�@B$&���@D��=&@F4�ݫ�v@Hf˛_��@J��j7@M"�t��@O����R�@Q+�v���@R�� \l@T���`~@U��0�'@W�-M�}@X���V@Zo9�r�h@\1|)�~@^B�Cz@_�>ۮ0@`�	d�M2@a�-�2�@b�c0���@c���y��@e�&h�@f+K,�K�@gLλ��@huIg��@i�}�	}@j����B@l~�t�@mY��'��@n�VǦ2@o�}֊�@p����D@qUڧ�D�@rA��3m@r��z���@sv�v	,`@t2z�@t�CoU�@u�����v@vyy��3�@wBG2J^�@xI���@x�z���M@y��%4�"        ?w�4�B�3?�X�Z�	�?�Lִ�?�?�u�B�@ T���l@��ʧ#X@����q�@�T�x@#�YX�Jg@)K-�� @/�K{�@36]g��A@7 AY'|R@;$�\��l@?���G�D@BE	��K@D��> @G�lW��@J΃�v�@NR$[;@P�XR��@R��vNXO@T�k��2@V��	q]@X�&�v@[B����@]�%�Iw�@`)(5j/�@a�_z�P@b�X�M@ds�'�V�@f`���=@g��?镵@ia[�J+@k-i
�@m�j�j�@o�%��)@p�Q2M�6@q�t]� M@r�Y��m@s�н$@u$�}���@vn?Jʆ�@wƴ���<@y.�.�Q@z� qp�@|-�*��@}�(���	@o[xe��@���A�E�@�{��@�j;Z��@�b��Rf�@�d����G@�pyN�E@��3���@��"�3@�Є4(x@��G�t@�E�7�J�@����p�@��Ą\V@�I��8�        ?�f3�X��?��\�A�?�3Lf%�?�[׷JyL?�0;>8�@u�>"��@�vjP�@a�U�ĺ@zLt)j@ �h6�d@$R!��D@(]�z��L@,���@0�;����@3dՏ\��@6=pd�}@9VeY�XB@<��Q��"@@*��N|@B[���@D83O�@Fu�#��i@H��ğ@K_/�w� @N,�Y*@Po����@Q���J�@S{�%ȳ�@U�:�S@V�!���@X�nb.s�@Zz�z�u�@\iE��@^jL�L�a@`>����s@aQ]_�W@bm}eZu@c���GH@d��|��M@e�D#e�@g8 
��@h�{m*?�@i֬g���@k4㢵_@l�pC]ǡ@n�)S�@o����@p���@qW�`�Ǥ@r)L����@s����@s���@t�"4��q@u���N@v�@�@w��Z���@x���S>@y�L�l�@z�5S�@|�m'�@}6y�duz@~p�ԝޡ@��1�nU        @t�7�@<�4#^�j@]wO�o�@r�pR|;�@�+=���@�_ۉ��@�V� @��V��qa@�n���v_@��^{�!�@�,��5 @�ovI�K/@�6���@�
��ۀ�@�E��P��@��J7�Ur@�I��V��@�ӊ�7@ɂg�"N@�WI��؛@�S!�QI�@�;b�oA�@��tFHP�@ԜQ�D)@�kr�ȴ@�O�/�"@�IR.~��@�X�@��@�|����@�Z�sS��@���E@��+³�@��u�WE@�7Sx��@�["n@��?փ|/@�G��x�@�PFk��@�+�EQRp@��jW���@�3��WY�@�bN��@�/)�Ѩ�@� hLt��@��	.�g�@���b>@�]�\��@�p��'�S@�Wȶ��x@�B�-��$@�1����}@�$T��@���l.@����cF@��$�E@� vgWX@���<5@�!!Pt��A tENA ��k�A'R~��,A�>���eA>̧�("        ?J�,���?�����j?�Q~!.?�yeZU�?�T����h?٧��5\?�Y�)�?�C)�z�?��[�x�?�4bj�?�yј��@��:Q�@�?�@�H@
�I��@j�!n]�@.���l@�fy -�@��ߨ�s@�m�16@ษ�'�@ ���u��@"f4U%V@$C_=��@&7h���M@(Bc���@*dj�bu3@,��	���@.�(:r��@0�"����@1�'>�#@37`�)@4��|��@5���e�[@7hx�k2@8蹄-�@:v�%�.i@<�V���@=�!��:@?v�V�b@@��y^�@A��+(g@B~�� �@Cyr��@D|�2P�@E�����!@F�[�(�w@G��x�Vw@H��	�'@J	����@K>�sv�@L{�y�pm@M�����i@O�]a�@P13m�4�@PߏU� N@Q��\F@RH.ϝqN@S�,�(@S��u��6@T�VR�� @UI��]��@V���@V�j-���        ?'Kc;j��?fg<y
��?��7=I�?��x�7�?��`C�?���$�Y?��|���?�B�8\?װO�*��?�]�}�?�7��G�?�;Φ
�?�Ǳ��{y?󅷢���?�����q�?��J�]�R@':��W�@kↆs�@.��mS@<;�� @�0�$Z@����@���@@T��(��@f�nJ�I@!|��2�p@$z H3@&��n�@*
S�Pp@-��E+-B@0Ʀ�)��@2�HӖw�@5T�4���@7���f@:���{S@>zrñ@@���.@B�
�JnX@D�T�3q@F���V@IV���`�@K��w:�B@N�߹tr@P�ucr+�@R�����@Tc�$
�M@VP+�T��@Xb<ծ@Z��{_8@\� ��l�@_��劝@a'PwB @b�8��Ez@d3α��@e�O/�@g�i�s�Z@i����?T@k�;4'y@mޚ��@p:��@qX0����@r���_@tT���        ?+���<�?b����?����?���LH?�+7��?�vQ��"H?�1�?�?A��*?� f��?��-�c$?ެN��-?�[tEj\?�{�&��?�|-�h�2?���Qǿ?���W�3�?����d?�q
�v��@�6~0�A@��딉@�-�`�@�W��~@��Ʊ�@�\j��@ ���r�@:��l @�w@��@ lN@3�@"�����@%��d�@'��D@*��	�/@.vS��P@0զg"�U@2�8��@4��y!�2@7@oߟ�@9�lu>\@<��)0Y<@?xD�)@AU
?��@C�Za@D�Ԕږ�@F��bv1	@I�N�\x@KNZ.�ϴ@M���ס@P*��`�@Q��=�@SUz�~�@T�Aƚra@V0E�	7@W��w�P@Y��Oa�@[��c�L�@]���"@_�p2�r@`��x5�@b	x�	'�@c5���N�@dm�WȒ@e��Mң@gb[�T        ?�k��9�?��t��5@;�_2@2���U�@B��:���@O彰<h�@X\��%@�@aJ��+�B@gK�ŃP�@n/|wy2�@r�Օ	��@wN���7�@|6�7��@����m�@�s��d��@�|�	���@����h@�3�K\@�q1KI,@�d�y�@�rrn@r�@���q�(�@�⎭N @�D�_��@�æ�P�@�/�k�2�@���8U2�@��!Jŕ@�u ó�@�@�@���I�a@�L#a���@� �xb<@��6��c�@��D�vx%@�]��Zd�@�c�e��@�t:�@@��wժ+@���C�6@��z�Ϝ%@��r;��@�e>@'�@����-w�@�ܼ@���^X@���ق,@�{�P^�@��R��F+@�UAú@�*4��i�@�����@�爍qpJ@�ϰN�7L@ž.X��@Ƴ��x@Ǯ_�o��@Ȱ=�@ɸ��,�@��
���@��8���`@��x:��@� ��X�        ?�P���Z�?�9 �u&?���v9;�?�4L�K�?�NK�e@�g�Uk�@d�J��Y@��e�O�@^�6e�@#އF-��@(�"��4\@-�_+jb�@1��g�@4�Q��@7��J
�A@;4Kvt�@>�K��b@A5�z�r@C2���v�@EH Ż�1@Gv`L��@I����@L�7J�z@N��T�*�@P���&N�@Q���@SU �}@T�5j�Z�@VIc^,�@Wؼ���@Yvh`Nr`@["w�eM@\��l�@�@^�� �P2@`>'���@a0p[ �S@b)|� Ox@c)#1`�@d/6PtJ@e;���
�@fM� @gf;V�>@h�Lk=ޘ@i���R>@j����@k�tȇ�@m2�9wd@nk|7��@o���y��@pu�~F�@q��(�@q��;��7@rf̳�G@s3%�:@s�Xځ��@tk�}�A�@uW���@u�_gHt�@v��Wrc�@w8�"dǐ@w����*{@x�N����@ye�8��-        ?PxFXW�q?��޷���?��`5��+?ˢ�RN��?��w��2�?�~�o=?���v�?�����/@ �M��E�@o1R��,@
�a	�ʩ@p��/�@�1̩�@��;.0U@���t��@  USo�@"itf�@%q|���@'��p�Y�@*�a4C��@.��B_@0ɶ装�@2�#X��:@4��O�y�@6� �=�6@8��|Q@;R�n@=�X`
V)@@>_��]@A����-�@C��t��@D�G��D@FM��M�@H��9�C@IΣb0�@K���m@M��->�?@O��v]��@P��p��O@Rl@S97ؗ��@Ts��A%�@U��'i�@WxM�d�@X{�դ�=@Y�XB�*@@[{�9hz@]���@^�v��@`?���@a'��3��@b�*1<8@c�gcU@d
6�@e.�:@�@fLF�(E�@gu��`�@h���@i�}�A\�@k=9mi�@l��/�6@n���=!@o��Y>        ?s4EGݘ?����n�?ƥ�P"W@?����K�?웞�C2�?�8~_��?@����@
rs[�T�@�ޑ�L1@�.�v�{@��Q�@"�oN��_@&�7�z�@+	e�x��@/�4+�t�@2��᩷F@5��L��@8�ϣ�>�@<!��U�@?��w���@A���#�@C�^j�;�@F=r~E�@H����@K>�J~}�@N }Bf΃@Pw�� z@R73�@S���v�@UoMv%$?@WI����n@Y>};c�@[MѶQ�@]y`��B@_���J�@a���Il@bU_�S/�@c����_/@e�Q�E�@fyW���@g�����$@i��3��@k4m^�ו@l�[V��@n�g�y/@pJ	Ԕ�4@qB�x���@rE��cJ@sR��z��@tjx�2YE@u��(xO�@v��>�:%@w��r@y5NX�	Y@z�Ϊ	*@{ݺ�*l@}C;�)c@~�{�Ղ�@�ӱ�{@��w��@��@�;�@�yJ]j�@�P����         ?�UQ�&r�@0.�q^e@PЃ���@c��@��X@sE����@o��L�@��&��wM@�q�m��@��X
�0@�1����@��ku֥Z@�>��>k@��=g��}@��JG�"�@��]��@�h����@���^��a@�k)hm@����q��@�'�z��)@��sG��@�^L9��@��l�6�4@�fꟅ�@��Jn@Ƭ��@�@�h��S��@�4o)jr�@����d6@���C0}@��đ[�@�0%譵@��R��3@�,��}@�LW�*2�@�s�%��M@֢�x�@��Z�R�d@��v�W@�[SW�Mv@ۦ��hп@��~Mg�@�Q&���@߰�tK@����i++@�@�}B�@����;�1@�*ONg@�u�/�3@�83e�-�@���"�_�@�Ƥ }��@�ik�@�a!c��@�2��Bʖ@�)#�@���'@귛3к�@듏+@�q����/@�RY{~�%@�5	�x�@��v^;X        ?�/h�3r?��ev��[?�W�;(y?��X��ig@
�k�@�9^�;@�j��e@!'�f�@&�f�U�r@-1Χ}�@2.�M�1@6#�Wq��@:t�rM��@?'a1I�@BZf��@D�|A`��@G��66�T@J{:�G@M���>W@Pi�n�@RǍI9@S�D�po@U��#�n@W��4j��@YzKh�>�@[x�Z�@]���K@_�_���/@`�\���@a�*�B!�@c pu��@dH[߃�@eu�w�P @f��`�~@g�+V�@i$�mX�@jli�O@k��R�݆@mK�bX@njܧT@o�kw�4S@p��Ů�&@qT(�%��@rz�*d�@rЖVd��@s�}��}�@t\0jh�@u'��L��@u��2�/�@v���(@w����>�@x{ݲ���@yZ����@z=��`_@{%R���@|!�3�5@}o�Jw@}�QE�q@~����H@�IO�O�@�x�^'h@��/J��%@��B�-        ?|�*�\�?�WN�%�?�
�L?����@8b�e|{@4�g=�k@c�Utڋ@�}c�=�@ n$�y��@$6��5w�@(?���LY@,��Ä��@0�(	�A�@2��tyl@5Y NF@7��i �@:�*.#nM@=aӏ�K�@@#��qb@A�4�:�@C6��k��@Dٽ��H@F��j�R�@HW#���@J4g]@L&�:]�@N/�š�U@P(�*� @QF�켠@Rp�uP�C@S��G�s�@T����,�@VF@/�@W�+� @Y"�CZ��@Z��:�@\E�!8$d@]�����@_�N�Vg�@`��"b@a���"�@b�g:��@c�'��:�@d곖���@f��%��@gJ�R�^@h�Qe3�@i�T|���@kJZ�D�y@l��+(�@nG1+4x@o�`l��@p�"}�E�@q���ɀt@r�4sy��@s���@t��]��@u�"vkg@v�7�x�@@w� �>:%@x��&p�@z@dl�@{Vu����        ?g��L��?��^�|Uj?��q�=�?Ԭ]��w�?�`��n?�A7��z?�㊘'�\@E�H�x@���@�dj���@��V5`@�Q;]�@�r��@!�@B��@%"�ij�#@(�xm���@,��q���@0ms�}@2���0b@5E��R,Y@8v�3E�@:��~n�@>71��L@@ܾY@B�K�<�`@D��	l��@GmQ��@I��/,e@L<t��T�@O"�.�#5@Q#:���@R�؏��@T���a�@V���~;@X�a�G�@[
�4��@]|����@`��N@at��?S�@b�~Q���@d�]��0�@fC�/���@h�ؕ��@j���x@l��A�@nG��@pM�Q+9@q���J@rۧ�3@tA
>Z�%@u�#ID@wM�/�@x�g���s@z�/��f@|�p8�F�@~�{�2JF@�F����R@�X�Ԡ�@�v�92V@���Ꞇ�@�֍F��k@��~���@�d�I���        @	i2��F@G����R~@i/�KW@�����%@��{xx�@�W�ɹ]�@��"5ۍs@�y���@���u�@�CjaS@�@��eYX�[@�
�I���@�����	@ĵ}��@��	��_@��$J5@Ώ5��T^@�I�;�}@��C��E@�〒E��@�� �o
@��!�/�@��7ܓ�@�?�p��@�y��*�+@��&s��T@�	�����@�8�!�t@�m����}@�P:j��@��>
7�@�-t(��@�w�G$G@��^R�X�@�.���@�vr$���@��P� �g@��3���@���`��@���I@�I��L�@�
��@�Β~�m@��?�YɁ@�dK!e�@�5�#�q@�妒vE@���t�@���0f�@��T���@��|��~�@����6��@�t�#�7@�m���`@�k���|@�o�	E�A <��J*�A ��}^FyAP>jfHA�&K��Aq��?AG ��A�:.:�        ?�k3^n�W?�O�#�x@��|� @�Ec�n9@#s����@/w$�o@75]L���@@�R_��@E>�Se�@K"���l�@Pފ�O�]@T����>@X�꺺=�@\����Y@`�`��K@cNj�@e�wl�@h�A�x:z@k�3��@o��f�@q5C`χ�@r��+t�@t�����4@v���Ƀ@x���*�Z@z� �W��@|�6�J=@3"���@��UfB��@����s@�.�h��8@�t�S�
�@�ı���D@�(:A��@���B0�@��2�z�@�m��[��@��_�q�@��♶��@�KY�@�ඇ�l�@���H��]@��TO�)@�x�^H�@�`�'pfj@�N,�S��@�@�C{Hw@�8�r��@�5��Ǵ@�7��K�@�?�Y�P�@�L��c�@�_��?�@�w��n�@�����F@���-ö@�p���@�Dk�n@��i{5�@�?d)��@��9U���@��섡rn@�'�@csJ        ?K��h�?�o.w??��ʢ�t?��C����?ʜG7a�?ִ��1�?��gp�?�d#�ۭm?�2�� ?�H#��?��D+@�R@���*@�]y�@t�u3@��i�!@��;@&9)�A�@!�?��k@#�Yg9�@&���@*s\� @.R��S@1LS�cF@3�טri@67��z�f@9���@<	I�fW@?J���v@Ac��)�b@C?�ꊐ�@E9�g�6@GQ*��@I�*�<��@K��YR�m@NIy|G+b@Pl0�tL@Q���-@S)E��!�@T�6w�e@V$��k�@W���`�N@Y^c���@[~����@\ҩ�`]@^�!���@`>�@a1?�M|@b)�zk��@c'G�W@d(� �W.@e-���.@f6�V�GS@gB�;�k@hP1r���@i`���!f@jr��ѩ}@k����
@l�C,̙@m��"�f@n���@o��J���@p�1�j        ?��M��K}@X*���8@-�o��@A�B\O@PfԐE��@ZR_���@c:t�-�@jX�\��@q:�1�9�@u��n� �@z��-��q@�c��@�23
@�+�N���@��5܉�F@�^Ǖ9�@�d��G�@�[� �\r@�j���N�@��a�v[@��5�T�u@�*%��?H@�����W@��9��@�`��2@��#�PS@�#L ��@��Y��@�14V��@���'-�@�2JYHbh@��ԭ���@�|ݡ��@�0�Mi��@�w�/���@�[���tn@�D�P8��@�2�� eE@�$�f_�_@��%� �@��F�@�D; �@�?$��@�!����\@�-��5M@�=�c%R@�Q��'"�@�i]AK�@���]W�-@���yc�F@�c-�g�@��!ˀ{@����)a�@� ��R�6@¸V]T
�@�Q;��0@��d���N@Ć��:@�#'��8@�����/@�^� ���@��4(&js@Ǟ?Fe��        @N�(��@�?����@�����@��/d�@�5`��18@��mIVL@��?��4@��T����@��pl",�@�9
&nq~@�
��@�?R��i@�m���T@�j���@���y��@��a�k�_@�l��)��A�v�J��At��o�?Aq\�,�A�6i;A	����<FA�IX�A$n�2A;�s��Ap����A���cGA�&�Yu�AD+%�<}A���33�A��ع\#Ac�� �A���ALx}�A�� K�AU4i��A r�ꕰNA!>�ǰ��A"��%�A"��K�A#��HRA$��s�`ZA%v�)�n�A&Z�j���A'C�V�A(/�Q�	A)<�|OA*lw�]A+��5��A, ݐ��A-����A.����5A/�f��IA0�P��A0��+GA1%�V\rA1��
	�A2Bpk!jA2��7/�A3g��o>�A3�2��y�A4�����A5.��P:z        ?�F����?���h6?��t��w�?�)D�@������@����Ti@���Ø@����<@$�*���@*��l:�@0��)!�@4Y��P��@8\�4Ǧ�@<�צh:�@@�'���@CIz`v�@F|ć�/@H�H@L��UP@O``�7@Qo�_@SG�|��E@U7�p���@W?��0�@Y]�n.@[�����@]����F@`]��@aX��-MV@b��H��@c�3�W^@eI�,�E�@f�[���9@h�5�&1@i�L(Lt�@kq
 � @l�6��^�@n>��É�@o��1��@pĀ�o	�@q�����@r}k
g]@sa7;�@tIS;�o@u6��!�@v'�
י@wAj�@x���v[@y8K_(@z�h9@{��0Ԧ@|$�:�-�@}2��2@~E��=j@[���V@�;?���@���� �*@�\�j�0�@����A,@�����F@���X#@���wI�@�Vd�5�        ?}w��s#8?�-��M��?҃��F�?�P`�ﴑ?�S��4�?��gދ�$@=����@FU%��@��a�x6@��W;�@[+"��E@"L�Wb!@%��C;�0@)f��w�@-dK��&a@0�<�=��@3'$����@5������@8F�@I^�@;�G�(@>�uyz@@����@B^��y7%@D.E�+r@F���r@H Y�I�h@JE9���@L���|R�@N�}���J@P��	�?�@R
0&��@Snf=�P8@T��G`Fu@Vn��/+@X�Bo=@Y��P�d@[���Y=@]e�G�w@_[�����@`�6��,@aȮХ)@b���ٟ@d��16p@eQFqP@f���\�@g�y7���@iSi�5^1@jŢ���~@lF��!i'@m֦�:��@ov��(��@p��ѥ��@qt�]-?�@r^�`P�@sR��~��@tP[�:۳@uX����u@vl&H�Ʃ@w��zsv�@x��hVď@y�N��@{0z-�@|��4B�        ?}����A?�)���H?�qIsw^(?�SE���?�~X,��?�����@����s7@0Jj�@m֞���@ף��D�@�ؙ�l�@#3���j@&Ƣ=�@*��Q�@.�ܐǃ<@1����@4Y���@6�J��ғ@9���P;�@<��.��@?��:���@A�b\Fi@Cs���@Em����a@G��ha@I��5�@L-*,��"@N�����:@P��]�@R(5�)@S��8zR@US�?~@W@u�7~@X�u@Zقo8�@\��)@_���@`���UC�@a����k@c#����v@dt�Z�%@e�[��@gD`��@h��a�\y@jP���R@k��-{@m�M���@oU�Z1@p����
�@q}��mu+@rr�s�l�@soq�6@tsѣ���@u�J�_@v��L��@w����@x�	_��@y�v�[q@{1��\�P@|mCt)��@}������@~�^��#@�(���g        @��P��j@Hr�Zw9&@f�c��:�@zи�� @��j%d=�@���
s�*@��LIŸG@��rŰ��@��	����@�Y��� @�%��t@�O!;�.�@��0��;@����t@�wKT��@�A����@�9���=@�_i���@ϲ89k�e@ј�$�
N@�n��
�@�Z.ԙ<8@�Zh�*G�@�n����@ۖ�m��@���U�N@��N�@�>@[�'�@�vZ���@����@� f�n�@�Q�+��@竟�3@��ݢ�@�v	`^�*@��U�=�@�]�xP@��]G�D@�1g�@��w<m,@��w��ø@����7@�_�q�6@�3���P@�%ݹ�%@��M���j@��O�=�@����&@�����U@�i�NZ@�Ql#F�@�;�C��@�(��S��@��{:x@�
""�Ι@���憓�@����A w�.X��A �C��!�Au귷=�A��r� Ay?���'A�⪓�q        ?U��5Ӷ?������?�h��T}?�D�6*^?��%X�I?��� �t�?�G\���?���C���?��!/� �@+,)��@G�Ԃ�@�z��@����1�@�$պ+@��&��+@u���@ I%�Z�@"y�l�(@$�7����@'>T�79@)Γ��S�@,{P��/@/C6'���@1��K�@2��C%��@4���*@5�N�d�@7V(OQV@9�Y܏�@:�o�0�Z@<������@>i/���@@)�W��@A)���@B5ב2�@COړ��5@Dx9���h@E��~)�@F�;�d��@HG�z�6\@I�N��[u@K����@L��w�;�@N"HQ��@O�r�ܪE@P��[Z�)@Q����@Rj��4|@SPq�}�@T;�!�L�@U,_���<@V!�$gN@W��(->@X�]��:@Y�"r�@Z!����@[+��3:@\8���4�@]I"d�@^\��>�@_s6� �@`FI9&��@`�W��        ?&�Y]�?e�)��?���I��?��1��?��J��4R?�g�܋��?ɞU��d?Ҏ�4��S?نJa{W?��Z��9?��>eF?��?��\ȁ?��D��?�_��2+b?�frU�v@
���'�@<��\fY@ѯS*e�@�k��n�@�m��@w�(X@ۮ;�=M@� ��&M@7���t@���/:@!�9-��@$<�Q6�@&�(D��@)
I�Y�@+�&�bX@/���@10bCN�@3  תt�@4�l�@7���~'@9S|t_�@;��S�W�@>\[ѹl@@���ŗ@B��qM�@C���R�E@EW��/�@G$��<�@IEc���@K7E�9�@M@[|��@O�S�:�@P��=��@RG ��u@S���h@U��Ir @V�@��%@X?�!zB@Y�Pk(��@[�0B��@]����+r@_������@`�ٟ�%7@b߆v�l@c*iJ�η@d`�}b@e���7w�        ?o��{ϼ]?�p~#���?�:�#��!?ڢ~s�e?��C�	�?���dy�i@olO�g<@�k���@�V~@Q���@�V�W@ M��ېq@#��?��@'@�G|L@*����}@/���@1��y(��@4ǐ�@6��A�@9BV5t�@<�>�Kl@?�	�@A���p@B�h��@@D{Hb%@FLd���@H2��{��@J.m`�2@L?nα�@Ne����@PQ#���@Qz~�A-�@R���9W�@S�ُ�8@U?��,�L@V�YCr�@Xp��@Y�I���y@[p֝�@\��u�@^G!k8�@_���x��@`�e4:��@a�'C� 3@b�ܞPȦ@c�ғdLA@d�U��l�@e߯9̀�@f�%W��@h"�1}|@iTy�}�@j���g�@kء��@m+�9{�@n�IBQ0@o���/@p�����@qz[杕�@rC���0�@s�<v��@s����%�@t�o)^�@u�C_a�        ?�� �
�!@r���~@9m��A�@P�`$��@`�k1S$W@l��,3#�@u���.@~��2B��@���t5	@�Tm�u��@�h2s�D�@�������@�ݱx
2�@�GF�A�@�NI�5@�����<s@�NGI���@���Eў@���%G�@��*�n@��ҵ���@�iW_�@���1�	�@���:V�k@�H]����@�`�m�@���)w@���Ē@��/W<1@�v2����@��<�1(�@iYY@í�6ף�@��Դ�:@���^�@�7xb(@�{gt�b�@�����@�#5� Q�@̆Z
�R@��6�Wc@�iz�-@�ts�`�k@�8����@� ��{�@��?: >@ӝi*�l@�q!Ñ%@�H%�L�V@�"8^�_@��7Pl�@�ޜ��G�@����@٤�o���@ڊ�Ë�@�s@C�ҙ@�]�F3p�@�I�9&��@�7��Z)@�&��n��@�ͥ�6�@������o@��ϑ�f        ?^E���t�?�%v<a��?���$	y�?Ф�1���?�U�
Ir�?�F�)
�?����?���eLYP@6𒱷�@�����,@�6�ig@����Q@~MS��@����  @��w�aT@!����d{@$4���@&�g՛�T@)��`.G�@,�B`��a@/��ހ@1s��v@3*�V�$@4������@6��)(�@8�F�#�Y@;��I�@=al+�	�@?�@��I@An�[5G@BkM�&P@C�^�n�@E*9J{@F�vO2C@H��_��@I����r�@K9��@L�I��*@N��?�K�@P����@P���8	@Q�p Z7@R�uh@S��t�;@T�%�u��@U�j����@V�}n.��@W�\?�A�@X����p@Y�q��y�@ZƝ!CU�@[ۆK�
�@\�4��^@^��N��@_7*w���@`/��ik@`Ʃ����@a`(�x�@a�c<T�$@b�g��nu@c=C�\`@c�ɤ�@d����        ?]CB�F�Q?��կF�@?��x)Ć?єuo���?�@W�+�d?�=w~?�!��T4�?�U�U?����`�@�_�Z/%@��M�o@
����@H��<-@�M1��@�xx&�@[���Ec@Q�u�Ҝ@� �vK@ u=�5�@"J�"`n�@$C��I��@&bђ�]@(��lt@+"l3�@-��j�9@0Q�s��e@1ِ�D�@3}�
�u@5?���F�@7!�O�G@9"óuU�@;F��P�|@=�v��Ke@?�*�]l�@AH���O@B�:�OF@D�Y1�@E�+�&-@GV����@I�G��@J����-�@L�m�s%@O�5%>�@P������@Qה�e�@S���&o@Tn�E���@U�o� ��@WT؞���@X�����@Z�7I�V2@\R���@^+�{�@`��� @a�f�_G@b(v�]�@cI�I�j@dy�����@e���}@gg��H-@hb*�@i΁m�l�@kJ��]�N        ?D��]?{��$��,?���7��x?����N�"?�_�iiRP?��j�z?ׁu���?��:	��?�m�Q�?�'^�	� ?�qȘ��p?����V:?��w;�m�@ ��߹C@��T��@� ��x�@�����!@�2x�@�|�X#@{�$cN@���M@-b�gn�@ D����@"5E6���@$�b���|@'7脎��@*�*�F�@-7�@0N�cL��@2%��R@4!�̂�@6C�T���@8����@;,�@=����q@@4k�ŅR@A�%UPl�@CCR���@Dp��@F��ߡK@H���@J�{~y�@L�i�r0@N�x��@P��>3v@Q�3�@R�8~Ig�@TJ��Z��@U��.�Tu@W��5�@X�gH+/@Z"H=g@[��&~Qd@]k���@_'(�g�@`yv���y@ag%�3@b\�K��@cY�ue @d^f��X�@ej�_��@f~u;�!@g���[��        ?�E~s�k@Dxq�"@?[��=&@S�$�<F%@cI��$i�@o��٠�z@wZc�5�@��:nc�@�m�O�@��)w�v�@�k�IS@���|��y@�X+i�;�@�-���{@�@��B&@�ǫ�}v@��h�3Z@�n���Y�@�����u@���^ᰇ@�CC���@���q�H�@�]��$H@���N�}@�P�~�_@��yk9@��2�y�@��ks�
@���L�@��pi{@��i��F�@��+���@�ߵ�i6�@�����@�I�-�!@Ɗ�a�J&@���][��@�$�&u@�{~��8@@��7[%@�?��}��@Ϋ�&1��@��S��@�̊X��@ь�/��@�P�ǩE�@�z���@���U�@Ԯ��1�~@�qa���@�R��넓@�)��O�@�X���@��:��T~@��\E�_�@ڣ�>��Y@ۊ�q��d@�uDX�J�@�csI˻j@�UlA�@�KE�s@�"��+��@�j�q�k        ?��į��?����9�P?��i�x?��JZ��?���t�v@���Ā@&Hg^ӯ@����]�@!7�(:��@&R�"��@,6x}�@1|�ɒ��@5W����3@9�*�-;�@>����Y@A�(��Q@D��%j�@H-�S:�@K�v���@O��C�@Q�2D�S�@Tp)+@V^�q�$�@X��A�x�@[��j({�@^{m��O.@`�j�a@@b`$�2%�@d����_@e�GwdeJ@g��2�?@i�%nj�@k��Q-�@m��'�5�@o�� ��,@q!/��h@rP8�J`�@s��1?{�@t�".4�p@v!�-�@w}�q��_@x�',@zYe�1��@{��q��@}d!y=tA@~�!�+��@�N�ǉ�a@�&W���@��q�1J@��-�|�@�н޸�]@��pMH@��Fy5�@��?^5sQ@��ZO3�@���d��@�����}�@��SQB�@����E@�JD20@�@�J��7@�m9α�+@�OЈ̭�        ?j5�N�~?����<?���9M�?�z��x(?�c�J`3@!��>m@	�{!	g�@�Q�7h@l��u�@��!�^@#F��@'0�H�@+����@0L�7�@2�����@5���7�@8���nj?@<D����@?��ݭj�@A�l}a@C�3.w@F{��V�@Hm�Z�e�@J�ot�y�@M�7F��@P-�wk^@Q�GH���@S6Jn�(@T�x<�eu@V�T����@Xd�K��@ZK�=� @\JĚK��@^b�D�"�@`I��f�#@ao��n��@b����l�@c��ħ�E@e3(Z�f�@f����@g��s�t@iy�?J�P@kh�Ӌ�@l����@nM+�Lr@p o���@p쀀V�@q��f�@r�>(es�@s�PT�S@t闸`��@vVZ�w�@w%�m��@xTO�Vn@y��W�l@z�Qݗab@|"�ZVP@}~�]i��@~濬�2�@�-�<F�@��&�(Z�@��DjP/ @��'$�)�        ?��۲[��?�|`�X3�?�lѥ��?�H>^0�#@1l��@�n���@"�&:w�C@*_L���@1�]���@6������@<���Jb^@A�$�]@EX���@I�^T�6�@N4�"��@Q��v@>@Tz��e?@W��ꊞ@Z�HD��@^��x'��@a8fmxq�@c[>֗��@e�X��Y�@h6ʫ7rV@j�):��@m�A\L@p��`�@rIz�4Ճ@ti��+,@v���@x�l��@z"Uo�W�@|XtD=�x@~��[!z�@���?�@@��)%��@�z�W4i@�~L|��0@�� ō>�@�k�a/R@��j81�@��h��v@�LT%d�@��&�&�@��a�!�@��#t�]@���s�@��ݜ�U�@�n|���@�v�n�@�@��m��@�n�x�V@����F��@�睋m�1@�2<r�@��eMz��@���[�V@�K9�a�o@�]�+�� @��
��@��d�c�@��(N@�m��ǻ        @o<rs�|@@� 4���@a�|:o��@wp��N@�[B��@���]N@�� �`.�@��\mU@�E����@�=@H(�@��A-�@�3Ⱝ��@��|��@�eCS{��@�N��-@��f��@�8�g��i@ҕ�k9Fl@�!�2�Ё@��XT*�@�ʁ#hv�@��|���@࡫���N@�j��,ǀ@�R!MS@�X&�{��@�|z�rA@�2 ��g@�\cnWN@�8�j�f@�����@�m��W�F@�� ��n@�E���j�@��Vا�@�S��6�Z@��00}@�@����XW�@�J�Nx��@���ufA n)�*��A\���9|AQ�jd+QAMC�7�AO�.rS�AXo��,�Ag�Y2�1A}UޓgEA�;�إdA	�Tě}�A
���A�I$��AF㉁LA�2�8�eA�4p��A�!(9A(Қ�z�Aр�̭A}	�cA+eȂ_�A܎�=A�A�{�[[QAG$�T�7        ?r�����?�,�?�U<��@�?�S�N���?�0t�W�@�""��@A��a5�@T��}"-@Ş��@ �����S@%7}��f�@* �xf�@/8�T/h@2k͔�@5l$&VS�@8��K
�
@;�?�5@?b���J�@A}��I�@CXo�Vr@EC b @G<���@ID�Uժ@K[#N��@M~��
�E@O�NE��z@P�6~�L@RߊJ�@SE�Hv�@Tvk��&E@U�_��%�@V�_��@X.+� [@Yw�PDg@Z�l�M�@\�����@]~\j��x@^�{S��@`)7�#�@`�C(�k�@a���謗@bg?�5��@c/��ix@c�q�~�L@d��@^�@e����$U@f�/Ի*@g`=�@~�@hE��D_�@i/�~�"�@j%=�ސ@k��N�S@lP5Hу@m6�u)�@nXB�@o�jZ�@pT���@p�۹�Hu@q*Ym0�@q���,�}@rJ�|x@rݸʋ
@st �ֿj        ?r���6j?��m����?�����?�S(J�WC@ ����`@��\�@Oycg{!@��0�@#��g�_�@)�����@0	q����@3�fP?g@7���e�@<6�o^#@@v<#���@C* ��@.@F$�Ld�@Im)Q�C�@MK,̥�@Pv���/5@R���#�@T��ܟE]@W'/A�@Y����W@\@�FJ[E@^��7R�%@`�����@bp|s�@dG7��@e���E��@gZa�N��@i b�y�@j����/@l�4]�=�@nܠ��.w@puF���C@q���W=�@r���܎�@s��i�@t��@v+�B�8w@wo���2@x�E.sM�@z��	t@{�]XX"�@|�`]�z@~pF�\�@�GtY�n@��PvO¾@���1:_&@�q��>XG@�PHlZ��@�5��v�A@�!�1�+�@���~ @�+o�@�d��:@��M�?@�(���8@�?�����@�]���g@����k@@��g��_A        ?'�!���?`���F?�v�]p�?���3x(?���7T?�v�'<(B?��J��2�?�P���҈?ʛ�f��?ѽ�7�yP?���z�?�y}���9?�?�}M?���[�#?�6߃���?�&��|6�?��f�V?��:�·�?�d��M�@Y��<��@\�^�Y@ē5h�@��a(�@��3@`T�2�@r�; @��I-@t]��k�@.n�r�@!�#�0��@#��58��@&n��nޗ@).\j��@,0�ƶ�@/z��]ar@1�9��a@3{�^�8@5����@7��y�C@:a��og
@=ƃՄo@?���؃�@A�\�@C6��>=@E[���"@F�4$@I �_��@K3��7,@M�d�F�@P4:���@QZ�<���@R�D{ݤ�@TC�Ś�"@U�}/N)@W��43�@YO:�o��@[/�UJ@](���if@_=�WR�@`�(3���@aݞ$L7�@c�~'{@dVf&�@        ?�b!���@2�Z�Z�@U�}�)�@m}����@}�+��Z@������4@��iI���@��A`@��@�����%�@�H����@���Է@���K�p@�fzk��S@�b�="@���$T��@�����Pq@��c����@�#,yO@ȉ��9�W@��ű��@���+�@���(?x@�U��e�S@ҩQo��@�\�Ŀ@�_*�bq@ֿ�b�@�#����@ى��'6@��2¤Uf@�])\.��@���C-�u@�;DD��@�W��b5@�K47<Q@��-~�)�@�~��W@�T�B��@�x�@��&�O�@�����{@��Y9�k@�S��"�@�+Mi�k @�ڒ<L�@��kt<�@��]9�@����B�@���&y@�+L�@��?x�I@�|nk�@�<�
�@��ɺ~@�A��0 �@��u|,+�@�O����@��B�\"@�g4�o�@����QL@�^�4��@����@��Ԡ�z'        ?[��n��??���� ?��ǋ��?ʜ.]��?��s?�.�D�G�?��^0{�?�CWHƋ?�y.|�<@ �[��$@r��˧@�O�6�@�����@��Q�@B�ݵ��@�	�a��@��a� @�BwCC@�ؠ�R@!~�u=@"�jw�h�@$����,�@&��2}�@(�}���}@*�/r��@,҇_�B�@/xfp@0����^�@1�u4�~�@3'��g�@4qZ�,�@5�h*M;�@7#�q��@8���wY;@9��y�x�@;}�WP��@==���@>��}U�c@@�h�u@@��o�z=@A��mX@B����.�@C��?��@Dz��]�i@Ej펨K�@F`���F�@G\&G���@H]I�+cE@IdK�d�@Jqc�98�@K��wb�@L���@M��Ь=�@N�����{@P���@P��ܑ`�@QG�P)��@Q�1��,@R�9�F�@SC4j@S�3b�;@T���L7�@Ul�����        ?E��qY�?���C��'?��0�#'�?�V0U+�?����Q$d?�l���?�!�jA:?�_�m?�J���>�?���Y� H?��"�Yo.?���o@؝	�C@ez�@	29)��@~,�1@-x6�@�\�Ѱ"@P�)�@v<�|/@Q�%Sk@!M꽏ޕ@#��3�~@&Q,�)��@):Y	\��@,p�fl`!@/�"=IU�@1����L@4�w��@6s�$]��@9
����q@;�a*�I@>��1�@A,rBoM�@CԌ8+�@D��8o�@G$߰�g%@Iv��5@K��/I7@N�̥�@P���'�@RM��?�@S�H�j@U���Ľ,@W����@Y�d�0b�@[��+hɉ@]�T@��@`/�J�NX@as�z��@bȴ��%`@d1 �'IQ@e���c@g<�̠&�@h������@j�fwZ(@li|���[@nN�w��@p%
���@q.�RD@rB�a�p@sbϮ@�j@t��[���        ?0�:f��?f�<z<�?���(~}?���s��?�9��P�c?�!�a�ag?Ǣ��ו?�4R�$ps?���f�?ߍ	�O3�?�Zw`�s�?�&�33}?��s4��?�fd��X?�_��f"�?���t�֔@ r��@D���x@i�mu��@	�Hy�E@�����v@�K± @_�u��@��A)�U@�_/�l�@��1��@*a�C�@!d��O�@#Z#��(�@%wI��9B@'���74"@*.�u��@,�n���@/���[�@1G-07dD@2ۗ�0��@4��Ei�M@6O�&�z@81��3@:/,�U��@<JPg�@>��u\�@@p��3�@A�"|h:�@C ��տ@De{�G�@E޸*�@Gmu��@I�FDܙ@J�(^�|S@L�w� �@N�ގ�om@PQ�O|@Qd���@R�!,�
@S��'�!@T�S�NsW@V>��ݎ�@W�sG0��@X��nN� @Zu@���@[�/����@]�:��	�        ?Ղ��]@e/�6c@2QWvw�@G+���e@VN\%,�%@b@��!:@j�P%߇@r{��fL@x|]�� @~Pg �)�@���*�t�@�a6��d@��M�B��@��F��@��%@�V��C�{@���l,�@�F`����@��*��z�@��'M��@�j_5߁�@���F�1�@����r�L@�gW���@�8�����@�qBK��@�����Q@�!a�4G�@�@i�I�@��Yh �?@��� �@�/���#@�=����v@�|.=�@�ùpx��@�1�j�@�m�5 V�@���N�*Y@�;	��s�@���F@�+����@�X�gixH@���Uz�@���}2��@º����@Ï~��b@�gӲر�@�E@�,��@�'\��t@�GC�@��%.?g@��#в(@��t&��@��X��;�@��黖@���;@���a�%!@�4-H�@��M�@ЦI&���@�<�����@��`����@�v��XT        ?c�:.U�?��N����?�s��'>o?�dl�/��?�ˈ�L?��"��C?�V��P	?�r
$���@W�ǝ�|@�,��pK@/�	m��@/�����@���PJ}@Oǭ(�@�2����@ ��
@"��f�W�@$컓���@'RA�\!@)פA��J@,}<��l:@/CK�@1�fpq�@2��� @4,�"��U@5ц#�5�@7��ؕ�l@9L���I(@;#M���@=
��E1@?�u�>�@@�� ��@A��#f�@B�Ur�_@C��t�/$@D�RXV�@FuwZ �@GAY��dN@H|.��)@I�u��M�@K�m}��@L[
��$�@M�h�#�S@O�)C@PA��?��@P�S;G��@Q�}ԟ�r@R|��c@SCF��۳@T����@Tߔր��@U��f��F@V�=*�v@Wn�9o��@XSIaԶ^@Y=R��p@Z,�1Y��@["���p@\��w�@]��c�@^#�|ߟ�@_0+"�]@`!���        ?E�h��8j?����C�?�k����?�q���?�`���?����?ߋ��ϔ?�/zЇ?�[DqD�?��K��~F?��f��j?�ڿ����@`�U�@��1_@OMq��@\�*"R�@m����@��0C@��^���@��x��2@���@�$sR@!؝�}�c@$D0U	@&`� vS@(�yQ@+�2"�@.�&����@0�j���i@2�e�J@4wh�kG8@6l����Y@8����@:�;woE�@=!X��h�@?����5@A-�ツ�@B� P5�-@D �)";�@E��p�q�@Gp�i�g @I=�X@K$���N@M&�q��@ODY��"�@P�V1�@Q�o��v�@S'�d�@Tr�c�@Uϵhiw@W>,��@X�&�0�@ZS|]%@@[���`@]�����@_�]X/%@`���j�@a��N�|@b�(�@c��@V�@e
L��H@f>)��T@gsA�n"        ?U��?��	�/k�?�g���qX?��),,e?�>;e*��?׼�w_'?�I���x�?�uN����?�_d%9�L?�	!59s?�N�jN?�
K�Ub@ ��Z�S�@���C>@�_,��@
J~��;@7���@G
?5y�@�$��X@S��&�%@@��YP4@{B��@ A�Q�@!���A@$&1ۋ�@&���	H�@),K� >@,bq�U@/H���K@1h�kʔ�@3[Mfs@5�?�l�&@7�L��Y�@:tSp��@=Mp6mg?@@6y�|N@A�-�
@Cʫh��@E����{�@H�:�_�@Jx-�m+@M-�V��@O큋+O@Q~�j�@S%F��A@T��@0@V�Z�E�@X�@V�Jo@[��b6�@]Q�@y?@_ıp
0�@a.��=wT@b�����@dB�=�9@e����I�@g%��/�8@h�5gW@j�����x@l�Z�?@ny'Pګ�@pE��@qZT	��s@r|֞�|�        ?�%�f��@1�I��u@=!��3@R7��"�@a|��E�@l�gj:u�@u-"�@|�3���@���-aQ@��תNW�@�I�bذG@��b�F��@����W_�@���E�@������;@��׭�?a@��~w�v�@��\�~@� S�p�T@�w�5e=�@����6,@�}���@���/Ш@�{Ҫ���@���ItG@�t����G@��(�G�@���`T	�@�Z��跅@�3�<@�����nd@��<@@�Ys��:L@�VO�v��@�Z0���@�d�|�w�@�u��+.�@ō��{�L@Ƭ2B!k@��:�T�@��{A���@�.r��3@�g#P<��@̦��O^�@��v�y�@�;|k�T�@�H�N�D@��*�<�5@ѩ��4��@�`�Ū]�@�i�J�@���_e�@Ԡ�i��7@�jn���@�9tQ{�@���>+f@������@�ǰ�華@٭	��_�@ڗ��M�'@ۈY�z�@�~��m<@�y��uL        ?1
q9�?nO�muhS?���S_�F?�R�����?�,�D?��NN&�?�G�zj?��?>�?����?�z�na��?�Μ߱�R?���H�?�,OX�?��� QͿ?��-�q �@�ěS�@�D84�&@�����@r5�3-@��/�X@"�}s�9@H�b-|�@�N�N�@�/�~�@���S@+�J!�Q@ |�,�@!������@#~Wb�@%�փ��@&�A�ɜ5@(���K��@*X�c��@,=�j�B8@.4�����@0G�N��@1-�s�D�@2E�\�@3g����@4�����@5�Z�t@7��J�,@8W�[?e@9����@;q�,��@<����x@> C�@�@?����'@@���/H@Ab���,@B<4aTS�@CS��C�@D\���@D�K�#@E�����@Fᦪ�7Y@G��1�`�@H���W�g@I��� Nv@K�t0^�@L/��?@MS�K<2@N}���        ?	��d0?M�II��?sRƤ� '?������?�B��?��M�/�?��5��x?���e ?������?��4O�#�?�R��n?����?��]�8pN?�{�G��?���,�N?��>�?��K�A2q?���9��@� �u�@�Mݍ�@-T&��=@h���@�Ȼj@�NI�@@aQ	b��@;np�@ ���3� @#x7M=p@%�bv�R�@(�z˚�*@+��qЪ@/�����@1d�|p�0@3i����f@5���1Ez@7��sc�~@:��=:'@=E.+3Z�@@)��L@A���f�u@C`�}��@E-~�{l�@Gʑ�kj@I d�9[$@KHǆ�(@M���|s�@O��l�^�@Q@�88�@R�s�~�B@S�fcy�@Uu�Zhk@V�HAjPz@X�+c���@ZF*1q��@\ Y�l�@]�N.��@_����]@`�*[W@a����1@b���R�@c�o��f@d퐛��}@f�:n�        ?װ�??A(�-�?d��p�X\?~��:ݽ�?�L�ѳ&�?�[��9�2?���c?��cQ��?�Q�#J?���&�2+?ϕ�x��?�S(���?�C���B?�pl��?�v��n?�*)�[�?�� UX>"?��"5R[c?���Ɂ>@���8o7@iV��s�@	�'��F@�M��w$@#�W��@YЙI�@�j^�6%@;I��@ ��OQC@#h}�N��@&D7���@)o���4@,���*V@0e�r0+�@2�a�dts@4�%�X�@7Z�;��'@:��@=�L_>2@@#�Z^Z@A�rx�<n@C�<�C�@E�<�I�@G�6
���@JY���A@Le�QJ�"@N��Cm�@P���u`@R$űs�<@S��]:��@U�H/�9@V�k���@XX����@Z��/�@[���u�H@]���k�V@_�u-ֲ�@`�С�o�@a��95]f@b�H���9@dC	<x'@eG&��,@f~H\Y�@g������        ?�jC�b�O?��c&̸@�Gy��5@����a�@0��E^E@=@$W#A�@F�7ɋ@P��"�S@W"��@^{�T�{O@c���D(�@h��%�'@n"M�Uz�@r2���`@u�7��C�@y|�M��@}��a��G@�&;;��@��B��3L@�*�Zq�A@��6��i(@��o���\@�%���љ@�AkQ:Z�@���}@��<�@��	���@��^v�D@��@���@�aCMt�@�������@��|�:@�k&jm��@��G3I,@�-�����@������@�(� �@��l=�� @�^��t��@����?@���<�m�@�Q�D;pM@�C �启@�<��P@�@J�%@�L�L�rH@�ci]�l�@��r���.@��7k\Q]@���S.�@�(�-M�@�u�R�!@����Js�@�0�	�@��t< �@��2l%.�@�LA����@�VTG�@��c��@B@íb�S,�@ĂO��I@�\)X�x@�:�2N�Y