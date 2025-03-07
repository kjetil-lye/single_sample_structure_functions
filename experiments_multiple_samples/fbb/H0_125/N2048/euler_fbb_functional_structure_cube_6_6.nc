CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            i/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_125/N2048          alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-068          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190902T113937        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                @              ?�����?�*Z�ۡ�?����\��?���K�E�@�72Q �@�kx�h�@axr]�Z@k�N`��@$Q���@)�$��4k@/D�_�@2͡�#�T@6A�����@9��N�@>���۠@A(��.*%@Ct_�p;@E㶂]�@Hw�
��V@K0а�r@N��^@�@P���E@R�=�B@S�$��5@U|m{)1�@WH���^�@Y'ɤ%�@[B����@] >�\�@_:�[�1@`���@a��j�T@c k1��@d684�]@ev��0�@f�w����@h����@iw��C�@j��Z`�$@lYQ
	~@m�ӫ�L�@og�܇��@p�x�|,@qQ�ֲ�f@r)���\C@s"i�\/@s���@t�B���@u�w��"@v�@<O%,@w��4�@x���mT�@y�$�&�@z�Ne<@{���A3@}�4V�X@~D�t4s!@r�▥�@�Sz���@���{��@���ރ�e@�3�>�@���H��        ?@�w�PO?r�q��\?���R>?����ڜ�?�R<+�"�?�}m�M?�����o?��=y�?�'G�x.?���Pq�?�$�vvk�@VX&Ru	@�[Ț'@�-�@��Mb@$��w
��@,)��o@2� �@8=E���@>��;i��@C|����d@H%�	W��@M��\�@QΘesl�@U=\4@@Y@χz@]H��^��@`�Kq&��@cwվw��@f/:L`f�@i����@l9�1(s@o��dG @q�@r��@sh��p��@ub	����@wwV~�;�@y�p��.@{�q�#��@~h��e��@�|�?��@������w@�?p�P�`@������@�M+��F@��/p�V�@��� ��@�}���N\@�f=�J@�g�jw��@���_a��@���{���@�nd���@�B�E��E@���Jnwx@����@�V][�:�@��O��+i@�lw��bm@���(0@����O��@�XE㻙�@�Q�C�        ?+���?Z�|���?z����*?�+o�m?���[o�?��ws�\�?�)�X�S?�^��/?�ล��?���>rR?���a�@	�U��-@B�O���@�l@�yV@$�Tζk@,��9�@3�+�9@:2n=�ӊ@A!��U��@F��A��@K�x�H\@QQ�@��@UG�C���@Y�,Z�@_	vBW�@bt�Sf�P@e�IW�H#@il�*�@m�5T�"@p���IA�@sv͇^h@v(�p2y�@y��3F�@|K���
�@�C��i@����|�@���J|@���{-~@�PJRV�@��l�i�@�������@�8�F��-@���0'�/@�mր��@�1���x@�'���@����VP@�2����#@�s4�v�@�����@�.7_bP@���EM��@��7yaI@�h7�M��@��Sv��@�����F@�W`��@�&�u�@�𰽈�@��T"��@�����8@�$�$� @�G���<        @:�i�@dԤ�oy?@~��lmlw@�_�#7"k@��� �@�1dw�I�@�p�kҽ�@��S@<@�s�`r�F@����M�@��A(@�J����@@�D~2���@Ό�k�d�@ёy�É$@��M��@֜���@�\Y����@�C#y�\�@�P�uMK@�B�@_��@��זO4@�O��2g@�Ju@�@�o�?A��@�kص8h,@�{�΃:@�U ��@�k�>פ@�
XZ��@���c�@���L@�Fky�F�@��g͋QM@��e9y@�c��@��Ġ 	&@�`�k�']@��kf��@�����A �A�7+bA~?&�#Ab�a��AO<Q��ZAB���C�A>?��`�AAT��J�ALOu�'~A_R��xA	z�Bn�A
�	7��A�.ĝA����XA<91��A���6�Ah�����A#0�Aŷ����Az���	NA3���SA�~^C�A�#O/�QAx�㜛4        ?a)�[6�?�x�Qg\l?��璅��?��D���?ؠ,���,?�֙�u�?�7:OoB�?�&]We��?���~X?�8�E��@!���۠@A.b��@>���3@ݳ?D�o@p5�p@$�J���@{���@+�l�@�{�Q@!�����@"�&�*@$�0p&��@'�Wr��@)b{C{�3@+���[�@.i���s@0���@2�w�l.@3����Hy@5F����@7	��Σ@8��?=��@:�d3��@<���ڋ�@?5�a�t+@@Ƶ��@B�p��)@COu�v��@D�����@F����#@G�I ��@I+��-o2@J̭:1��@L}���@N?䒙�@P���@P�W�Hp@Q��z���@R��f�@S�ϰ�q@U	��/o@V"�l%�@WD`?�ll@Xn�1� T@Y��JK@Z�
	�}�@\"�t�$4@]p�x5h=@^Ơ� ��@`s�u��@`ŋ�Ƅ�@a|n�'d@b6𼚫�        ?��C���?_�p��,?�K���Z
?��J5?�t�bA1?�q�a?�#Y0�?�[F��y?�G�?
�r?��&�	)�@��C���@nƫ��y@,*v#��@ 7�^~^�@'����@0v_�@5�`�J�@<��s2	�@B��yY@@G�(�t��@N'����@R��V��H@V�p7��@[�O��˴@`���
=@c��U޳P@g����l@jԲ��7@o�Q�R	@q��C�z@tY�c�Wm@wч�@z�ԟr@}V�2w5@�k�� e@�N��w`@�U�@�$e@���g�Q@�יl�y@�U0Z�p�@��?�~�h@�h�M�չ@��<9 dW@��/L���@�1É��@������G@�ۘ@@��t\jr@���!/�@����ȴ@�����C�@��솵8/@�/�鲔@���I���@���Ƒ�@�V�:K�!@�خ�̖�@�k%*gx�@�{��M@��K���@��m���@����[@��d���5        ?G�,��&?JJ��?��
1�)?���8�?��`�C3�?�,Z��t?�»��A�?䘜U�*?��@��AS?��G��@�הm8@䀦�}�@����8@ ٷ�),�@'��<z�@0�����@5���	�@<Et�}��@B>�q�{@G.O|�@M	4Q�\r@Q�b��2�@U�Z�@Z�ӻN�@_�d��!@bڗ<]%�@f5P>:&K@i�O<g��@n.�����@qn���uj@t��/@v��ۤ@z<�v�M@}�Q�XT�@����v4q@��@]_��@��	�R��@�d�+֌�@�X�@��(n��F@��/@��X@����t�@�`ip� �@�C�
�C@�G�V�|Q@�m˴�D�@��	Q:u@�$���:@�[�1�c@��k*�4�@�(в�!@��i���@�F�k��,@��JwO@���2�fa@����3 @�����fi@��(p*qW@��Hݑ��@��ȉ�@��rV�@�EU�Z�@��O���        @�|��I�@:��]�J@X�R�t�@l���p�,@z>�� $�@����{Y@�����z@�� }��@���<��@�� ���@��up=@�|�;2/@��'C��@�/�Z�@���w�@�l�� v@�]��m.�@���Ol5@��d_�sb@�O���N@�H��@�f�_�&@ǭ�?���@����@̿ĵ��A@ϐ`���j@�JL#U�@�礼R.c@ԡ��\,�@�y���E@�qin�M�@ڊ�R;�@��=���@�$_M�&@��p���@�*��@㓖�m@��4I�@�t�TZ�@�Lw�=��@�	�&2�@��Mϥb>@��H�F@���.�@��+�ج@��U��@�����L@�B�_�_O@�uN��s@��)�ԥ@��7P2�@�Fx4;�j@��XD�	r@�z�=J@�l��9��@��|�1�A .�}�OA ��<Y�A�kg�HjA��V��"AO,�Y�A 2p�;A�cpW�        ?lkMz'�=?�PC�Y?��I�q?��=���?�B�V���?��IT!��?��VK�j�?�*�X�vw@Hn��K�@��p�@�,h�>@���@]HH��@7��U#�@ya�vF�@ �(���@#�4�*@%����ԡ@(��J@,���T@/��M���@1��ٵ�8@3����}}@5�a�&�@7˄'=�@:�&��@<��2��+@?�V�0-@@�mtD�@BP���/�@C̞t��@E[w�#�@F�����6@H��ՙ�p@J{g�J+@LY��Q@NM�1 ~�@P+�^�{Y@Q;��fM�@RV�Rn�@S}哨��@T���l��@U����-L@W;�J�r@X����)�@Y�CG4C!@[k�5���@\�:N*�c@^x�R:/@`	X��f@`��}��@a�Fb��u@b�v��@c�q�P�@doH���(@ee�A��@fa�r)�^@gf&���@hq��1ƣ@i��@Mx@j�s� I@k��D9�]@l�B��i        ?8��z6��?t�Iq�?�8BN*�3?���O}?�kiUņ�?�q���'?�3�Y%�
?�od?���2�8?�~f��?����\ @��y+T+@ubr���@23��=@ RX�@%��@c�F@-b�OC�@3aȘtџ@9,�a,��@@�R:�@DT�m�S�@IT�B�C@O+�P�5@R���	��@V�]��.@[;�w|��@`���(@b��&52@e��	��@ih˅�@m5�/ې@p��)�߸@r�	�-b@u�� ��I@xC����X@{B��<�@~���"w�@���CV�@����Ì@��t�L(�@�7{�x@��X��D@�&�a��(@����bD@��p)��@�po@�Z@�ˈw@���IM&�@�����G@���WX�/@���_��@�օ<d�@���x#�@�A����@��N�c�@��(`M%�@�4�W���@���JP�.@�'%��@��9���@�\nL`�@�x'��@�קIG�        ?YcZ�:�!?����)S_?�u(�<�?�,�x�u?݋�a�h�?��'L�?�����3@ ����@����w�@� �;$@��R��@!%po�a-@'8��@/����l@4v��L��@:�$�H��@A*��9�@E�W���@K{���@Q�_җ�@U�U͝�@Y���lm@^�=M�@�@b}��m @e��~�#�@i�3L�@n6v�x@qi��*�@t/m�~@v�-���@zmM�;@}�o`�'T@��X�q�@������@�ǁ��r@����@��I�
^�@�8�"�Z>@�
����F@��E��@��*�Ь�@�I+����@�(�U>@��?�ˍ@���k��@��p��D@��B�N}@�.�cr�@�\���/�@����M@�ޕ�]O@�3U��p�@��v�&�@�,�6�@����U�@�=@��ԪY1@�Pv@�ag@�֟��@��� ,�@�����:@���WbB@���a�E�        @n,M��@HZ���@f���K#�@{kE�c@���󽀵@�ف��W@�Ϯ�W_%@�br���@�d#���@�<���Q�@���1_�@�G�_P@���>Sd�@�># �Q2@���Ͳ��@��
���@������@�k�wJ��@��O��'@ר�A3n @ڎ�
�9@ݥ@�ʨ@�u����@�2�M��@��#��@��ק��@��7i�ǅ@�O�-�@�Xkɿ'�@���#@���td#@��x5D�@�'�C��@��.MX�@��wPb/�@�v�9"L@��Z^�T@��B�
�z@�Lrf�oF@��V,�@���l9��A �ূ͝A�z�v�DA�L��8A�J2r��A�^��߰A�o"A�AY�FX�A@�,��3A	o-�P��A
��:��GA�����;A&g�1]�Ar`��
)A����S#A���8~AB{;o�AA���L�A���΍Aq��ĘkA5��c�!A�d��LwA����        ?a*̛}*?��UnE?�D���k�?�7av�ɇ?ڨ-[s�?�e镦^?�#���"�?�yX��_�?��#�@2*�ɗ�@�]�\}@g��+|�@�M?v�@��Dl@�lUM�@���.��@ ug'��2@"�>�WBm@%P.���@(M���@*�sE��@.H�.n@0��c���@2e<w��@4=����@60غ 2�@8?V��E�@:j��z�@<���u�@?�qf�@@�D���@B .$:ay@C����?@D��U�2@Fs;"��@H�+�F@I�z�h@KO1˛0@M�D��@N�(͂�+@PX�$�8@QN!�Xk@RK!�G3�@SP'!�΁@T]]P�.,@Ur�Y7��@V�	l�@W���P�@X�^dDz�@ZҌ��@[a8|9�@\������@]����@_[i��@``D�	@a���@a��q�M�@b��_1@cT0W$O@d+�a%�@d�����_@e���w�y@f�2KO�        ?R'S�Jl?��V�[�?�B.+�?������?�-�kc�?ۀw�{0�?�"��?�t�T���?�U��
@�@�x�J3@	�����@);�cz@��^;B2@!®�D�{@(YoR��@0v"r*@5�P]��R@<��z� w@B�H���[@H��@NsGa��@S-xJ��@W�0.��@]lU)c@a�l9�'�@eXNz���@i���Eۖ@nb��d��@q�a�O[@u��@x�@�,�@|y�:$�@�mp�X5@��.كLt@��@m�
@��?���@�����	@�k�<Ӥ�@�����c�@���VH��@�(5�E
 @����h3@�lsQu(�@�`%���@�ƥ�@�{qnf@�NZ4�@�A��.�U@�U���@��Z�K[y@��R��@�_R5k	@��{��:@�a�t@"@��Y4Y�d@�]����@�����jw@��u����@�g�{�)@�<��#@�%sj�@����@�VU#�m        ?�,�,?BEwo�?d;&zp�?~�w>�?�dx���?�ig�v��?�8m!�?��*_���?�m$!���?�0�j��?����?�mV�X�@1g���p@H�_�#@��	]V@�n\��@#Q��-@*�@K7@17DP�)�@6Zs���K@<��K`�N@A�p�,�f@F[�Y)��@Kv֦��K@P��{��@T���@W�y�Md@\N���J<@`���S�V@cYՏk�A@ffJ{)�@iŢY9jr@m|{���@p���.K�@s�VP�7@unyn�@xv96J�@z��y�o@}�ܢ� �@��&u~xC@�o(I+@�W��\�r@�c&�eR@���8�e�@��1>-�:@�a>I�Q@�_S>@�i0��Q�@���{U�B@�y�AF%\@�$�3���@��%&,5@��)RyN@����^M�@��t+?QZ@��l��@�*�s�@�b}6��@������Y@��m]L\@�k�"�@��C��Р@�s�2�X        ?�ֳ̫�@1ơqu�@Q�Gl�J@e��N)A�@targd��@�����4�@��ʹ~�@�f�@���g��@��e}���@���I$�@��G�$W@�Y.�a@���=R@�)�w�|�@��IDbtR@��;�Q�@�`2h,��@���k���@�e];�@�t;����@Ũ[��S@�����@ʄ�F�f�@�/�>���@��jmc@у�~>�w@�E#�׭@�ʄ�=�@֑�Бǁ@�r@A�@�k��.��@�~���]�@ޫd����@�x˓myh@ᨛ����@�����/@�-��}�t@�`�2�"@��<\RU@�S��p7@�Σ?3�F@�V���@��
�s�@��_�@�9��:�@������U@��HZ�1@��E��a@��}�{��@�Ň�53�@��$��$�@��N��@���ֆf�@�"��Z@�'�>�@�Q]#yl�@��q�@����W@�� ���A g��!+A ��H��Al�}S%�        ?yqg��a*?��ݮU��?�M��;?��	��Z?�	��
ӏ?��`�+}�@`4#��@
DIA��@����Q@XzM%@��1A�@(5��f�@"Nݧ]��@%6tZ�:9@(I���@+�
��!�@.�8��@1Et~�@3&/�d�t@5�v7�@7)�)a@9K��6o@;�$zTd�@=�8F�M@@�f�.q@AQ���r�@B��.!;1@C����@E9։o�X@F���r�@H��V:v@Iv�a�@J��{�f@L{a�T�@N5}�(�@O��t���@P�Ó���@Q�J��$�@Ra�8=`U@SF�z�@T2'#8X@U#Z5���@V����@W J�5�@X��I�@Y%���u@Z5�	�o�@[L�g�RM@\j�w$�@]��RH0�@^�7Y�T@_��ȅ��@`�v��%@a6�̤�@a��u���@b��O�@c1��9@cᜀ��i@d�OA[@eO]O0J<@f�c	��@f��%Ŀ�@g���ٮ        ?mZ�����?�-qJi?�L�rsw�?ۦ�'E�?髈Kjy�?��x�#i?��|C�@���@0z�[�@��`�H�@�q�`3@"k�Bަ�@(_����@/�}}�@4�m޷�@:�`�@�Z@A��{�@E���`@J�����X@P�&�9d�@T�����@Y'J�%�@^a"��'4@b=��x)@e�-q��@i��@nDC�*�@q��זx@t���-�@w��H\��@{5����@S�6�@����r��@� �}$@��ӵt��@�T
Ip@�Z���@���%�~S@��h�{.�@���<�@������s@��o�Xv�@�H����2@��b]�h=@���F"��@�V�!���@��}�Σ@���W�"�@�w��h�@�f��@�t�v�3@���H��-@��ET�P@���O�@��,�~z@�P�~[�0@��_(.�`@�:*�#`�@�ʰ�
	�@�nf( �u@�%��A�@��<dRz�@��O�ē        ?@��Hw??���ǷR2?�_nvϵ?�a�r���?��?���?�r�[4�`?⟇��%?�6ug1�?����'�@@4�!���@	���I!3@�ӳ�"#@��V�Y�@"�ݿZ��@)Ŀ�޿f@1yG-sM@7M��A[@>�T�Q��@C�{;�@I7��q�@O�ߡ%@S��!"�@XB��?0@]�:U�U@a�j`��z@eCg�N�@i3L�lg�@m�)��q�@qQ ����@t���{�@w0ūd��@z���D�@~\�߶�@�<ʿ��1@�z��<e�@�����n@����r�!@�aЦ*�@�mB��%@�׎#h��@���ߥ�@�l�T���@�a\�xh@�q�=�.@����i��@��O�=�y@�K�.��w@���mOY@�3D��@��W;^)>@��N�\@�gs�U��@��=Di
�@�pB@��@�dj�$�@���^���@�I��#1�@���Q��@��29�^@��%�!#�@����+�"@��j�r�@�m4�en        @!��遖�@\��L~cq@{�L���@�-S���@�p��X�@���@��h���@�4��L�@��|W1��@��VKݜ@�|ƣ�� @Ɂ�����@�� ��@�%��ĺ@Ӆ�i��@�C���@ؠB+b@�\0z��@�7��\P=@���}���@�'qֆp�@�š�E�@�t/kڈl@�3#�  @�xuJ�[@��ϊ��@�Ѻ�W�@������@�oȉ�C�@�~Q�Olc@��s���@�}��&@���l��g@����cR@�*��^��@�_���9@��Y�\ @��n��L*@�����-@�j jv�@���ÐYKA 9���A �?A`؉&�A`�� A����y�Au�~U[<A+߹�=IA����A���^UAAZM�JA��<A��# mA��f�vA	c���A
,��d�uA
��`��A������A�HǏ�IAp>�[�`AJ�=_A'�W�FA�AB<        ?hb�7�n�?�|vk-��?��m���,?�ix�FF?��D����?��ͤ��>?��Q��?��i� n?��3CSsX@��0��@3,��@�
�T@�+,#��@\���]@W�i$�@�Z6y��@�t�`q@ 3�bY]@"��ϗ@$ Hc�X�@&oاt@($�FMۀ@*W�)�z@,�i{�@/q�|�@0�nS/��@2xw�$Y@3]0E��@4���Ems@60n�N�@7�/�A�@9=@�yp@:ڪ�)��@<��1�R@>H:�m�@@�2�Ԓ@@�M1KT�@A�+���@B�`����@D�=H@E"7ɥ�@FB�$1�9@Gm�k��@H�Q�p�s@I߿+I}�@K(�Rgw@L|�6`�Q@M�C4��@OG�1�NL@P_�����@Q"��'9@Q���#�@R�S��n�@S��E���@Trٷ@�@UY:��P�@VG+����@W<ʏ̿u@X:6�w��@Y?��K�@ZM���|@[b�NOԆ@\��aQ�        ?_���[�?^N�ݍ�?��A)]�<?�d��cS?����D�?�ʠq|?ƍ�Q�G�?Ӹ�{_�?�L�8?�w��Ҏ?��-d�%@ ��~ڿ�@	�!_3@�Ez7�@齡�:@"��?_�W@)���]M@1e3��٭@7&��,@=�� j��@C:&�k�@HY$v(��@NuEC�z=@R�Sj��@@WCˌ��@[�����@`�ޗ��@dQ�"D@g��1 �t@kу~Qɒ@p:9<�%@r�[��@u����vr@x�+E�r@|Y��z!�@�I�{@�+��>Y"@�o�݆��@�����@��a�WQA@�bߏ���@�qč�L�@�[�̮�K@�\�޻Z@��%t䣧@��(��<@�U�I�N@�G�c��@���4f@�V���@�`��Y��@��s�{>|@�8�Q�9J@����ϫ@�_��a@���-�@����@���v��@����'��@�]N\���@�p�
H�@�����@��g&��        ?Qo���e?�َ!�8?��÷�T?��Q�Wb?�_�-��?����v?�g���ث?�ȫĵk�?��k��^�@X�.	��@	e�#x��@F1T��6@(���@��T�:@$F�1��@)���sj@0�u_�}@5*˰<*N@:����W�@@���t��@D�Zb�L�@IBh�6T@N�z���t@R���d�<@V_p�	(�@Z��y���@_�<�ʊ\@b�hN�Ә@e�C�`�@i�� ��T@m��]��@q*�W@s�)
՜I@ve�޳��@yyW�� �@|��9O^f@�C�#�e@�D���P�@�pT'<��@������@�O����@�E�v�@��F�=u@��z� �@��o�z�/@�uϷ$}@�X�R]m@�X43�"�@�wU�2,�@����ȝL@�nD@����k=@� :��k�@���:,��@���)	�@��u3�Q�@�,�w�@���f��@��<s�k@@��E���@���Y��Y@���5r�'@����܁        @`�X��T@8�j�ڨ@W�>�9K@l����{�@z��9��D@�Ƒ=
�@��L �@�>�q�xy@�r|~�l"@�֦Cgj�@�yM�(�@������@�*��ƋH@�I��71@��<�q�@�[5G��@�N�C��@��Z��+@�}-���@�n��ߨ@��L�Ϩ2@˩�}�ch@�\H��@н�#�$�@�O)/��@�����/~@ծt�{6z@�}[�v�@�b	-�7@�]jvŉ�@�p�t*��@ߝ�ZhZ@���P�@�#*H��l@�b��u�@䱛	n�6@�	w:�@�~����@����^��@�\L@�3��4@���5%Q@�)s-t�@���n��@���P�z@�Ȳ�'�@�رv
�^@��@��|�@��x>5@�OyN?�U@��Ң�@��7�"@�7�؂Y�@���(�@�R/�\@�����A �p����Ae�����A=FU��A�a��Aj�A�9A,A�FQ�M        ?b��
E�@?�� �z�?��><��?�3/{6�L?ك�jJZ?�9�YX�?���#�O?�d}@�?�� u�J�@ $f��8�@�9�~nj@����;@+�o{�@k��p@�˳�@������@m��K~h@o��f�@��`�C�@ ���5�@"��ʟm@$��Fk�@&����`@(�_\.�@*�g���@,�E��&@/AO�Xڟ@0�}V���@2��]�@3eK��E�@4��Զ�@6*F���@7��q�=�@9'9�?
F@:����T�@<^���A;@>ufPFz@?�����@@�>�F,�@A���I@B�$4�QE@C�8J-~@D�^|�[�@E��7۳�@G���@H+�����@I^4U��6@J�H��@K�b&��@M4;ՠ'N@N��M�@O�$b�@P�=c�b�@Qt I���@R8~�"Lk@S��p�t@S�aG���@T�%�E@U�b�'��@VkH�`�@WV�u�@XG��T��@Y@m}D��        ?A9ݱ�?x[�kh?�t����?�X�N-�?�'��+��?խA�U�?��:hj�?�:	]�N?��ڡf�R@ ���5@y��d�@����@���WW@ p����@&Z��$�@-�aL�k�@3�Qj/�@9a5S1�9@@*!��X@DM}2�"@I+ kw�@N�k�|�@R�g�?\�@V]?'��@Z�y��_�@_:\�#�4@b7�l��@eTσaV@h@�>��@k��=���@or���R@q��[`_�@s�V;~�@vBeki��@x��T�q@{e�����@~4�;C�i@��)���n@�&V�>@��oz��@��6��A@�S��r��@�7\i�@�/�q?�@�=��K��@�ay�$B`@�͏�Pۉ@��}���@�(����@�g[��@���U�N@��,j=@�j����@����f�@�U�;��@�ߠ���@�w%@��s@��4T�|@������@���[�@c@��� ���@��8�tװ@��
SD�q        ?3���U1?d)��dH}?���h[�_?�ص��s?�*4aP�?ċ�-��?�nKߧ,?�-ӆ�O�?��i���?�/��-�@���"�@����v�@Z�$^��@$��r!@-�٦��@4�bS�@<q�g,]@B���gW�@Hk��ǭ@OmĂJ@S�g�ԥ�@X�?�@^�m�<��@b�K��@f˖Y�G@kQt���@p9ÚԊ5@s�n`�@vZ�U)�@y�F��r2@}���@�(�)@�@���[T�M@�,);�
a@�1�[
�@��]��Y@�f�p�@�|N���@�g/��@�u?|��@���_��D@�qU���@��a%�@�5���<@�=9�E;@��ۮ��@�)n��]@��Ã�;@�����m�@������@��*8��@��q"A��@����@7@�)����@�f*�f@��X�К�@����e�@�z�'|@��"�@��'�1��@�%]m�'b@������@��(}Y˳        ?�?�5��3@5@��j@TF�8<�0@g��4��@v�Mb��@���W���@�Ǌ�mOn@��@_��@�4��i�D@�p��{��@�0��f�@����@�*k]���@��%��%n@���#T@�T��A6@�Bz�R�@���$|A@� }�rb�@�5�@��@���6��@������E@ŷ�2�?�@��� 5M�@���SN4�@�"h����@�|�M�0@�z14@e@���v��@���F]@Ԉ�h�@�s�1|@׎�cj�\@�+��(�@�ڔ��,,@ܜc��@�p�^`�@�,�w��@�,��j?@�5��h_X@�K]02EK@�l��i9\@�
��@��6�S�}@��Bq(,@�p���s@�Ӌ��D�@�E�D�@��}Ϩ]�@�U)��AU@�z9� %�@�Q�@�&�@�1�K=d�@� וw@�N@�\�@���c��@�	gHj�@�|�@�@�.����Y@�Q�c��@�D�`�v@���ѫ��@������        ?kKh�lk}?����L��?�k�/*ܬ?�^�A�+?�u��2��?�A��f�F@�7�j��@���ٸ�@��ɨJ@�W^T�@!>SN|�!@%�E[$Ȕ@+A��.kt@0������@4�+��@7��/�2@<;I��w@@vzW5�w@C�%`F�@E���*y@H�Z|;h@Ln�Ц�@O�����0@Q�n��?0@S�鍿ʕ@U���R�1@W��6���@ZI&�jiq@\��`�C7@_B��i�@`�2��@bO���e@c��w��a@e*�X5eg@f�p�kj�@h1Cӈ��@iŗS��7@kf<��h@mL�X��@n�����@pO��R
@q>�U�cT@r8�.I�@s=j4!�@tN�?���@ul���z�@v����.@@w�_���@y�9���@zt��Y��@{�]����@}P��@��@~ԗH�S�@�3b�T˛@���=�@���;_@���uѴ�@��s��@���+c0�@��i$�f=@�}���w@���Q&�@���?��        ?h�R 
�?�O�"#��?�0���(g?ز>ylǡ?葏�Ԕ�?���'>�@ �� ;!@�|_�s@�gd���@��LD��@!(�G��@'y�R���@/��ƿ6@5T*1���@<S��ιq@B����%@H:���e@O4K��@S���@YUOH@_b�MU�@cm��5�@g֎�˫$@l�1�GY@qy�H�r@t�fv���@x�p�U�W@}-�VVc@�@�k��@�ńl.�@��a^=L�@�Q��$�@��3�$�@��#m�B�@�ג���d@�d1��@�l¶�k�@�����@��7n�@�J1���@�X'�v@��q���n@�}[3A�@����(�@�M�����@��m1�@0@���qV@�i��C@�/�8�@��؏�4�@���vP@�ؾ!{}$@��x�ѕ�@���I��@���1DD�@�����F@���q.@��u!��@������h@��K��@����<��@���q�@�:\QQ�3        ?mX(�V�i?��l�$�?���m�,?�ɶ����?���<E�?�}|p�@qS� ��@��ʔb@��_��@#�xQ��@.�V5b�@7O�Jˎ�@AY�bAC�@I;3@,@Q���a�@X�b/pC@`�n2@�@fv���"@mE���W'@r�n ��@w�Ō@7@}�0g@��nO�5�@�H��4�"@�B��~R�@���հ��@�5���C@��h�/)@���7��@������@��U֡��@���zt�@���_��@�x6e<�@�Oj�L�@�3�'���@�#O��@���S�C@�,�.�@�)_;[�d@��p�<��@�����A@��fUّ@�̙
��J@��e���@���{���@�b�8��@�>�r1$~@�e�h�'�@���Ed:&@��w��?�@��N���@�/���@�pJ��@�[��;�@�S�l@��쁠�@�^��N�@���B�@����E�@čN���@�RisyG�@�s��T         @#�yF��@]��	��@�N�	�@�Ӥ�?]�@�կ�ׁ�@���s��@�tJ��T@��|>uˆ@�S(�M��@�&�"�|@�nOs-�@݉��=�(@�@Ff��@�,]�@�]�Ot�@�_�~�y@�T�V�x6@�57sa��@�R'/K�@���]�J@�BQ��0A��M�+�A��(�A��J���A[���A
j7JS�IA�.���1A�̈́�A+��GOA����+A�Z)wA�e|0��A@�����A�Z��X�A��f0Ag�q��A?��jA �c���A!�/��A"	�xMA#-�΍LA$K��1t�A%u���<�A&�a9�A'�ۍ�_�A)HZmvdA*�a��DA,#��'>2A-�� �.5A/C����SA0w�IcA1U���5A2;��D�A3+q��=VA4#Ö��&A5$�? ��A6.���A7Ar^��A8]j�v?A9��7�b)A:�R3cӥA;�: ��A=&�#��:        ?�=d�-�?����5�??�K4�҈?��B^�t�?���v]?��ű,&@��^��@�a�\�@{��u�@�1Q��@�����@ �PA��@ [�N�+@"�u8�e*@%��k=�@(M]�Aw�@+8�=jm�@.D��@0����@2Y�V�>@4
��K@�@5�5�O*�@7�o�J��@9hؖ⤤@;Kk�]�@=8�-� �@?2!p��@@�.�U�@A�����@B����S@C� ��@D٤[b�'@E��,EO<@G���ܪ@H@�kW%\@In*$��@J��}0;�@Kۖ�@M���v�@Ne仺�O@O��|�@P�3��w@Q8�H��@Q�=�3�,@R�I�D��@S`϶�h@T�k��X@T����N�@U�7�6#�@Vo���6�@W;��U��@X
�)�[@X�[qC�@Y��K`��@Z�����@[f����*@\Et(O�@]'-��@^u%@^�����@_�����@`f�F�A?@`ߑΓ�        ?U����?I�r
?q"�@)�A?��b��s?�ӧ��<�?�[/�Z�?� �)=?��a�_ZT?��N�?�.tM[x@,r7|5@
���<�@��ǋ1@�'8Vx@#j��|@*?W;Cm@1]1��]}@6��N���@<����+@B."��f,@F��`ޖ�@K�T��'�@P���G�_@T}��H�R@X���"�I@]Ҍzo�@a  ���@d�2�R�@g;�]8�@j�+&��@n�R���?@q��1��@s�;�C@vn(a[�]@y3w�]�@|0�B�1@g�|���@�m':�@@�D���;�@�:�d�@�P�{��#@���P��=@��B�f��@�T��$��@�v��C@��|d�E�@�C.s���@��<!�z�@�T�&�@����
�@���4N@�s��' �@�L�*@�7ד��@��x2]�p@��[�
@���I�@�����G@��m>�r@�z&w��@�R5��p[@��L�s>@����9&        ?+t�h?BŜ1~��?h���3?�\@',�?��B���?��6 
��?�ל��F?Մ�1�5?��a��?��p'ӄ?��7���@	��ZLW@8
=\d@!%wfN#@%���$_�@.ۧ@Yױ@57�I���@<�s)�@B�5Q0<�@HMl���f@N� ��@Sd����@W�w��m�@]U��{h@a�d��*�@e8�u��@i'��}M@m�*0��@q=)ǯe�@s��ՙV@v��5��@z7x�o	�@}�'E�@��5��@��bU��^@�*���<@��ı�w@�,qq�O%@�����@����p3@������o@�*��zY@�졣�E�@��&���@����0B�@��<�22@���n13�@�A��T�@���S�:�@�yH�"�@�bᔁ�E@��h�ח@�/^v0̻@�����p@�:�S��@��0�&�T@��J���@�H�����@�<F4��@��&�^�2@��;�oM1@����9t&@��ho��        @�bI��#@Od����Z@hV8#���@yQ��4��@���E��@�kK?�m@�#�9�A@��гQQA@��bn)ug@��z�|@�)�A�N@��T�� L@� �l��x@��zFv�>@������@��,Y��@�!$�6C@�(VM�p@�l��b7N@��S=g�	@�Q'Io�_@��@Š�@�Z68zG@��|ax"@�MYմ�C@�����J�@փf���o@�7����P@��>w��S@���+�pi@ݼ8DS��@߶dw�tI@��y���@��=�^*'@�
���t|@�.��0nt@�^k\`@��o��R@��_��j@�<F4�->@�S��z�@��-}@@��V��g@�A���
b@�t�����@�PN�0
@�2�l @�h��)�@������@�c���@��
&l@�('~��@�d�D�i@�'jWOM@�Ao'S@�aՍ�O@��6C��@���aܜ@����A ��� 7A �~����AL��A�xRp�        ?0;]u]?f��gq\�?���_�_�?�z����Z?�"n'�`?����a��?�u���?ʲw�\�?�X�{��V?�O$��o�?�K�^4d�?�����?�K>��?�8қgH?��޲?��t`*�?��Dʩx�?��Y��@ ����2@Tփ!K�@*:2%y@	H,��]�@��EN�y@8�TV�?@B��Yٜ@z�� +9@�l }�@~~����@N��@S��&J�@!H�=Amb@#�qT��@$ܣ�@�@&�Pc�^@(�˘?�@+�w�v�@-sz��N@/�m��)�@1A�^2�x@2���"�V@4��J��@5�D�۩�@7&�x��@8�B0;��@:�$��ˁ@<T�� 5A@>3�p�@@�����@At.�FZ@Bb#�� @C3?hT�@DO�H(V@EuTU;��@F�`T�2@G���@Il�G�@Ja�j�J@K��+g��@M��x6�@NpIۙ@O�,��B!@P�ӷ=pL@Qi�Z�@        ?��$�x?IQ>?oy�D�^�?����9z5?�7����:?�g��~p]?��Uw�?ѐ�8M��?�?ܵ\:f?욾�:?�	7>���@[D��@�5��ɦ@q�h6�D@ G�p�5@&���m@/���<@5A�h�A@<2g,�^@B'��&@G#�6ΐ�@Mʲ&�G@R���w@VV����@Z�M�)�@`�u�@c&����@f��l!�@jlg���@n�Df�@qŞHD|@tm�;�Q@wZe��ѝ@z��x�O@~��V��@��(i6@��ȡ�K@�Ai7?O@��jn��@�CL�f�P@�
>�_�]@� ���O-@����V�w@�A���6�@��V�7@���(�c@���Í�@��(���{@�%rd��@�n����=@������@�*K��r�@�x�x���@���WK�@�?�'��@���a��@�@����@�����4s@�~;F�b�@�4|��@���o�Tl@�����j@��_���        ?�G���?R�E����?w�g�O��?���b�ab?��ݵz��?����f�?ɥ�ZG�?�Ȃ͉?������8?�h=D�n?�����n@����%@[���~c@�e,��O@"�(kbӣ@*22xV��@2�QBH�@8\ݖ�d3@@!f.��@D����`z@J���x�9@P�h�$)�@U!�W�{@Yϱ��i@_N��� @b�6/��@fP iͨ@jD�w]�@n��?ODV@q��IX	c@tkx�Ar�@wTk�R�@z~���U�@}�Eqp��@���o�{@�ͯhI�q@����[�@�:;N��A@��A�2E@�D�>��;@�/>�I@���G�(@���y�@�*�h���@������p@��&����@��d�Qb@��*As1@����d@���<^��@� tdث@�U<d��@��PZn��@��L�*@�If�M�@���/�3@�5ѦZ�@��q��@�`,o���@�s���P@��M	���@���;�@��,��        ?�
�[��@�� �x@#�q7��+@:�%s&�7@K7bh�m@W�����@bPyaH�@j^�~�@q��M��@w�OP�e�@~��{�@��Jq*��@��ٖ;Z*@�y"h)�S@�T;P~��@�8�>�_@�pÅ�v@�ր���@������N@�0�c-�i@���ɢ|j@�I�u@�7�A�n�@�mε#W�@����"@���mt�@��eEn��@�4]����@��؆�O"@�A�ƃ��@�j)֧�@��6S�3%@�'g�!�@��HG��Z@ŰW�&)5@Ǟ�%�@ɨ.lɪ@������v@�q�M@�;Ti"�@�|��}�@����3D#@�.B��Ma@ՠ77�nE@�#0v��@طz�Oۆ@�]]��m�@���\@���@���@ߺ�[tY@�ԜB��k@����ˊ@���{׽�@��c*�]�@�{w^�t@�6r����@�g|�V�@��SDRa@��	�@�9K��@��F|�@����@�nC��hc        ?|���/�?�fc���B?ǅs^��?ڮ�^E?�0pc��?��H���?���A,B@:F Qmq@xX��-�@8�AN�@��0��@��-C@�]��@i��| @ 3m���$@"L]!��a@$T�-�A@&�%��T`@)2��m)@+�}�ٞ@.N���5@0�$���@1�=�b@3`�"�x@4�<����@6u�F%b�@8_~[_�@9Ëv-�@;���E_@=NJ���p@?,��x�@@�?8K~8@A�z�~� @B�R�ǔi@C����@D�M���@E�|'Qx�@G+��Cb�@Hj^Z��@I��y��@K�\��@Lh�aY�@M�S���{@OIKM,f�@PeA�V�@Q+�V]�.@Q���8^r@R��$k@�@S�	�k;�@T���<fV@Ue���(@VQ�����@WD�G���@X?�⚯@Y@��@ZG�^�*@[V���@\jO��]@]�����@^�ģ�@_��tZ�]@`w��Hm@a�9ܽ        ?Q	]e��.?�#��,C�?�(i�֜C?��Ċ�a�?�/7j?��@O�Z\?�e���?������?���@p�@j�
���@������@d��Yr@"i(	��[@*Q��d@2U5�Y�@8�E��l@@����Z@E�
���o@K�� ZN@QC�����@UR��5�@Y�.@_8��]@b�$q)�2@e�0�7<�@it]E�*�@mn�ʪ@p�
�oέ@sA��Q�_@u�%��@x�S��^�@{�/���@~��[��U@���yղ@�����@��*k�7@��
�6�@�42��S�@���0-x@�	ۅx�@�Uaf��@��mä�@�,�%.\@���\꾔@�Pq�
�@���aq8@�é�/ZG@���v�h@��(��{�@���!5(�@��o�R@��5��>@��1��@�9�F���@�s?���@���H�_`@�
�y^@�h�W�Y�@��V���@�LV×��@��$p���@�eҍy�w@���If        ?o���,�?�X�Ø�?��~�#Xk?�S�t{?�nc<4?�C��6�?���?to?�X�B/��@BЦ���@([�LƗ@(�ȧ�@�YC��8@ �O�zV@&
v�=��@,fP���o@2�릳�@6�[�S��@<��m�Q@A��S&��@E����w@JCM�#�@O�gT�5@R�|&��@Vc۟�T
@ZYj끋�@^̐r��@a��Ź�@d���"�6@g��9��i@k�@�Hv@n�X��@qh�o�v�@s�F�tez@u��_�C@x���@{]{�!�@~\%��O_@��O��3#@��~���@�W�w��-@�L��'��@�b���iY@��p�*fz@���;�Q�@�pL��@�	n�?�\@�n��l@�椑��-@�s�x^@\@��8��~@�Ϡ��8x@��8fkm�@����i@���\ �4@�M��y�@�e�܍&@���vKC|@���x�F@��V�v`@�F__]@��+���@�p�~@�z�V�S        @!)L?�#�@P���5��@ln ��@��p��	@��d�Q�(@�?:���T@��$LX�@�;���@�>����J@�쯼zP�@����8�@�a�n^;l@������@�}�����@��Q����@�d�$�D)@�sؾ�a@���p ��@���@�x@Й[A:� @�L��O5@�8X[;F@���>Ҿ/@��@�&�@�/�p��@�:����@ށ|�e�@�p��yS@�4���@��Mι��@�L{ƼD�@寷�r+@� ����@����@�(�ٔ��@��GHP�@�gJ��{�@��}�.@�nBiJ�@�V��M@�D�:��@�;i�ƪ@�8zKk6�@�=���B�@�Jo�{mP@�_��nD�@�}�H��@����\7�@���s��@�t Z�@�W�"��@���I� A ��r�A �
'�l�Ap���A0<Y�h
A��]v�A��H���A���Q�gAasK�2�A9�/�WYA����A����        ?bmN����?���|�?�σi)6�?��M�6P?�H�-�%?���@�?�2����?�>:�2�?�6�Ά��?�p>4?�u,�7�?�N� A6�@ �e�F�@�װ���@���N@
0�?�@���@��#��B@�ʟP�T@�S�k�@#(0���@���6^�@$��1@�@xΪ!@ �b�p^\@"i�A�r@$���#�@%�p�Y�@'�/B�C@)s<�N'�@+{NJ���@-���V@/���@1@�^��	@2��u\|e@3�'<�L@5|��䌕@7�)��@8�<H<@:y�q�s@<R�v��@>D�	t��@@)���(@A=�(�-�@BaE�i@C���p�@D�F��J�@F-4D�&�@G�����@I"�nu�@J�8嵙0@L8�����@M��"��@O�'D�#=@P�z�4_�@Q�ԛz�Y@R���J�@S���K�@T�Eӹ@B@V7Cc��@W?��~�@X|ݛ]G @Y���        ?�)��OQ?J���~R?p�A���?���?�?�^��f?���m��?��q�nf�?ԣ�(�)�?��͟ �?��R�b?�_�;�@��M�U"@_t��*@��� v�@!�X@f@'�E����@/�P���@4���~��@;;پ΄�@AcX��m�@E�k�4b�@K,��͋@P��q�@T?�� D@XZUY�L�@]L�-�@a+���0@d(([ �@g���@k?�|��@ogۼL'}@r �vD2�@t�ʎ��%@wU,�h��@zd
�*X@}��;��@���C@���	�>�@��r�d�@�#.DBz@��z|��@�Y���ƽ@�B�3N@�1�	}U6@��?(�M`@��M"&��@��r���N@��4�^6�@��𫒸@�+��)�@���Z�hk@�%�_�ʅ@��[���w@�� �đ@��1���*@�E���	@��)�@���<t@����@���Yw!@���/oy7@����v@�ߥ���B        ?[����?��X�z?�f%
a�?�|�O��?ȧt��H?հd���?��=ۆ?�0v�F�?���.p�@	�&�@�f�t�@��8@�@'��}��@1G��,ff@9?J\���@B ���PG@Ibq^�@Q&���|l@V�����@^P_n(d@c�޻�@i �e�@o��wP�
@s�	B�4@x0w��n@}]؏��u@��͡,�@������r@����N\@�����T@��B���@���a[�k@���V'/P@�J�!Q5@�4�x�z{@�H<��@��Q%l��@�q���I@�5KUB��@�R	�@��� P�@��&+��@��BЀ��@��90˟@�*I�ov�@�O�QM�@�����@��8I�s@��b�ռ@�V�)u@��hP���@�#�]��O@���7��Q@�'���*@��$�F}0@�d��D@���q�KN@�n�6�cN@�X�e��@�JJ'��@�D3�\�@�FyT@�@�QM.���        @�+��d@6t֌�+d@Ry4�˯@d���@"@q��h'�_@{.�FHsb@�i��)I�@�:�	���@��AN]�@�o�K2v@�\N@���@���Jnh@��r�|��@�%߁9�@���>k��@��G%���@��!�(��@��j]��@��Fz �z@��o�k�@������A@���T@����ku�@�W��ܲh@�4#��0�@�1����@�PO��@ʓ D�@�����s`@ϐkq���@�)�/}D@Ҧ T�D@�A^$C@��K$r@�����@��9<�!�@��d���@����=�@�=���t�@�}$L�fu@���u��@�3j\�*�@�~�X�k@�7�����@���\XȂ@�oo�=!@�\A�]�@�?��q�)@����'@�%��aK@�:**�t@�Y�K��]@�宧�@���12��@�� h,@�F: g%�@���р��@��)���0@�d���@��>�C��@�U����?A n����A78��yC        ?v�ߵN��?�K�Ao�?��_"�(v?�^'���?���F?�Q�F|Q?�x#���O@ �{�w@_�,�9�@���0�@��2�@W��r@�8kg@�CI��@"�K�1@%�^��@)\�62'@,�$ᯓ�@0T>�΍�@2s�R�@4�e�
/@7(�k'�@9��gM�@<�߲?�@?nד�Qf@AC�%+��@B����U@D������@Fr\���@H[�P�i�@J^E�g~�@LzYo���@N���[,�@P��c�@Q��a`��@R���`0@TO#�
@U��y�	�@W!?Ў��@X�[/e�@Z1�91�@[��;�=L@]����B�@_QT�E
@`���N@a��P�SZ@b�kr�	�@c�U��@d��Ԋ�@e�>4�c�@g��͊=@h;�#���@i~��W�@j���g�@l&�י�@m�D����@o (L�)�@p?�NA�@q��M�$@q�G �CD@r�-U�28@s���+��@ti�W�ف        ?5�'~���?mj�}�}�?��mvm>�?�2����?����R��?�FW*[w?�I}m��?� ���?򑸺J`
?�B����t@�:
zq�@rLW�C@�D�f{@$<	��<�@,�Y!&�@4.���@;��;��0@B�eH��@Hk�N�$g@O�K-y@T+��x��@YT�"�/@_^�)*C@c*�-�i@g"�+}�@k���U��@pM��Xz�@s�ޡ�C@vź��@yj���@} �|>dJ@�or��+@��͂߯�@����۷@��͓^@��T|J�@�>l+&8�@�	Z��w�@���-��.@���Hd�@�"��OC/@��W��@����(��@�cª�81@�G���@�=��H�@�D&�۴�@��q\Z�@�ë��Q�@��ԥ�~G@�	���@�9j�Y�@�s-��gp@����y)�@��m�s@�[&n�j=@���lk@�)�w�@����S@�����@��u9��@���D�@�}''��        ?2��s��E?k/��a?������?��<��?��\�s�M?Ȯl�?�?��ҭK?�#���?�'�t�?�QF�3�@�򍖵�@�m�@�`\��@#�Ck&��@,"�� [@3���{g@; ��K��@B!%����@G��X��@N�5�"+�@S���[�@X����]@^�\s�o�@b�bKY@f�`�ԫ@k	ƀ��-@o��ޝC�@r���N�@u����@y�Z��@|�ٴt��@�C2J0i@�V�A6	W@���$n1u@����$u@�cml�{@� 6�F%!@��?���e@����(|@�JY�V�y@���䑤�@�q�� l@�	�4[@��|�($@��	��=@�k����T@�M���1`@���~@�����@�%�%B{^@�47=�@�J����@�i��@������@��L*u9B@��}c,;@�5I���@�}�ށ��@��fΚK@�*9g@���7_@�}��t��@�9J��'�        @�$��9�@;>��_�@XU�Y�ړ@lZ�1���@zT�c&"�@�]$�a݁@���^Z*f@�3˲��9@����{@�4�(�a�@�15�A�@�֠��[j@�]qy�@���bD@����m�@�֓Pay@�Ir%� @��5QG�@Ƹ(y�@��Uc:�$@�-�׹CN@�i�߬]V@�b0�ߙ�@ԁ���X@��+���@�:J!��@��"~���@ޝ���@�ɏ�~��@�[�θ@��.�V}@��c�4N�@�-���@�Qz㗘@���@���@`�@�va�?#@�V]QB@����G@���q�@@�h�R���@��o���@���r��K@�/Y�	��@��SIr�E@�����@���I�-A ���ԞA�BM��A�[`@AI����A�J�h��A�Ph1�A"t��`|A	�"�|�.A
�ɚ��jA}�%���A��vA�ٷ�s�A��OZ�9A�Jl;�TA�}���=Au��t�S        ?]�����?�Q���	?�t&���?��"�{�?�)R����?�~�b:?���?��Гj?�:H�A�]@0�2z��@����8@�k����@���z�@��xU@&��ޅ?@�V�y�@"or���@%���	@'�9��@*�+\��@.�m��@0�}_�/@2ex�k@443�<ڗ@6�3L'@8�����@:]-�Si@<7P��{@>jJ�/f�@@Xj׋}@A�h�CM@B���j�@C���t�@E?/��]�@F��J���@G�ٯ���@IBh�^٫@J��/,��@L�#�L@M�s����@Os��)@PS,
@T@Q oD��O@Q��'�o@R�3Ƞ��@S��NBq�@T��w_�@U�Њ���@V��	OX@W�bz���@X���Ԉ@Y�g��@Z��)&K�@[��8D?y@]	zIo@^=���n@_z|���@`_yj]�@a!��5@a��.x�@b`|�8@cN\�6�@c̜��u<        ? �Hr�??�o/�?dyl��?�'���F?�`,����?��@-�]?��Y��A�?�/�q�h?�uG2�:?�,��R�`?�
�ϙ[�@���Z;@Lc#8/�@L���!"@@�/�*@$�k= V@,$��@2�;�݊@8�\�T�@?��dM@D�o�m}@I%��jv@O��3�@R��/|�@V��l���@[8�jg�@` �}@b݄��<"@e�CϹݗ@iSb��Q�@m	�:'�%@p�o�x3�@r��J�ɢ@u ���@w�9�D�@zsɂv`@}i\�C��@�I�W�/�@��:_��@���Q���@���:z0D@����h@����O�n@�'�{0��@����m@��k5s @��S�g(@�T]y��U@��ZAt�@�i!`�͈@���z�@�Ԛ���@��'�m�@��4+��@�����}�@���.@�IKC@�5���=�@�s�#�a@�����J@���sq@���i1@�	V�V��        ?(�a5�Z�?]$=r�F"?|�D<	�?��O��J�?��*`x�?�Kw�A�?�ƴ�U*�?�Gu?�<?��`<�?���jK�u?�9���@�=T�g@�8��B@��>a4@vcҲ�@%��c��@-��}`�@3���|�@9k��(6�@@:h�Q��@Dc� ���@I?s��@N٥�\+�@R���"@V;��ݖ�@ZH#�J3e@^���07�@a��~f`Z@d��rP�@g���.K�@j�}�g@nxl?�2�@q*5�]��@s?�\q�@u�L�@w�d��@z���_�@}F8�;�;@�1�,�@��mE:\�@�`�� s	@�*6G��d@��>b�@�l�^�@�3K'똦@�sr�X�E@�� �>R�@�+8Z-�@�}l4םl@��琪@�X�(�P@��\»Nh@����@�1��H17@��K�;�@��d�Z@�ƒ���@��f;�<@���w���@�����l@�<g���G@�qrk�J@��g��W�        ?��5���@0�cî@OC�ja��@b>��w@pb��9P@y����@����8nJ@�p1�@�<�8�>�@�i��G��@��MGz@�;y���@��<Y��A@�6ѝ�@�m;��@���g�@��c[C��@��q&/T@�_�{i��@��54gp@�kԬ�O�@�:�bFח@�:҂D�@@�5K��c@��M�wo?@ĩ���@Ɔ[:@�x��t`@ʁ��9��@̡O֐�@��!��ET@ВX��j@��]^���@�Ֆ�>@�N2���7@էhmmka@���5D@؈#p�A@�Е�@ۮ�"��9@�^�g�ب@�#-2A�@�~'� S@�u��e�A@�x��@�S����@䠼����@�Ƕ�Q�@����F&X@�<�$�@�"��*e@��U8cI@�Q���l�@��3�(�@�QYv��@�s�i�@�E�L�K@�)��8Q@���#|B|@��3�_YE@����W/@���D�l@�͊�E��        ?�
 �U3?�b3W��U?�K=ޯ4?�@��?�����7?�(��	��@8�8)@N�� P@&n,O_@��l�@io<\l�@ RiF^(U@# ��G@&�0xi@)Ijɞ�@,��UQ@0D\��@1�Q;t�@3��
͢	@5�\+Ƹ@7��\e�=@:"�/K��@<cɐΏ�@>�C�v@@�	���@A͂Q5��@Cl���@Dd�ia"@E��\���@G @=\ad@H�{��8o@I���O@K}�18�@M���I�@N���3x�@P����7@P�7���@Q�h�/��@R�\�1[@Sy%��[�@T]�C�B�@UG��@��@V6�F�h@W+��9@@X$����@Y#�4V@Z(�٬�K@[3D1G��@\C�~�]^@]Y���8�@^v%���U@_����n@``��ؕM@`�t-^@a������@b2+5z��@b�I��L�@cy�23�K@d#"��`Z@d���g�@e�T&�5@f3��@�@f�@}F��        ?"�-&S�P?a�d0�?�T�7g ?�5��?�,L���7?��":ˋ�?ǟ.�9&?�%��N�B?�Լ�a�?�*pHOϛ?����&X9@ �v&�I�@		���1@`H �@P��tT�@"hk��qh@)2HNFu@0�s�/�=@6A|=|@<��5�@B^_LY)�@Gl5��@L�� &E@Q��E�s�@UI�7���@Y�/�AY@^b(>iA@a词7�@d�n&v@hO�
B�@lٯM�@pV��k@rG[A�zt@t�9�aU@wR��-P�@z'g�F�@}3-S��P@�;�j�f�@�����w@��i�/�@�֗hE�<@������@�2��P�@�� ��tb@���C�a@��*c�}@@�H�tœ�@���X��@�S*&��@���q*@��b���3@����A@�ed�O��@�bc��Lt@�;�b#{@�RGc0�x@�u�<�g @����sް@���09@�-�&3@��l�-z@��8�`q�@�b{��S        ?V՘\��?�� X��?�(��T?���B>@�?�Պ�|W?�R��jD�?�_�G?���	�R@ �-��N@	�AД*�@x���M@���:@$�R��@-�#H�D@4�o��@<6kw�@B�Wga�@H�>��m@O�_2�@TG�t$��@Y�oI��@_�Tgl�<@ct�ɑ�@g���@lln��ks@p�#�%@s����@wh���1@{2��?�@_}L�� @����QD�@�u9��@�&���E�@��P��@�+s�%��@�@+6�@��ݪ��@�����@��$���@��z�s@�<@��X%@���kXM�@��[O�X@��c��v�@�C9�3�@��iᣉ�@���)-��@�v%1��i@���n@����w�{@�J�:I�@��_8�@��m4�O�@�N6J@�>���3�@�6�%�F@�5�.#v@�<3��'@�Jk���@�_����@�}����@��U?�@�@���J���        @'�^z%�@T��ꄷi@p�@���@�	�Ҏ�Z@���Ô8�@��`nd@��<H��@��KzV��@��g_�@�}��c�@�����(�@��s 6�@�R�Z33@���}�@�!�Q��@�z�=0@��әa�@��@�f�Y@��'�e�@�#l��@�m���k�@��Rc��@�f��Q\�@�^!c@��&�vu@�p��M�[@�����M+@���@�Rt��t�@�1�9�@����@�├�S]@��y_�\@���Y�g@�=t��@�����@�����4@�(^���H@�q���@�ȭzw�@�-���^@��Mɘe@�$Y,�C@����ǆ!@�Y<I:�A �N�O�Ah���AS��,�AH����AF��<�AO~/�)�Ab�bP��A�	z�;rA�%g�A	����AA$��6Au���pA�֞�SuAB����A_�E3�RA&�L7�A������A�x�VM        ?}˃�<�?��#���J?���05?ۧ�}�R?�W���.�?�ǒ��g?���C5�^@�FZ�!U@����@�#�ȋ�@�57�~p@5�<�y@��q@�@V۩1�@ �6�˨@#w/&�n@&'L z�@) *��@,$=�7�@/s��{@1}gj�i�@3\�@�1@5X2Oo[!@7p�\t@9���@;���X@>i8�(��@@}v�`�@A�!$Ѥ�@CBb��4@D��6��C@FP���v{@G��<#��@I����5v@Ky���@MZ%�f�[@OO�^ٙ]@P�a��@Q�L�q t@R�΄��y@S��Gy�@U-�\ �@Vh^1��@W�/	��@Y�u+�@Za;�-�j@[�\��@]F��9�@^ͭ��p@`1,]f�@ah��g%@aډ��M@b��^��-@c�B�&��@d���`�b@e~�8ؿ�@fx�B�9@gy���݄@h����t@i��4.A�@j�v�A"p@kź%�a�@l��/͸        ?Ou���=?�W��\?�ezR��\?����v1?�L�(��E?���(�?᭎��Y?�l.�с?���]>�R@�)JF@V��Є@m%A��@ ;���@&�M��Wa@/|�NP�G@53�v�^@< ��-@B+/�\��@G6�P�@M<�yy@R.n�Ä�@VZ��*��@[2����@`cooL@c���&z@g1�B�P@kF�@o׋��w3@rv��ⷙ@uGST���@x`�S�>@{�v��@y���g@���!��@���R�@�C��[�@��T��d�@�xEM�<@�W��>��@��XEu@�R�]���@�
陮�g@��wyEA�@��͗8�(@��l޵#d@���8��@�)z���;@�@k����@�z*�F�@��-錌�@��b���@�}��6oL@����\8@�t|7\@�k�I��@����F2@�X�+@��ۢ@�s�G5�@�c4�;>d@�Z��`�@�Y�奚H@�`Ħǉ1        ?e����/?���K5>�?�к����?��	�0�?��{��?�g�u�?��:dv@!D��x@	D��w@A�r
@�\��@"$`�9)�@)3� �@0����m@6š�	��@>��R�@C��^�g�@I�	.��@O��H��R@S�ҝ��@Xm�~��@]�c���@a�.�"�@eT�~E�@i(�Zc�x@mf�;�#@q,���!@s��V-Q4@vV\r��@yP%v�A@|���Th�@�cG��@���~i
�@��y���L@��h��Í@��z�a@�@�E�ߖ6�@��v/#>�@�ES+y��@����0�@�h�%/@���S&@�z�Ѱ��@�"$3PGt@��u�@�@��fnGz@����t@���*N[@�]�P@�xӃ.��@���jz�@��
�%@�
�a��@�mb�v,�@��[<�ax@�>;46�@��H�:��@�K���~]@��aW_@��]��{S@�����@��Po��3@�����Ѭ        @!qz��@RK]��"�@o~8��~�@���O�2�@���A���@��o! �,@����6<@�������@�h����!@�xhIa�@����u��@�n�:�@�Y)�ˎ�@�Cq�TK�@�z�dR@����r@����j�@��o;@�\)׈"�@�۠�:K�@؏���@�{���@ޢd��bv@�u�s!@�ֺ�X�@��Z��E`@���f�V@�0��@�|5+�F@�Eg#e@����"_@�DJ���@�<is�@�{3u��3@�^�J�|�@�d�R��%@���X��s@����K�A )�)�C�Ax���̤A�ڑ|<�AVB�G�A��B�A��1�H�A	Jݯ�>�A!Q��q^AF��kA�jIWuA�����A���gzA�|���A�b�IAVV�ϿA�#p��A��w�'A\�ĉ�A�3D$�AD�ψ��A�*0�1�AZ�9?�A {��rVvA!P�,$7A"*r���        ?v?�H��?�<��R�?�6�E.?ԖV��%?�8=T�]�?�L��i�-?�9h����?�M-����@�DL�CV@-�C�n@&UJI+@J��+�v@=�Y�6�@ly��02@�)dw��@~�!3�v@ ��打�@"Ò����@$��y�$@'E�
v/�@)���S�@,L���@/��y�@0�'���@2qu}	�@4���y[@5��g䐝@7b����f@9+oO5�@;i1:b�@<�-��J@>���d&@@u�uP�+@A����k@B� ��@C�	 km@DΕ[J/@E����7�@G(G_5@H`�f�@I��Ӕ�z@J����(7@L/O{<��@M�gL�}`@N��d@PY�:��@Pɺǹ`d@Q|��-�@R1�S!R@R�'���@S����J@T^𳨛�@U%��n�@U�t���@V���r�@Wc��_@X)�k*��@X����@Y� ɯ}�@Z�6�چ�@[R� �D�@\!�C&ng@\���Ff        ?cFu'�oI?��.6n�?�Oj͓Ij?�]�I�ۆ?�����n�?��K�S��?�e�A�"�?�#�%SQ�?�6�>��@���*a�@(B�<�J@{9�a�@����C@ Î�E�D@%�D .�~@+�d����@1n܍��@5��ѐ�@;x�
)@@�Ĝ���@DF�S� @H��<�h�@Mu5ߥ�@Q����Fi@TҞ1�@X���VD@\����@`�ؑ#e@ck<�p!O@fj;��\�@i��*#@mz�xѽL@p�'����@s��}��@u� �+��@xQ���@{O��n�@~��j�@��_Q@@��%	���@��R��f�@�0�pთ@��r8]��@�s�M'�@���`�v @�Ƥ�T�,@�Ge�U4@��t�
��@��i'd=p@�NO��{@�)�1�BF@������@�'�_Cx@�K����@�����a@��}���@�&�"F�%@�k�P��s@��0���=@��{�h@��]5��E@����P(@��>���"        ?C��&�??ry���?�B���]d?��˴�7�?�6Ή�%�?ĩm%H�?ԅ�G�f?�
Wu]�?��]���?�#z7>ҩ@	���b\g@Ki6\
�@��[�@&kA�	��@/��J��@5ʸ�nɞ@=>���F@C4Ωh/�@H�خE9@OY�)c@S��Al�W@Xg{�N@]:H.���@a�"�f�@d��_���@h��9M��@l�K 샠@p�(�Ӎ@s?��?� @v�;Y@@y����'@|w�=�@�O��@����@�*����@�xǬ��@��DMn�@��6d8!g@�uk}-��@��VB��@�_ڦ
M�@��� ]@����A�@��q��*@��W�4\e@��2�n�@�j�-S��@�kP�hc@����_�@�Gt���@�n��W�`@����@�qD��O&@�r^��0@�� (4@�}Ls@�Q���N�@��.���@����9 @�"�����@�4��I@�QV?�q,@�x`o�P]        @����@B��&u@`�vi�c@q�o����@@��^�@�,�s6�@�5wPi$�@�$:0��2@�ڎ�%�1@������@���[U@�3�f[@���m�"@�����4@�O���6�@�9-�@�N�V5�N@��ٝ�z�@� ���3:@���x�@ĺg�:@ƾ�s�3@��p���@� �%6�@̀��c$\@�܌ޑ@�R���
�@ҵI�evu@�):d6�@ծ���>@�E�r��@����^�@ڪ�M���@�y1�z@�[<�Em$@�(�BU�@�-��/W�@�<�k<W@�VZ-jz@�z9K�mm@�\�L@���{8@�"ࢴ�@�n�t���@�ĕW�eB@�#�+0��@��1o @��p+/�g@�;��|jW@��O�WL@��Ck6��@�G�P��@�W�ȋ��@�'�BE5@�����JZ@��= -�@��{����@���׬_�@�e�F�VS@�G��i{@�,��M@��J�#�@���M;=        ?i"�� �??�-�U�4?����,3?�5V���"?�^Ga�c8?���V��?�ǝbpi?�hT�@ r�c|@@�3ܽ@
I|⁼=@�H覵@*���C@�m�#�@E�yꊨ@;���Х@!<GL~��@#~tP�@%���A@(pB���@+!��K�@-���[ @0z�{+�H@2}�E�@3�Z�C>�@5p5X�kf@7B'4���@9+���S�@;-���62@=K?�I5?@?��� {@@��$@B-�c�	�@C}�O���@D�9��c@FU1��T[@G�	Y�-j@Iw�2�,�@K%��'@L��n?@N��#��w@PP��+@QM�CҬ@RS-c�Tx@Sa����@Tx��x�i@U�:�@V��Z��f@W�$]z�@Y'�!�@Zg�i|t�@[�� �@] O%ɭ@^Xt�?R�@_�kۙz�@`�v��@aG��vv@b�f��@b��E�!0@c�q��	@dJ�����@e����@e����B        ?o@��?������?�w(�!?�3œ�p@ !m�!U@��`y<�@?1b��~@���]D@$G��]
@*a_���@0�Uh`�@5��.@:c��2�@@�����@C���%�@G�C˱@L�Y5[B�@Qt�>�P@T�6�`c@X结�q'@]u}O�Q�@aM�_�V|@d/���Q@gb��v@j�4�;�I@n�Rr��@qzgh�!�@s�Z>�@v.�T��a@x˷���X@{��^���@~�Z)/��@���]��S@��r ��@�Q_��I�@�2�� �@�/W��&@�Hw�Nba@�1�41@�Ը�Û�@��!��
@���y�N�@�M��*@��[�-�*@�;���b@���Y�@�u:b��
@�.��$ҩ@��h1�Ԫ@��#!�@�j�ծ}@�o~? S3@�Z���@���]��@���4D��@�[��@�)H���@�o��y@���>�@���ũ6@��W��@����_@�{��Vh        ?'N�%@��?^�e�T8i?�_���?��Ov�%=?�LK�{2�?����{?�/)F,�:?����C?�/n��_?�I-~��@۔��[@i����U@�E}b�@#���Ui@,0�cүk@3�K�l�d@:n|�+U@Ai�I؂b@Fn~E~@LP@�``@Q�F�D��@Uk��3w�@Y�cj�s<@^�[ķ�~@b��e��@eP�'��@hcF���@l���o�@p�t	!@rI���@t����T�@wq����@zf��v@}�ew:q@���b1@�{��{A�@��P@��΢"$�@�)�/^@��@ s�@�t�1��@����< *@�9�����@��fU�-@���!?��@�h�8ŋ�@�S�R�Cr@�Wf_�R@�t�>�F@���n�w@��מv�@�5Rp%��@�y� v��@��e��B_@�-�v�8@������@�ˏ���@��S��g�@�M��@��G��@��ra��r@��r\x*�@��}��SU        @b�DX_@I�տ�	�@lH̘� @��R:Ǥ@���ԛ�@���Ih�@�dT�@�9��W��@���(�@��n���@>�G�@ƍ��O��@����>r@Ͻ1�P%@�nn���@�)���@�G����@�7�AM@�NT���@�ѡ`��@�r���@�V�8�� @�/�7�&@�n�!�@�Z|o��@�(Ǉ��@�&���[@�&]o��@�B��f��@�h�p�@�ʇr�@��L����@�syGK@�t^�x*�@�֛�;)�@�E���@���kA��@�J�J�g@��VԶ
A @��0��A��d��A�%�!A�Y��A�&���_A��g�A��@5I�A�u�b��A�"�>��A��_gSA	�Qŏ�A
�+l�IA�����9A�7v��A �g$�AD5�>]A8�9Q	A�f˄�"An��V�A�rG��A��S7�ATv����A��b�-A��<��        ?Cl���?�n�����?���Ծ�?��[_�}�?�%W�9�?��&��m�?�N����?��.��?�R���]?��c�v?�����҆@XC�@D"�D@	�I�^�@x��Г
@���6�Q@�-Dlؾ@�"7��*@^��0@�Cb]=@!�g�Y�@#����R�@%�q��s�@(o�5u�@+��0�%@-��U>�>@0e���>�@1�L��cT@3������@5]H�'��@75b�4
@9';��m�@;3�6d�@=\�3?�@?�.9j@A�cf"�@BC��9@C�h��]K@D��R��M@Fe�秫@G�_��@Iy
v��@K�n�@Lςeu@N�asŹ@P5J��g@Q))�0
g@R%�ڰ]@S+����@T:��`�"@URê�;�@Vt�J�9@W�H6��/@X�.�@Z�T��m@[a��+�@\��K��@^3�j@_�*U5
�@`}	�l@aA�Ⱥ>�@b
����1@b�W��"�        ?3���o`<?u������?����Fi�?���'�?�K7ki?�� "C�/?�����?�\�N~�>?���a�u�@N����l@3�gk�~@�$>Y�N@$S�V�E@-&7��z�@4_m�ۣ@;Χy_��@B����@HHf1��.@O,s�/�@S������@Xk��eu�@]� �/�&@b	�&T�g@e�°�@i[2]��@m�$��t@q�/��@s�Q�5�@vM�+��@y2�~%~�@|K��'��@�{��/@���A1�@�he�4�@�]�3^�@�n�=��@�����"@��	B�b@�Gu��'@�dvη��@���ۍ�@��Ħ�;@����r~@����|�*@��:�I��@�*:�R@���H�ϕ@�����C�@�j�B6�@�&�^�@�"V+@x@�'���7@�7r�TR�@�R�1i@�x�S��@��>B$�@�耺�@�3�sQt�@��!��+@������@�k$����@����@�DL��I�        ?ۘ8*�?Gjr�'+�?mW��͋J?�DՇz|?���L�R?�s)�N=}?å@��6�?ӆ��o�w?�Ht�E�?�9���W?�t´�L�@@bLi��@ZP��k�@&��@#�+$@+$�B��D@2�H�M]�@9|�ǝ��@@��A�@F�Ԫ~@L?M���@Q�H�-�@V,����>@[=�^�@`��(d^W@c݈��K�@g����>�@k�j[a�@pJ<�8��@r�#�o�@u�ؑy@x�[���@|l��V@� ��_@�$b�S3�@�Y��M@�����<@�H��1�@����z�@����-@���爏@���{G@�j���@�C����@�4Ն[��@�@a�%@�e�Rb�@����!�@��0�"@��5t4Z@�t�e��@�V0s ?@��;A���@�'��6C�@��W�>En@�.s���O@���4B�@�j�r~z @�(y�u@�no��	�@�T��qmp@�BF�G�@�6G�k_�        ?��i����@#|���'�@FV[��@^h���@oOF��7@{N�HU@�gg{/��@�+e���o@���O�i@��w��@�M+V�@��[Xʎ@�*��Fa@�e��@�HG�<��@�� r�a�@���]�6�@�8���@�~?^&�9@��{�� @��M�<��@�먻�j�@�/�)��)@��&ъ(�@Һf��݉@ԼՐ��@�ᘉ��@�)�-���@ۖ��I�@�*&\Dv�@�rd�8�@��&����@�k}��@��x�J@�r�|}@�fOi��@�i�2	|�@�e�h���@�{z� `�@�U�"g�@�{���b�@�2�_X@���<�c�@�@���X�@��N����@��Fn��@����H0�@�uc���@���I�+�@�Z�_�`A 3L_�=A �R�~M�A�	�Ձ�Aח����A�@V��;A�I|LA��:��
A�-���A;��-A	në�GA
�}{{A���ˑoAGЩM�@        ?~�l���?��6���?ͅ��JY�?�j��?��RX�^?��V�]�@ �b@
����y@���L�q@����@�G<A�a@!��RX�i@%q��CV@(�����@-5�g��`@0����4G@3V��+@5�^z/�@8�֏���@;�",��@?,~��:@AU��f�@C1H3��@E)��)��@G?��)�=@IrF}k#�@K�e(I7@N.�亸G@P[�a�x�@Q�q�>S/@Sӵ*�n@T|��1*@U���pƢ@W���_@Y>�b�-@Z�%����@\mK�))@^+���DO@_��<�O@`��hJ�&@a�����@b�p�*,@c���(�@d�2�d�!@e�u8>@g �B�=@h��v�@i@�-��@jl�9uʯ@k��Q$�@lک���!@n9#6�@og�K�Ҟ@p\޳�J�@q	�
�:@q��l���@ro��d�@s(�⸼�@s�� � @t�Ҙ��@uk�N��O@v5�ȷ{@wr���~        ?V�"Ɵ�u?���r7?��.�34�?���V)&�?�l�n��w?ڑ"QHo?�ȝ�Jp�?�ZB)l�8?�Fq~8KO@:�6.@Uw�bhX@ù���t@"q����@*�p�@��@3K�)�Q@;��Re�@B�r�-@I?8��׷@P�/l��h@U�����@\d 4��@bc���@f�ҡ�o@lF�;o@qc��6�@u,�X��@y���`��@~���1�@�F���@�Ef��[�@���|��@��iY��@����iE@�����@�v� Jgj@�;N �@�2�{�)�@�]�l7@��m���@��΃]�@��u�~n@�{�[��@��~T��@���3�$-@��)����@�<
V+�@��湑�%@������@�T�7g*@��#�z��@���C��@�a���d�@��.�r{�@�A�H�҄@��~ ��@�C�܎��@���H>�l@�4)Ǜ�@��ES�9@��f�k��@¯����;@Ì<'c<�@�m��V        ?c�Q��6�?�2�$�+�?���_�+?ãk�j?�7.x��?�еk���?��Z}���?��n��{?��+�z�@݄�B�@	�ß���@V2zA3@�K�w@"X���x@(���#3@0�����@6�N�T�@>���G�@C����2@IB�l��	@P	�<���@TՒ��@X�;�o�y@^�/��@b�\s+�@fN_y�;@j�u��K&@of��B�@rh�O�F[@um����@x�Ie�
/@|v� S��@�A"d�h�@�v,S*��@����b[@�t,T3Q1@�@5�k@�A��g<@�<GG���@����5��@��pۢ�@��b�@��v���%@����4��@�B |��@��M�k@����,�@��2���@�V@bG�@��6/���@�PY���@�������@��ȍ��b@�>��y��@��b�@�ن�b@�_��G@�[�׳oJ@�_�6o;9@�m	�~P�@��B��9@��Ą�� @��ˀ��        @8"1i�!@P��glG�@n
��{� @�� ��@���ڃ/@�v7J�z�@�e�=�D@�����V@�0���@�M�����@���Ѕ)'@��.\��5@�q��ar�@�;*����@�1�tlL@�U���@ͪ��:@И�[`��@�w}�(3@�s$�2@֌���@���ӈ�I@�7[i��@ݙl}�@��D�@�y�u��@�����@�j����@����3�:@瞲8�C@�Py%�@�P���4@�ત�/@�	�
_ @�T��>�)@�P� ��@�S;EX@�\?E�v@�k�����@��U��s@��iE�s@���7��@��̛��@�?�{[8@�NW�y��@��?*%]�@��+�=�@�Z�죚A 6���kA ��9�k�A�i->AJ���A�R�=A���}A�/��`:ANxt�A�_i�A�k-c��A�%�̳A��谬�A	�X	݄A
e����AQn���        ?p�Y/��?���{1:?�a���?�I�"=<?�eB�a�?��,_��?�zi):�@�g�'
@�E��k�@ǾSPv@�g�Sd�@Tm��d@�{Y���@ �Yˋ�-@#�A΢{o@&݀<��@*9+���4@-�9ړP�@0�B~=@3d=&�@5]4Z��@7�`��)�@:z΍[��@=K��t:@@$�ۛ�@A����@Ch���@E.�"��@G?`�@IE�qm@Ks�q&@MB��:̞@O�A���V@P�����@R2� 8��@S}��ɥ�@T��C�F�@V;/$H�c@W���N�@Y-to�8�@Z������@\U���@]��SD@�@_�܇��J@`�u�P7�@a��E���@b����B2@c�����}@d�Fl3g@e�#J�\w@f�2>͌�@g��� �@i;��P�@jQlU��@k�6l�� @lجe�`T@n*ұuѠ@o���x�Y@pv�G�@q-���z@q�/�]��@r���M�@srG�^!        ?z�:�$�~?��[l�?�[���?��@�g;�?��n5O��?�>g�x@��.@@�8�30�@�	��U@�/p7(@�\��x@!C.p�C[@%-8�~�+@)����@/��I�j�@3l���@7��l��V@<�H��J@A��� �@En�nÓ\@I�]c1�@O2��H~�@R���>�f@VG�'��6@Zm	V!�-@_.����%@bM�3���@ea�pXf�@hځK��@l���e��@p��Kgͦ@r����M@u���͗@x�����@{ܢ���(@i�b	�I@���<�̘@��nPtpV@���)˔@�vaQ=_@�I�[��@����@�w��Փ*@��Q��@�ʄ��!	@��嶧��@���mf�@��hQ�j�@��O��E @����s)�@�*�R�R�@�h<А*�@��+�@�e�`�@�wGnC9~@���m>��@�uŖ�$@�
5����@��v��	@�bk%�X@�%eGG#@�|f+��'@�n_��m�        ?@�:JqG�?u]����?���oG��?�-Qx_�?�z�e�G?��}� �?а^��y?�lD�S¦?�Ȳ�ϖ?�y,gR��?�	FDt�@o�{���@*�4�#@��"J��@�����@% vޮ��@,�����@2� 0{��@8��{�;x@?��`�-v@D^�8�@I7��E@N���.�@R�0@9�@Vە�aLV@[^��!@`>����9@c"�(�$2@faG���@jCA�q(@n	Bn|�@q@R��@s���>E~@vk����C@yc�u�^@|�껶��@���@� <�@�]R��D@�Ss�7�@���g�|@�Z�p=F/@�&ʦh�<@��2��?-@�-�3�w@�䊭C\�@���,0�@��\�[ @��^�j��@��ۉ�Z�@�Fξ]Zi@�`D��M�@���a��@�?��{�@����!b�@�M;�j"@���CG�@�g�f���@�2f�z</@�(�$��@�
\��@��'��@���C=�j        @�o�/�@N>%��@l����HJ@�����U�@��so
@���Y)��@���8`�@�J�����@��F���W@���WMF�@�z��@�y �o�!@�u�����@�j놾�j@Ǟ@B�	0@�����@��䗫�@�m"2�j�@Ӛ��n@����1�l@�rnl*�@��.�Л@����@���M�Z(@�H�c̆@��ې�@喰w�a�@�x���@�s{�ڴ@���މ�@��n�o@���D@�0�a��_@�oRd|C�@��`s@���u�\@�w:�l�[@��z�v%@�f��{~�@��l>��-@��(��J@�-�<�K@��Z�b�A �[GU�A�$߾&A��{��A���V��A�5���A�����A�p���LA���Y�^A���A
Zd�c�A6d
�jAofK�R�A��cިgA��$��pA(�;�gDA���+ĲA�ӕC�EAD�� ��AF��,A���	�        ?�[0�u�4?���T1�[?�t�)v�?�C���?�Q���T�@sM�{�@BL�V@�F��2#@�,�j�@$�>�jx�@)��kP�@/�f%J-q@3Hš�s�@7ka�s@;+���@?�O5\i(@B@n��^@D��S;�@G�r|@J̥!@Np�m��@Pġ��*�@R�M�$�@T�B&�j@V�4|X��@X��tS(@[Ek�3T@]�v�͖@`9i���@a�_o���@c"}����@d�:[���@faѹ�R�@h"�dI3i@i����@k���R�@m�g�:�@pRN���@q%@N�Y@rQ��` 2@s�+׿!@t��
�AP@v2����@w�a+���@y���?@z�3�q��@|EX-Y@}���a�@�Ϧ1�@@������@��\�
��@��z���@��G�&2}@���ȅ�@�����E@�An�7�@�N/��7�@��nЕ#|@�����@�ei�X�@�zd���@��E�s�0@�(��$k�        ?h�澖��?�Ơ�P~?�{��<�v?�	ʹ	�?�X!f��?�9����?�\�g*Z�?�O�BC��@��/�GD@��9��@���]�p@$�*@-IfI*[�@4�9��/v@=4�%S�@C�eH�1�@J܏�9(n@Q��^�C6@WN��k`@]w�����@b���l�@g,���@l�ThI��@qc�J:�t@t��Ѝ�@y�`)-@}�{�h�0@�z��{��@�hy���L@��h�3�o@�D����f@�:��y��@�ȘK�6�@�%z"��K@����^�@�|��S��@�{N�۔�@��6\G�Q@����� @�sL5P'@�r (�V@�������@���@�I��$�<@�߮���@��K{�4,@�D���@�Χ�Y�@�o����@�'��	�{@��cAPgw@��h�4��@�٣5֍^@��r��@���d���@��T!:�@�ڼ���@�iN�c�@�T�ś�@ơ;�3�0@���l��@�Wx2�-@���?��        ?dfe��+?��:1ɹ?�dǥ�n�?���U�y?�Z�\?�?�A�,�9�?���&�@K$*�<@<����@%�:���@21���n�@=Rsr�_�@F�"�n��@Q3��F�@Y$�Dܜ�@a�̀p
J@h�r�w$l@p�=��h_@v�k�ޓ@|���`�@�+<��@��Ry@�@��n}��@��뛙4Z@�8N�!׻@��^� �@��@Ӄ�^@�!9��"@�z�PgD@���X"Y@��.;"��@�~CJ�@�y	'meB@�L�6l@��q��O�@��>��B@�j�/�� @�CP��-m@�-V��0�@�(����@�6Q=�)@�UpN���@��A@��0@����˰@��T�^
@�C),2@ŁH�УG@��O�UaK@����Q@�r�"���@��6@]^<@�B�q/�"@ͷ̗d��@�5J����@�]KP�Sp@�#��y�@��$�`�@ҹk�^�@ӈ=K���@�Yq9�@�+c;UJ@����B7@����eN        @?*�Z�y9@nL��Y6�@�����J@��#�<�@�r���@�>�?��@�w���@��fr���@��6R��@ԣy�*@���Vf�@���J
^@�����@�p5�b�@��*�{s=@�X'�V�@�U٥�@�g�$�@�D��Pr@��iܓn�A Q�L��Ab��,�A�d���Ag���A	�	tX�Ah����CAjC�H�AS~�{^`Aٺ�lA����A�l��I�A!�݅�AAr`�r:�A���B��A D��J�A!�	sY�A#�ŗ�A$����A&H�Fr�A'��@[--A)ǣ�i3�A+��;�~TA-��JGA/� ֢t4A0�p��ޗA1�Dj��7A3&�ƔKA4Z�,�dA5�/�;�A6�U�pVA8B]x�LA9�e�5�iA;�%#�A<��JA>-�_���A?ʓ�&ǁA@���[AA�-���AB{$��rACf�$S�ADZ5p��#AEU����AFY��zr�        ?M�ƛ�u
?����/)?�<.��?��	;��^?�*�p���?օ�F,��?���C��?玾n{�?�N�`U͍?�
ɶ��?��j_m��?�PQo���@��'�w@E����@��u�I@_��/�@'��s"@?uh 3'@y��9v%@�^�Ԓ@U2F�/@� ���@��Z1�@ ��9�@"Y�T��&@#�8��@%���B�3@'_>X]x�@)2��.3@+$�>��@-]֨�@/'�o�H@0�B���@1�w��Y�@2�9�R9@4"e���@5a�_h�@6����=@7��f���@9]���!�@:�.��Jl@<;)�b��@=��CgP@?B����I@@k8�@A:P �$�@B�ӌ@B�r(ӊV@C��)�@D�ok�G�@E�|���-@F�&����@G��=kA�@H��H�$�@I���GJ�@J�b`�Y@K��V۰�@L��bhQ�@M��B`M�@O!>!�n2@P(ѳ�p�@Pā��A�@Qc�J���        ?��-Y?U;}��8n?w���?���1��{?��3p{��?�C~��~?��6׶i�?��vk��?���$P�?���@z��P{�@$L���@��0QS@#��/��@-9�:/@5!�xg�@=�8Ė(�@D�+# @K��W��z@R[■��@W����>_@^�����D@c^����@h)A��f�@m�+��@r$� ë�@u�'��>�@z(1��7�@~�G��f@�5�D��*@�>Qx @������@�T�9��@�5�L�y�@�sWn��@���x@������@�j�au�;@�����y8@�n��`�@�;Qs39@�)���@�9�o�Z�@�nA�N��@��c����@�I`��Lm@���,��@�b���@�ᥒ v�@�v��5^�@�"��@�氯Y�X@����I@��|���@���n�~@��/��@�s�K-@�M�(�T�@Î�
�#@��a�XF@�<M���%@ǫFg��u@�*���        ?aǌ�D?�q׈Uz~?���;�@4?��}9��?�4�0>%?���N�?�g�?��?��r���@�ߕY@<n�a@T�37��@��=w@ �� H��@%���p�.@,T��ɗ@2	��L�@6�$���@<Ύg��@A�	f��r@E��$�'@J�U����@P �OӜ@SD�&L%$@V�7�KB�@Z���@_Ny����@b$��y�@d���9{@g��>$�@kAY�M8R@n���k@qg�y>��@s���6l@u�;�%�@xD#��@z��� yA@}��^�){@�L�F��@���nn0@�zLح!@�/�9n?�@���B=�@��`���z@�İ�:��@��p�`@��B�?�@�ꏑy�@��t|���@���֚u$@��t��@�!ؿ��@�_ٜ��@�����@���o��@�M���;P@����&�@�~|*:@����ȵ@�N��@�ŏ̆��@��W�� �@�W���H@�'�1�        ?���#SN�@.�����$@P
a��c@d���/�@t���L��@�2du{@��ȵ2@�/ q(@�� ²�m@�k��5��@�ɼ1��u@��Xu�*�@��2@�p�@�D�|�]�@��,�3Т@�zzkrv@��_V�@�ޮ{�JK@��=}t�h@��Y��J@��nz��<@�1n4��@���g�@��a���R@Ȭ�TL��@ʧ�큪�@̶E`�o�@��
�
4+@Ј��&N@ѭ���@���m@����@�^����@֯�zX@�
{�t�K@�p����@��Yh>L@�^��W�@���d@�yS�k@��qxQ�]@�_�Hu�@�8�&5��@��zEU)@��RC�[�@��j�*�@���=!W@��ժ�I�@��Y>�Q@�{w�_�@��?q��@�ΜV��_@��~��@��Ǟi@@�YK5�x@�.�'z�@�)r;�>@�V��{�@�U��O�=@��d��đ@�t��k�@�)���6@��o���        ?�����?��	�:�?�+%>^�?�7�Ĺ/?�����m�?��&ff@>��8)@	����6@w��s�p@�}l���@L�oQ"s@p�$�Ā@"	�	��6@%�ej�@(r�Hq�@,�@�$@/����%R@2/��R@4b���
-@6�f�Qz@9�z�\ț@<Ze`��U@?i]��ͯ@AW���p�@C�K��+@D�<��]@F��+�bs@I�3�@KL�l���@M�
�)@P�N1�G@Qg�O�5@R������@T<$��y2@U��Gc��@WQ�N��@X��\�W@Z�֚ܶm@\c;��G@^0�p�H�@`�J<8^@`�ا�2�@a�RK��J@b����_@c�	a�@e	��f\@fR�H��@g5�kd�>@hUK=�@i{<>L��@j��mWu0@kڕT_�@m6��v5@nT�(�@o�� ?�@ptѡ_P�@q-���@q̜�&^.@r}^�C�@s1]K���@s�J��@t�Z%."�@ua�t�S        ?Yp��gB�?��N�h=7?�����w�?ɬ]vpD9?��S��v|?�vY�@?����j`?��L9[�@�w9���@f���D�@�F'�s�@F#Xy@%��ω�@.+���K7@4k�R!#@;)ٙ<��@A��3��@F���t@L�'8�#�@R'�:ͤ@V�x�_�@Z�%���h@`�"�_@c	�PO��@fSB�y@i�ѭ�Q�@m�Mk�\@q����H@sj��C0@u�F#�;-@x����G@{z4�>�@~�/�fK@�妑%�f@��?bƯU@�r&cbM@�^�v�WU@�d̆?��@���%��@��c�dp@�r��3@���	�U�@�8�P5�@�O��Ś�@��v���c@��S�f@��cb�@��@�Φ@���M���@�%ղ��@����5�@�}t��@�@�����@��F�� �@�t�1�-�@�k��@�h�
��@�n6�V>@�{���Yr@���N���@��&��@�Ӏu�I{@��_�B        ?_'�"�_�?�ƕ� b?��)��D?�A��X.h?ٔN���\?�v鲏?��pEZ?�0��4�@J~w��:@�A����@�hpw�9@"5��P�@*-����@2z���"@9��쑕�@Akt�5Q�@GBǑk��@N�x�5;@S��v$ C@X�9��R"@_1�2g*@c9����@gcR6�@l�h�F@p��~S�@s� 9��@w���#@z���w�?@~���k@���#��@��ju��e@���Q�}�@�i9�l�@�~�Q�>@��.��@���)��Z@����"��@��!�V��@����@�WI�dW@����U
@��u&5@�D<f��@��/�T�B@�w��N�@�9�?�@�Zȭ�c@���U]@�)��x0@�a�^4��@�]g�.��@���ö�B@��DS.��@�I��0��@��@>�e@�Ay^�%R@�ٮ��7@��4����@�DU'9*`@�S
�@��l�^�@���n���@��ܚ^        @4�(y'��@^R��rP�@w
 o'�u@��]�V��@��F�l�@�A
����@���^�|@@��7�r@�"Z�3@���7��@�;[����@���-*1@ȴj{Z�@��64/��@����0@�;�T�E�@�� -�@���Jw@����$��@�5��X�@�Q�m��@�2�gA��@�4 {!��@�Wg70/@��#+2�@�xym�2@B��(@��2�@�(2�`a@��դ�S@�[�@�\�@�n���@��9�u@@��<�*�@��T��	�@�$T'�A ��\ф\A�f�o1RA,g� �A|���A��ZAIo _7AŐʧOA
Pz����A�j����A��.��}AL���+�A��nq�Ax���Am�Kע�Al��^�Au����A�	�	��A����A����A��!n�A:�2΍A���f��A���^�.A2'#��xA�ԗl�A �U���A!D���#=        ?H��7,�?��p�or?�s7��T�?��qh�j"?�o�BD�?��3s`?ܕdײ��?�.�4�?� ۉ���?�5��?�'�#�?�Nׂ��@ ��8���@�-
h�G@?F����@WQ�*@RA�k?�@�L띮�@q��3l@$�2@��8��@9^�G�W@ P��f�@"'	9�l@$ t7ig�@&>���%@(��9^@*�p��@-�ABN�D@0�K�ud@1����?~@3:�[�D@4�o���'@6h�dX.�@82�bՕ@:g���$@<	���3h@><u(@@ NC��@A@8� #�@BlxBߣ@C� �%@D��g��c@F:�,���@G��y���@I 4��@Js�W�s�@K��M3x@M|�k&L�@O�%~��@PW�|�M@Q,L�9h�@R��K�@R䈣���@S�O�~~@T�?u�b@U�dL<��@V���
2@W��@͈�@X��D8�:@Y��@>��@Z����g@[���Td        ?	��.��?H����!u?rlf���?��T�ٵ?��lM�/?�>�f��?��Qf��?�HR��?�\:kR�?��J���@$b��n�@lN���@�+�
�@!����q@(䖗���@1�8���@6�,F��B@=����B"@C>�H�m@Hd�3�b@Nt�'�;�@R�DZ���@V���J�@[i�D��t@`K&i���@c,Z,s�@fZ��^�@i�M�MnL@m�C[��@p��q�@s0���@u�pf�ß@x#h�OV�@z���u�@}���O�C@��ƚ�@�[�H~�@�<v\P�m@�@؂�i�@�j���е@��-e���@�9��r0e@����)�V@�]}ˮ[�@��*|�k@���(_��@�9���ը@�R�d��@���˥@�ə�_�@�C%��[@�J��0@��h`�^�@��7D��S@�+����@������@�sRI��@��F�TI @�_�0&�@� �U_��@���p��	@�������@���)��        ?C��x��F?y2����?�0��%�?��f���B?��\P=>�?�l�mjx<?�H$�{ϗ?�E��?�?��̃���?�H����@���@�^��6@!7�b�i@!��?c@'��x@�t@0(빟�@5���|��@<l?n+^M@B_��=�w@Gb*՞jc@MRAUK�@R!A�Нg@V!���\
@Z���O=T@_�ߍ���@b�ߎ�T@e�i�Y�@iq>��+@m=0w�[�@p��s8@r�R�@uC4@�,�@w�zQ�@z|�O�3�@}WV��R@�-���n@��F�0�t@�re^�@�5���r�@�?�=��@���@��@��A�^�@�2t�UDi@�r%B٥@���E��@�#ZL?�@�o"[ã@�ʮoJ�@�6����@������@�DU�;�=@���<���@���SO��@�g1[}dV@�#6 E6k@��hS�t@�#T=`1]@�4��d�@�Q��=�@�{UM�nR@���'�@��RG�@�E�.yr�        ?꠨f?�@!�G1I��@C,[�P$@Y\�ˣV@i��/|@u�ͅ�f�@��Ŏ@��m�B�@�?8���@����?}@��З4V}@�s���+@����+�@���_�v@�% �)0�@�g� K�b@�ﲚ�>\@��x;��0@���LwX�@��Ը��f@�Y1q�@�Q�sV�@�5�g]"@�6���<m@�U�u@ɓ�so�@��/,��@�m�g��@І@����@���Z��
@�Y��U�@��p迀�@�t���)�@���w�@�ݸد&i@۱BS�8@ݙ��@ߘk�U@���fZc=@������@�"!4.@�=���@�v�@t�@�e$�h�@�q<9��@�i����@�п�(|@�BJ���@�� 
ż5@�C����@�iJ�C�@�6*";@�i�xr'@�ݧ�@G@���!X@���G���@�}�w�~@�h(*�@�Wv�#�p@�LM{��@�Fɐ;�E@�G(x�&�@�M��0Ai        ?d(B�жo?�et]x�?�>:��2?�7#��?�f
�Ε?�M(D�}>?�- }�y?�[�@�EX?������@��S%o&@���ŧ@
�D{�H@��J��6@���E@��VuW@~����;@w�yN�x@�-oZ�@ e]��l�@"�)~�X@#��ָ7A@%����j@'u�8I_�@)b�"�"@+`r�&�@-p9n�Ӏ@/��k`z�@0�RA#��@2	w8Y��@395���@4s���4@5�Dz��@7-ڬ�@8k#��[@9֭#�;@;O��p&}@<ִ)a��@>l�(@@	��/��@@�a���@AʒѰ��@B���UI^@C���OK@D��m��@E�q9��@F�x�$@H�w´@I3��:�H@JnC�_/@K��wQ-e@M�̪S@N^�iX�	@O�i�I#-@P�P��@QUS���[@Rf���_@R�9;��@S��C��@Tu�H��@UI�P��b@V!�I(Y@V���QJ@W�U	zz        ?	`~\���?F����+$?i�Mݗ�?�f�:�K?����6.�?�!$�2�?�xF�-nf?�6���?�߃�+?݃�B�KI?���.%�?��6W?��ؐ�@�odXQL@���3N�@�ƎH��@ �_a��@&��( Ĕ@.���jF@3�O�M2�@9t�^�8@@1���W�@DV��f�@I<U����@N�{�7�A@R�HZ�m@V�V����@[�~��*@_��B�|@b����@e�o�*/w@ivD�fz�@m\S(G��@p���y#?@s4�Q���@uΠl�s+@x���4�j@{�[�޿@@�5��@�\��
�/@�Q�:���@�lݒi��@��G�۱�@�_�*V@��h]6�@�o�����@�.I,E
@��gp�@�_>	�l�@�E\X=�@����`@���h�q@�㼊$�&@��֭��@� �x1@�K�o@��,B�_@��"//h@�#�ؔ��@���n�@��xn3��@��(�� �@�eXI�I        ?eu��A��?��,v��?����?̊����?��<]Hf?犃*
�	?�3�9z?�FS����@ip��@	6:�e�H@������@��%o�F@�$�r��@#}�9HW�@)<l��@00L�+ZA@4���ի�@9�g�#@@&U
�bN@C���@HeWX�
�@M��[2ws@Q��}+�@U#R���8@X��h�=@];.�-E@`�8���C@c�L�ʏ�@fy�)�d�@i�_�F�Z@l�S����@pQ�.��@rHv	��B@tb�ǂ�@v���@@y��y°@{�9t�@~?�W)6@��G�0@�	��B@���H681@�S�(��@�ل�v�@��:T�M�@���3@�Mp/3�@�/� 851@���s��L@��O��@�3�4I~�@��-c*��@���xPd�@�\b���@��!R�P@�wm���@� �.�@��y��p@��1�!@��^��d�@��Ӈx;@�ǻ�#��@��\ץ�e@���֭*        @�r�&G�@;�/��x�@Z)�"��@onK]�]@}L���@�k}4�R�@������@����f�@���xg�@��b�
@��%b04@��A��`@�}���V@�*����@��o�>$@�Z*dB �@�V�|�z@���=B@��@�j�@�z��[	@��_ռ�@į	�,�@�^�6�@����"�@��9Jc��@�ǻ ���@͵�Z���@ϵ�9�0@��{���@���wp�@��]�Q�@�;���"@�n�y���@֮��1@��� b��@�R��o��@ڹ�Hz�V@�/��-�@ݶhS�w@�NvLZ�@�} ���@�]Qr:�y@�HL�O�Z@�>t<\�@�@��5�@�M=�v|�@�f&�8�@���i�@�9N���@��Eu-�@�>̪��)@쑞��1[@��G=j�@�XU/Ӛ�@�e�PG�A@�$ΎE�@����)�@����F@�sC@�Q�"G�@�(�B�c�@�z��b�@��}��WZ        ?BE��ߊ?yG<��ģ?�g��3�?�/1Wn�W?�,�@c�?�*�W�?�<�'�	?�v_W���?��&�R?�/�+�?� �f>1?����?��(��s�?�l���_:@*� ns�@Հ���@��}�@	�ezeH9@O�R�u@���R$�@������@Ź^���@.����@��9���@�^KĂ@�H7�X.@!sfk]��@#3)���@%|�|��@'H��x@)=\��č@+���͏@-�ǽ��@0Ou�V��@1���B͠@30�i1�@4�a��s�@6o�2d�S@82�Ռ�k@:�[��@<��˂@>F�JJ@@��?@A=�5��{@Bk����@C�˄��_@D�Q,��I@FE_��@G�'>#9@Iݝ���@J��*���@L)J�s@M��-.O�@Oq�@���@P�0���@Q{'���@RgЦ�4�@S\Bݢ+�@TX�o�"@U]��Vo@Vi��!S�@W~�|�SW@X������        ?=`��!9?K<Q#��}?q�Ɇ(�?��k�?��-y�x?�V��{?��T����?�p����|?�x�9���?�sϺ�En?���@�`�@	�%�@�A��"�@�m�-�D@#�b���@+I�mD'@2��aK�H@8�)���@@��)�@D�ۥKU@J4fE��@Pd�2XZ�@TF/���@X΢l/�v@^�7���@b�.�X@e��qd?@iq㔂�@m�42�,@qpy���P@t<�ab�@wY')�i@z�o5�r�@~�hzF[@�h�Ι�T@��P�>K2@�:n�r�@����g$�@��0}|��@�) ��@�P�a-�^@�.�F׼@�/��K	�@�T��n��@���ǧ�@�Lu��@�������@��B/v�@�'�߰�r@��"���@�P��M�@���aO@�ϻ��T�@��QR�K�@�����*L@���@���@�p�	E�@���5F@���xj��@��.��2}@�:[U޼�@��l`)K�@��^��        ?R�.���?���A�q�?��z�ܓ?�����?ς4�o)�?�y:�B?r?��:�Su�?�Ǥok� ?�s@��}'K�@F�@}�@��f?4@˗T��@$�WC���@,�HD)�W@4
�?2��@;QA��
@BQ�5T��@H0S��i)@Ow���@T-��8&@Y����X@_�$���o@c���>͏@hW���w@m,6��q@q{x-hM@t�7F���@xs�ЊN_@|�(��nB@��\���@��0c�@�҈�iY�@��|o��@�X�Vn@����m@����"�@��'y�B�@���H�@��*���@�?��o�@��C�d��@�G@��Y@��پۺM@�b����d@�����;�@�[O�y\@��q��w@����H.�@�8��`�@����g@��|�k@��4�y^�@�����@���D��@����Q�@�������@�ȇ�4�@�ݷ1��@��5��C�@�1YaV@�I�����@�|��G��        ?�}�N�p@(�^��1�@J1Hl;�@apO/+�@q�^{�"@}�VO�z�@���|��@���؅�@�
81t{i@�����@�|��6p@��=��@��f��A^@��3J���@��u"��@�?8��vy@��]��X�@�qP�	I@�X�(�;m@�x@&��@�i��z��@�6�Y7��@�#��Q��@�2��{?�@�d'{J�@ʹ�u��W@�4zY8/e@��+�^E�@�R��j@�������@�c���.H@���,�@�ؖ�	g�@ٻ���@ۻ "b�U@�د���@�
�[�6S@�9c���@�x�)-��@�ɛ�o"@�,Jl�]@栠h(s@�'^^|��@��o�W��@�k��UZ�@�)�0kU@���=<�@�nP��+�@�h�`�C@�l�Ȣ2@�y�!�R @��!b�@���&t��@��Z2?��@�~�
z@�I�s�?�@��<��@�����@�?1�KR�@��G�V+FA D&X<A ʆ�v��A�n���        ?q�`~8��?����k1?�p�._�?�d�J{{?��M`�?�WGmJ�?��U��@J�l�k�@�i�mi"@u�}l@܂O��F@��д@Zsvs��@ ��i�@"�L*n�@%��v�}�@(�ag�5@,||A�MM@0,=��@2J9�
X @4�qU�M@7,���p_@9����M�@=l�Τ0@@'�%4�^@A킯��$@C�j�Y��@E٥���@H ]���"@JG���*@L���X��@O:����j@P�j�@RZ�b��@SӉ��ۈ@U]���I�@V�Ls=�<@X���I<�@Zg���@\:.��]n@^!.a�%�@`��^�@al媏�@b+�R�*,@cL�W���@dz���Z@e���}�@f����A@hT���v@i�:=��?@k0��L3%@l��E��@nLRp�m�@o�Y�p�@p�e��yj@q�ߋ }@r��Sťt@s����B4@t�(K�҅@u��+@W%@v���[�@w��~v(�@x�K���\        ?I�$�J�??��݁�?���O�4c?���?�SZ�??�[Y�E6�?��~��!�?��3#F�?�� ryB9@����C@����AD@����u@#�y&�W�@-�JB��@5ˏ�8�@?��$*@E�旋�<@M�E xb:@S�[�4�_@ZVA!��@a�V�@e۷vp��@k�̺7g@q(���y@ul�m��@y�)l��@~��*mx@�nV���@��JǸ:@���Q�l�@�����_@�%(ܓ��@������@�k�,o`z@�j�ٜ @��dY�%�@���J@��4��kn@�������@�ч�]�@�L�	�!@���3GI@�.&e<��@���k�߄@�IP|(.@��m�$R@�=a�á^@��S�?q@�t
����@�(�E��@��L6��@�����@��=�ړg@�Sj��'@�Y�.I@�g�A)��@�Ud�9@ğ�0�Ӷ@��Ï��@��6�Tt@�:L����@Ɂ5*D�@��!��67        ?!VMJۜ?Z���\?�v���q�?�cW��r�?�q�Y��?���it��?�1����?�/(�D�D?�e��`�?�]Y�/�M?��4�9@�7�c4@�<�5�@��ș<�@"d`�?�@)m"�ӹ�@11 ^��@6Ȓ�|ߗ@=�L����@B�ڀ�Gz@G�2gƾ@M��f�cL@R<��]=@V �N0�@Z�N��J@_�;�4 o@b��"v�@e���۷�@i/#iH;6@l�f���@p�9��S�@r����@uH���@w���%J@zćA�@}��iw�Y@�����d@�G}����@�"$W�@��j��@�2џ���@�j@@��J���@�?�4|�>@��]p,T@�P�[ӡ�@���Đ/�@�L͜�@��-,9>@��A;��8@�X[=��@�0z���@�)̃��@���e`�@�:{j�@�7��K^@�[���3@�� U�Q@�ʡ��Y�@�(�b@�l�:��@��U���@�EǙ��_        @�R�t�@M�¦��@l�B��@��}���^@�C=Wu.w@��b�*�I@�	�a�Y@��P9��\@��x\H��@�7H"�@��rRM@���<�8@�������@đ�_߄@�ӎ@��@�boˢ��@�G����!@��Tb+$�@�!#�H
@ָl�|=P@ٔ�2�70@ܼ5�@� ���k@��XQޏ�@��6_F�@�<<���_@虛;���@� �Mz�@�������@�X�bc[@����%@�}8;,��@�3�=h��@�o�l��@�����v�@��P��@��ƥx@�H�΢��A �uà��A	?�N��ARH7N��A�Afz�A�t���A�?�.�\A	���!�A
��4�LWAs�G�H�A=�h�a|A}���pA	I4`́A�?boHA!���KA?��?�Aj�sW��A�ۈ���A���JGA76.��A��� A�LG A|?��1A։�@�A NT'��A!!uK���        ?w�za7?��B��P5?�P���%3?ޓt����?�����w?���Ֆ?���M���@��O�v@V�k�Vt@�8cC�@�n�t��@D'xo�@���S@"��G�@$�9��v�@'�5m/��@*��.�@-�s��
@0�t�E�@2`^�@46�r��@6"<u��g@8"�J�g@:6�"ܹe@<a��d@>�r�.ô@@|;�p,�@A�aR�Y�@B�sI�aM@DE��s�@E����]L@G	���;@HG���@J�4D�@K��E\�@M-x��^@Nר�Z
@PG�ߊr@Q*����Z@R3x.�@S��O��@S��#�$@T��/&��@V���@W,���@X*�`��@YG�F<��@ZmuS�5-@[�G[@\�z5�_@^>���D@_W��|@`T��|@a ����H@a�ڿ�(�@bg�!�S@c!��W�"@c�Zf(��@d�jtwZ@ej��7(@f6��}��@g^^pP:@g�X)�        ?P��x�?����f��?���T}��?�\��)��?���)�3#?��*���?�	Dcv?�*,�U@���5U8@@��ј@�RD�+@��r�@$E�l�E@*� |��@1��ь�@6�P�8=�@<�T��@B��{@F�9��R�@K�EE�,�@P��G9�@Tg�'�*@Xe}�7�t@\�c,j@@`�)��@c�N��}@f����@j\W�ț�@n�3,5@q>j�@sPe@u��g�h@xH��_�@{����N@~�*A�@���|�Ag@�Nk�t,@���P�w@���S�@� �E�c@�R8��@���T��2@�!\,-p@���`H�@�D&��@�����;@@�H�]�U_@��5��tO@����Y@�t�V�%@�[����8@�\"gOJp@�:�j6 y@�T~!��@�{��� @��?�,L�@���V@�DZ��J�@���7�ɩ@��!��}@���=Tſ@�!��*&@��m~��        ?P�*�[T�?��QH4�?�2cͯ?�+q_N�;?ø��3?�r�K=��?�$�uY?�)���T�?�׵�R<?�T�ǳ@ex W\�@	z�6t��@G1�3�@�3Ń@!�]���@'�$է��@/Z@[S�@4Z&fj�@:���ܝ@@b���@Db[�8#�@I�?�M�@N� 	�;A@RbE詑)@U��6�b@Z*�!�@^��VY�x@a���\"\@d�	[��@h2|���g@k�b�vb�@o�I2�d�@r2�S�G�@t��Ɯ@w^*�	�@zR
r��R@}�8��@��y���@�f����@�o	��)�@��H+��@��^�V�@�z�����@�'��A�#@���u�Z@��I&Gd@��s���@�N���W�@�� �d@���Jʸ�@���j@���r��@�0>��ӝ@���<94@��Ƴjר@�(NT$@�s#tt�q@��Eo��@�3��N�>@��gq�}�@�0M�Q��@����@�l?�	��        @0y&K6@H[��@f�/G�E@{܂^��@��ϯ��@��� )d�@�%�E�@�֫�Yw@��X��@�S�����@���8�@�8T���@����߾@��3q)�@������@���*�`,@Ȏ ����@ˁ���
@Λ�rƣ~@��%n@ңّ8ty@�nP��Bz@�N�-�@�F����@�Vר5c@܀����I@��4b�1�@��A�@��am�@�!7��x_@�?��X�@��c���@�q8�+��@�&�;�@�N����@�a--Ë�@�,P!��y@��O�/�@��W�բ3@�oؐW�@��No @�+��G�+@�O���;@����c�@���m�wV@�%]F��@�U�,�M<@��|]���@�$t�m@��7X7&�A K�2lA �Wȓ�:A�߂�A�Dd�As(aP�!A]�ˋ�AP-��VHAJc�X�ALmL\�,AVGVr�A	g虠#�A
�=���A�(��7�        ?w� J�?�m�ֻ	?���T�?�#RB��?�
?�7�aU�@�NW�AQ@��#��Q@s��Wd@J�s?��@ i����@$)9!��@'��]r2@,*E{$n@0Y���@2�#/�@5S;	л�@8	�|et�@:�Uf��x@=���{x�@@��#I@B9�(�m@C��@��@Eԟ��c�@GČ�@I�:��/�@K� �CLl@N$/�Z@P:bdɉ�@Qo/{�%C@R�����7@S�1� i@U[Bh�@VĶ3"��@X<��q�n@Y�:EA1@[XНti@\�r�X<@^� τrI@`?=2C7@a.'��I5@b(�8��@c-W9�@d>/�%Y@eZP3�p@f��#�e@g��>.�@h�K#�$�@j:�L�@k�L���(@l�a�k�@nU"�_�@oȇ�j��@p�CV_�@qg�^��j@r0�z��T@r���A@s�E��.@t�	\5��@u��@N�@vl�b�
�@wTRK�=@xAg-���        ?P/М8�z?�I��2?�aґ���?�x�L^i?��=E)?޳��qU�?�.q�%?��/�G�@Jv ��>@)���]Y@�">��9@M�j"��@&��y��@0a�f�YS@6�J�uy�@?:�!��@D�	PV��@K]�����@Q�OO{(@VL�~��@[�x�Q��@a�%��@d����y�@h�%sx%@m|aV/�@qQ&�&@t(�ӗ�@wG:�T�@z�����@~a3uǹ1@�0~��J�@�X+�w@��Ԃ�I`@�#�F�<@��B-�@��˿�@�O��zu@���T��@��?�\@�gJ`m�;@�N1��\�@�P�s`A@�p���B�@��?w���@���W�@�D���@��P�@-@��R"�@�f�Q�s@��Y�kI@��^陶�@�2�0CS@����/{�@�̀X"��@�����&@���/�@������@�	�\C�@�1�{��@�gS���@����f�-@��G�c}@�\�};��        ?��n�Od?��ò�϶?�b޴�?�-�	(W�?������!@��N8@�@�T$�@�nO ؄@"Jo��a7@(_�\�@/�)+^@4a���.@9ǯ����@@��O\@C�%ؘr@Ha[rNԕ@M�w^6�@Q���)!@U1X�~�@Y�L�@]v2q��c@a1�0��@c�af��@g5�@jpCL@�p@n9,���{@q4��BK@s��[� �@v��h�@x�CR�j�@{ߏ؋k@1��Y�@�g��p�V@�]�3��_@�}M��p@��S��)@�@�r��@�肀���@���Yq�@�g�ǁ@��#���@�đ+� �@�������@���-�@�����^I@�ٰ���@�*fC�R2@���:��@��c�f@�l=v�	�@���>��/@�Kڼ��@@��^��Mi@�m�����@� ׶g@����7�@���1)G�@�@����@�9�D�4@�<�s��@�I-�@Ƅ@�_��ᐠ@��\����        @$��/O@Y�L	k�|@y`�F��@�����\@�u��/@�� 0�1�@�ksPփ}@�ř\��@��t-��@�;�m��{@���0�N@�`zN���@���g�C@�*�L(@�y�BV�Q@��!Ȳ��@ߴm�ũ@��МT�@�߄@t@-@�	��H��@�N�f��@꯫�ѷe@�-�_�)@��ua��T@�B3��|�@򯜼�&�@�-GX�m�@��q4d�x@�ZM!���@�
	ZX�@��֥�y&@��� s�~@�������A ;9�yA?I3��AL�vw�IAc��6�gA�
ӟ�iA�G/A�'�<�A.��a��A	�����oA
�}32v@A\�jQ�A����Ay���A��*/lyAk�5�(�AO*���FA:�UraA.E�@}wA)��x\oA-.���A8���AK�}�¢AgZ�+Q�A����:A��}�4\A�,��XA'���AlX��gA ]F�Y�A!���^        ?w?9��V?�H��,�?�{���j?ڍHO�"K?� ,�?���t}?�� �Y�p@�^�м�@�H'�L�@�L0��@��lݵ@�5'�@��6��@ �b�J�@#�����@&�X`_��@*#֖0+>@-�'�A?R@0�/Zɟ@2��2�@5$�eK! @7�+��sa@:*��@<�"鍄@?�&�HwW@Ae`L�B�@C��$.�@D��z��@F�g(�~@Hg"s$�@Ja%�3�@Lr[DIh.@N���m��@Pm}�]�W@Q�2��3�@RЦ��1�@T�E��@Uc1w�u�@V��� �Y@X%�I�Z"@Y�}KnP�@[���8!@\�	�"y@^:���@_�e����@`ĝ��C?@a�z���O@b����g�@chJ��)!@dT$�R�@eEBM�5�@f;��kr@g7H�%p�@h8"���@i>�l�Y@jI ���@kY"�%@lmؔh7�@m�����@n�[彽@o�d�y�A@py�Z�@q��P�        ?#;W��	?V��$8D�?x}��X�?�y{r؀>?�z�1@�&?�v�3 �?�TB㰹?�,��u��?�f�ɕ?�y#k0��@�bx�!@��ڌF�@�?��-@#?|�T>�@+�4;
�B@3�#��s@:��'�e�@A����@G�Nf���@NO�r?��@S:�Z�\F@X�*h�G@]��^fk@b5��@eḕb�k@j*�fׂ@o/���@r;�;0��@uGu��`�@x�����L@|f�Ó�T@�A�X�@��\��S�@��� ��@������[@����c�@��Ԥ:_{@�~�/�d�@�Kd�0��@�8��$�@�G���ڂ@�y�y�0�@�ύ�y�m@�J�ι�@��k ���@�Zً�
@��㬊�;@�a�$�@�n�!.@���RA*@��.)�PE@�vc�Q��@�u촐�@���{���@��g!��i@�N�B��@�1ϴ�M�@�o �Pt@��z�gU�@�/�@�v:Š@��!�m��@�j���        ?x/(�v�}?�c�����?ūau��?�(�gN$?��?7�?�a��?��kި"�@�\4�D�@	o���h@�B��g@Vb���@K�ޗ��@# �gjC!@(�<T��=@0�%�I@4�.&���@:f�j���@@�C~L�d@D��[{q�@J���@PCy�A@S�h���@W�o��T@\Z��[�@`����s@c΋$-GP@g ��.�@j�'@nѺd,�@q���gِ@s��ݻ�G@v��U�n�@yM�4�@|?-��@a����u@�Z�m<��@�"X��@��yЌ��@����P@����:@�"�lz�@�d�m���@��`��:@����M�@�f�(���@���^�5@�%+5�@����Ċ�@����@���L��@�V�	�@�
B"�Md@��M����@�Q�)a]M@�D�a@�@;�d�q@�D�8�,�@�R���@�j����@����2�@���%���@�풃�@�.a垚�        @�>
��@F��1~%t@d�(+i@v��.xU�@���6�}c@�0fesI8@�7>>J�@��V�#@���D��@���4��`@�u��@���Q7X�@����{@�O�hVà@�����#�@��b�6��@����@� Sq���@�F����q@ȯ��7��@�=>���@��U}�@�f��5z@��Xl2@Ӏ�b��@�/�c;��@���2 B(@��%0���@������p@���t�@�z�9@࣫��s3@��a����@�Y��@�W��W@宬��"�@�Q�s@��Ȟi�@��k//@딄dM��@�1ZL��@��!���@�J����@�/:�R@�*�c @���N�@�
���#u@�+����@��8��@�.�ׂR@�J�A��0@�oi�:�@���"�W@���:FuR@��+���@�Yآqh@��$�i��A � 7bqA5S��'TA�Z�)�A����`Aj�{cPqA1�y��        ??z�.?v곗gx?�
jE�]?��R�}��?���z��6?��ω��E?�F"�[�?؅�,�R:?�mb�գ?���]Z{?�V�i��?���e?�,z��O�?���IB�@ J��wM@_�y�Y@�)�	�@
���֛@�Y
�Q�@��G��O@����@��f�@��qv%�@�B "��@ �&Z�Y@!�t�ɉ�@#�-4/�@&	�^W�@(M|1��`@*���E@-P��67X@0
��	@1�H��@3���P�@4��D�8e@6�,����@8q9�?5�@:t�'�D�@<� �/�@>�����@@���o@A��V_[@CK�?��@D�(XZ��@FN0�R@G�AZ��@I�՚��)@K����iT@M�?�M�@O�({���@P��c"��@R�?��m@SX��(�Y@T�r��@U��N�E�@WcS�4��@X�X)@Zb���ա@[�vx�@]��H ŉ@_V��DhK@`����@aw�����        ?�	zi��?G`+AI?p[� ��?��d�=?�§����?����Q�?�}�꺄?޹�?G.�?�����,?��R�u@�|{N@�d���@��� @%Ĉ ��@/pNG�`�@6E	��/@=��2�u@C��b���@I�-��X@P�߾ep�@T�]�!�T@Y���&G@_+{�mj�@b�8�J$o@fL�k�R@jE���@n��`E@q��p��@tzw=��@wnL���@z�ͧ��~@~0�f��@��OR�V@���{�@�Z��;@��{1'�*@�m�攴�@�C_�}�A@�'�*���@��r0�@��ގ/��@�jl-��@�jv9Ӵ�@��a ��N@�ќ@0��@�;��??�@�f��8k@��2fX�a@�30�)԰@��ۦY�@�W��@�ћ��g@���q�^�@���66y	@���>j�@�ݧ�}�@��Yi�@�7�>$J�@�s8�H'@��G�TW@�}� �T@���E}�{@�r�+D�        ?����?@"4H�ʓ?hjF�E??��PO�H�?�Y>T8R
?��*╉?�i�)|V?���A�R?�'M1h@m�E��@�1�AO@�x6rD@$%�q�@.��v\�@5�~��	�@>e,e1*@D��5_P�@K����s@R�}F@WNO��l8@]����M@bp� J�@f��!Q�@k�3��@p�ʐ/Ƹ@s�	�G�@w�ќn�@{��^Y��@�yk
�@��1>D�@@�C��:3�@�4�@&Uv@�b�e`s@��	6��@�=f� �%@�3[�Me@�I���2k@��f����@��`{g©@�UB����@�����@��^cwi�@�K2�v_{@��
�|@�e7_��@� v^�@�ɴ�FZ@������@�{뷋�@�q7�T��@�=��!}B@�L�7��@�fY�>X�@�����@��'���@��g�rB�@�3�ҫ@������@��M��L�@�8����N@��\:B�@�_S'�@���_�g�        ?�ٹEI��@1���$@1ct��@E���jY@U	X�m�@az_�[�-@jl����6@r�? ���@y��a@��Zo�[�@�����@�	@��f[{�@�b��f�i@�y��6@�P4v�@�'
�8@��6�t�t@���M�[�@�C���@���@�@���o�T@����@�k���@��
���@��u��Ӵ@��N���@�Ksb!@��j�p|�@öq4�m@ř(~R4@ǜZq.��@�� X�f@�/�]� @�}D_�@Ћ_�F�@���#�n@�g �w�Y@���}�Ğ@֤��[hn@�mTMTU_@�T�=s4�@�]����?@ފ���n�@�o�k�G@�� ���@����
��@�g[m��@��;�Yn@�w�40�5@�!6�4�w@�੦�/A@�oN)��@�!�-@�R���T@�_S)+%�@�w?$��S@�lI��Y@���ܭ�B@�`�c4@�G
���@����?.�@��D�x��