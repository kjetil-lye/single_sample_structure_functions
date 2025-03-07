CDF           
              t                 x          @       y                 z                    E       alsvinn_report.software           "alsvinn https://github.com/alsvinn         alsvinn_report.softwareVersion            0.5.3          &alsvinn_report.currentWorkingDirectory            g/cluster/scratch/klye/single_sample_structure_functions_new/experiments_multiple_samples/fbb/H0_5/N2048        alsvinn_report.operatingSystem            RLinux: Linux 3.10.0-862.14.4.el7.x86_64 #1 SMP Wed Sep 26 15:12:11 UTC 2018 x86_64         alsvinn_report.username           klye       alsvinn_report.host           	lo-s4-043          alsvinn_report.standardCLibrary           GNU libc 2.17 stable       alsvinn_report.generatedAt            20190907T110035        alsvinn_report.CPU            )Intel(R) Xeon(R) CPU E5-2630 v4 @ 2.20GHz          alsvinn_report.revision           (9b4bc89ce460a208bd0f7fc3de0d28dd694c4956       #alsvinn_report.versionControlStatus           CLEAN          alsvinn_report.buildType          Release        alsvinn_report.cxxFlags                   alsvinn_report.cxxFlagsDebug          -g         alsvinn_report.cxxFlagsRelease            -O3 -DNDEBUG       !alsvinn_report.cxxFlagsMinSizeRel             -Os -DNDEBUG       %alsvinn_report.cxxFlagsRelWithDebInfo             -O2 -g -DNDEBUG        alsvinn_report.cudaFlags          �--use_fast_math -Xptxas -warn-spills -gencode arch=compute_50,code=sm_50 -gencode arch=compute_60,code=sm_60 -gencode arch=compute_75,code=sm_75 -gencode arch=compute_70,code=sm_70 -gencode arch=compute_61,code=sm_61       alsvinn_report.cudaVersion            10.0       alsvinn_report.cxxCompiler            	GNU 6.3.0          alsvinn_report.cudaCompiler           NVIDIA 10.0.130        "alsvinn_report.boost.BOOST_VERSION            106900         &alsvinn_report.boost.BOOST_LIB_VERSION            1_69       #alsvinn_report.boost.BOOST_PLATFORM           linux          *alsvinn_report.boost.BOOST_PLATFORM_CONFIG            boost/config/platform/linux.hpp        #alsvinn_report.boost.BOOST_COMPILER           GNU C++ version 6.3.0          ,alsvinn_report.boost.BOOST_LIBSTDCXX_VERSION          60300          alsvinn_report.boost.C++11            true       !alsvinn_report.boost.BOOST_STDLIB             GNU libstdc++ version 20161221         (alsvinn_report.boost.BOOST_STDLIB_CONFIG          "boost/config/stdlib/libstdcpp3.hpp         0alsvinn_report.floatingPointPrecisionDescription          "double (double precision, 64 bits)          alsvinn_report.floatingPointType          double         alsvinn_report.floatingPointMax           1.79769e+308       alsvinn_report.floatingPointMin           2.22507e-308       #alsvinn_report.floatingPointEpsilon           2.22045e-16        "alsvinn_report.cudaProperties.name            GeForce GTX 1080 Ti        ,alsvinn_report.cudaProperties.totalGlobalMem          11721506816        /alsvinn_report.cudaProperties.sharedMemPerBlock           49152          *alsvinn_report.cudaProperties.regsPerBlock            65536          &alsvinn_report.cudaProperties.warpSize            32         &alsvinn_report.cudaProperties.memPitch            
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
       sample_672_mx                                                                 sample_672_my                                                                 sample_672_E                                                              sample_704_rho                                                                sample_704_mx                                                                 sample_704_my                                                                 sample_704_E                                                              sample_736_rho                                                                sample_736_mx                                                                 sample_736_my                                                                 sample_736_E                                                               sample_768_rho                                                         "       sample_768_mx                                                          $       sample_768_my                                                          &       sample_768_E                                                       (       sample_800_rho                                                         *       sample_800_mx                                                          ,       sample_800_my                                                          .       sample_800_E                                                       0       sample_832_rho                                                         2       sample_832_mx                                                          4       sample_832_my                                                          6       sample_832_E                                                       8       sample_864_rho                                                         :       sample_864_mx                                                          <       sample_864_my                                                          >       sample_864_E                                                       @       sample_896_rho                                                         B       sample_896_mx                                                          D       sample_896_my                                                          F       sample_896_E                                                       H       sample_928_rho                                                         J       sample_928_mx                                                          L       sample_928_my                                                          N       sample_928_E                                                       P       sample_960_rho                                                         R       sample_960_mx                                                          T       sample_960_my                                                          V       sample_960_E                                                       X       sample_992_rho                                                         Z       sample_992_mx                                                          \       sample_992_my                                                          ^       sample_992_E                                                       `                                                                                                                                                                                                                                                                                                                                                                            @              ?�w��x�U?�Q��'�?ܛ��ɡ#?�^���T?�q�^r�G?��L��n�@-Q5�Y�@�aC��@,8�}@n�ij�@}� ��@��߇a�@7��O�@ݳ���q@ ��#�W@"�b���@$�^�Ffo@'F�jF�@)Y��]Е@+���ٽ@.��6ޥ@0E����*@1���e~@2�jW�c/@41�7�@5��9S�@6��y�Ǟ@8ku9�e@9䟝F�@;e�g9T�@<�/�*�@>�[�r�@@�j�&�@@��tr�@A�!�)@B��(;]@Cd���{�@DC�)��@E&�(ƒ@F�s��@F����L|@G�^��L�@H֑�|��@I�8��Q@J�JU$
K@K���� @L��n^�j@M���N��@N����j�@O�z��%=@Pl��(Y/@P����@Q|�<��>@Rxٸ!�@R�vCrM@S �d�>@S��z�;@T@0�V�x@T��x.�@UeV�~@U��b2��@V�o~ް�@W&�a�M        ?��O���.?�Ņ���?��&\�8?�޲�?�:{���@ _* 
�@��J��@V@�c(g��@S��s�@t�F_�@��
T��@!R��)R@#��2T�j@&�+ְ�p@)P;�Q�A@,A7>�5@/TC�1�*@1DI3��@2�A*p@4��G� @6r�dGȩ@8L/E6�@:4nf�_B@<+ns1�2@>0���(@@"P$���@A3&>�_�@BJ׾5@CiF�߃]@D�Xlq�@E����@F��\޲@H$e��@Ic<�}@J����G@K����Z8@MC���n"@N���:p�@O�ּ���@P�Q�:?p@Qa�͛�4@R�6��@R�����>@S���Քw@TO^�*|@@U̥Sר@U��k���@V�޼�}�@Wiv<N�@X6�]�9@Y�@Y�#��6j@Z�=$S�\@[��Qa@\`7��X@]<�#u"�@^��r�@^��v��@_ጃ/�@`d,��]@`�p�ׇ�@aN���        ?��ۧ�e�?љ�\��4?⎌��'�?���C;�?�5�	Am@�D�@��M�K@\�!�_�@Ot�i@Jp��r�@�v���l@Eh7~�@"���|@$�%z���@'�oaK�!@*��d~8@-�hlg�f@0k�����@2�]6�1@3���"~@5�F��\@7���ֻ@9�4��F@;�G�ș@=�ܶlÄ@?�8�
�@@���By@B�qqm7@CC�C��@Drt����@E�~e�@@F���M@H*�����@Iv�Yc�@J�۝Zå@L -��G@M~����X@N��iA@P'��a�@P�j�1�(@Q�/ZJ-@RZ�� �@S��-)L@S�Iƹ7 @T�қY�1@Us:�R@V@|��c@W�|�qq@W�u��?�@X� TuW@Y��+��C@Zl�� �6@[J����@\+ �Kk�@]V����@]�/OR@^ܢ���U@_ǩ���@`Z���,�@`Ҩ]v�F@aK��f@a�u�ʚ
@bB1t)?�        ?� �2�?�`�nw��?���G��?��D^z
�@e�Z[�c@U�k�N�@A4�9k�@n�:�a@,|'tB@!����>o@%�sz3@(���n�@,���4z�@0^oΫ�s@2�8[Lu@4��ٮ-�@7(�Sd�q@9�{kVo*@<.�Qܘ@>�)��@@�V�̈�@B4�cR�@C��h�@E+2�W�p@F�`&{f�@HK����@I�ҵ?h>@K������@MI�]G1x@OI;�b@Pg�_VO@QOb����@R<Lq;�*@S-�&�q#@T#�FH�o@U9XJ�D@V1�@W 1"1@X'���jE@Y32Q�9@ZB�K�%@[V��U�W@\n��U@]�bT
oq@^�<��@_ͫk��@`z�� �1@a�n��@a��g��@b@�M�87@b��n.�@cx����E@dL�omY@d��rx[J@eY�:i��@e�ivh�"@f��ך�i@gIˮU�@g�i�w�*@h��X>@iHc�d�@i��E.t�@j���D��        ?�$"���?���R'?�.�(P��?�H�/,?�<���?���n��I@\	�7@�ٛ2Nl@ L\ϡ@q+�4zO@�HL��]@ޢ�Qe@e�ʞom@cO6�@!�f�I@#Cq�˕@%4R��@'mC�X�@)�|�r�1@,pR6N3@.��N��@0�Nb��o@1�{�J��@38$~�R�@4�l2�$@63eO9�@7yJ�w�@8�>��3�@:{���Ki@<
:�^
@=�;�#@?@)U�~@@s�AG�'@AK��"��@B'q$�b�@CH�ݴy@C��0�=@D�ƼeIN@E�V6G��@F��⟊�@G�աP��@H��쭔�@I�,��z2@J�L���@K�j?@L�H�0'@M�D��a@N�bţX�@O�%
E�@Pg�k �j@P��9��M@Q@�@R��0B�@R��P�HX@S0ͯ��P@S�\�Gc�@TY�y�/j@T�F�J�c@U��Z��M@V"xП�@V��tF�@WZی�^@W�Wͩ��        ?���N�?�4۴u�?�����?�Vb��c-?��s��|�@��
�E@x��ߗ�@02��@ղT^��@�{��@iH��\@ ��/^@"������@%nys��;@(U��Fg@+e�Z�@.�'?R�v@0����g;@2��F��@4�r��<�@6z[�zv9@8sF���g@:}��e�L@<��Z��@>� x��@@�y�ܥb@A���ĵ�@B�f`�@D�x�ܸ@EOě4^@F��3E��@G�]{��	@I;z����@J����?l@K������@Mi�$�$�@N�g	�@P+�"���@P�"���L@Q��|_@Rwq�0�@SBi�S�@Tp+�$@T�G��Q�@U���̆@V�@�3Z~@Wg�+b\�@XE���2$@Y&�w y�@Z
d�T�@Z�6��&d@[���/@\ǨÒ��@]�7b�@^��-��i@_���Ǚ}@`KfU��@`�¢���@aGy�6�@aǇT��@bH�| �@bːW+?U@cO���U"        ?�k��y?�;2o��p?�+� q�?�#=#���?�����'�@ ��ژ;�@\19��@�h@ь	@곒�;�@���"@#FU;l@�����@!��+���@$Lęd4u@'�y�P�@)�8���@,��u%��@0���nz@1���B�@3cC��!@5)\H'�!@6��w�H@8��е=t@:��X��@<���+#�@>�L\ty@@�9�e�@A����@B���z�@C�!Cy��@E	԰l@FN���W�@G�"���L@H�Dz�8@JM���@Kb����h@L���j�q@N`n�q@Os"�B�r@Pl�$�d�@Q#EM~�@Q�/����@R�S�Ӫ@SVš �&@T3L�F�@T�UK���@U�"]�{@Vl�U�jC@W8�,�3@X+�1�@X�AE���@Y��5�;E@Z��_�!Y@[Z�X�@\4�&Q_@]�~ę@]��r�_@^҈�:�#@_�8%�x�@`N	��)}@`�
�>�@a7��\�@a�6;��D        ?��曂��?ݘ�=�?�a$���?���b16H@>刄��@�����A@
1䮒�@m4�&�x@c�K�"�@"sb��3�@%�]�94�@)����@-���2+F@0�&�inX@32�vM��@5�]����@7��B�J@:zC>7mn@=%H��@?��{}5�@ANɂ�,@B����/@D>F���@E�ecߏU@GY*�8@H�h� �@J���%�@LO�#���@Neb���@O�����@P�C`�@Q�{q9@R����%�@S�O��b@T���R��@U�q���@V���&@W�eƌ�{@X�h��"�@Yñ��y@Z�-��i&@[������@]�R?f@^.A[�o�@_R�ĽD�@`=�n��^@`�-���@alR����@bq�f��@b�r�̺�@c@Q�l24@c�	[��@d�����+@e$�_��@e��8K@fq�-}�@g��� �@g�%�1�@hpM|�"@i(����@iʹ��F@j~�`@Q@k1���        ?��`D�,_?�*JOk�?�d�RK�	?�Tu>��?�!| �?��TW�8o@ q�ݦ4@��T|Z�@
M�\�w@z�5�@�*���%@φF��@" 1���@���J�'@ (�qE5@"�w�@$�u�@&)z�!��@(Q��\Ԉ@*����\g@,������@/9.�^��@0��S�J�@2�Ƀ<@3_��j@4�z5D@6	�z��@7k0���@8�9s�[�@:D�'W��@;���d��@=<y�nE�@>�+��F�@@(x���@@��d��@A���q0@B��K(�@Cf[j]�@D=�=�f@E���9@E�t9�(@F�l�{� @G�g~1�@H�ZJ���@I�;�>m�@Jy���@Kh�۔��@L[%5n!c@MPk����@NHr�.�%@OC3n��H@P S���@P�cȰ��@Q!�צx@Q�v+��@R(p��w:@R������@S426��@S��c@TD߫�\�@T���ls@UZIRC��@U淹h�C        ?���M���?��f�ju?�f��f ?�5q{皑?��,˂�<@ 3x�~D@���ǭ@�2�@��@]�oA�@%��P3@?�����@��AQ��@!2��/��@#�=x�ڕ@&^�;s�l@)+@�@,���|�@/,�l�*@10\�Gj�@2�Ď��@4�Q:��@6_�4pcC@89�43ߧ@:"�`�4�@<��$;>@>!p�Wr@@O{E��@A,�:{&@BE����@Ce>"�?@D�5˘@E��L��6@F�7��A�@H$�ʡ�@Id҇ٺ@J�����q@K�N,t�Q@MI���V�@N���#@P �l�T@P� 
�N@Qf�ኀ�@R��Yq�@R�E�@S�7���@TVk<��@U�����@U��yf6@V���	�
@Wp˹/�@X=���m@Yӳp,@Y�k�5�@Z�����@[��4�p[@\b��%�]@]>1ޑ}=@^iy[�@^�z/�@_�"6,�@`a�� ��@`��9ѕ�@aISL��        ?����3YQ?�rl����?�g�>16L?�ӽ���?��V�j0@ ��(l�{@�k��@%����e@-K��U�@!߬?I�@m�R���@c�gg�@!�r,v�@$�ʲa9@'f��{�@*RϞ�:�@-cx܈�@0K��D@1�W��m'@3�֏T�}@5��W�B@7^uo�%�@9K���(@;I0� e@=U���L@?q�}�"�@@�E�.�Q@A� ��7,@C��)@D9�61��@Ek��y�@F�Ԓg�@G�m�G�@@I*���@Jwi�[��@Kʓ�z'@M$Ú�@N�� ��@O�����@P��5=m�@Qc�o\A�@Re��@R�#�×@S�����@Td7�k�@U+x,���@U�{�;�@V�8��S@W���^@Xc�����@Y8��5ZG@Z���ɻ@Z���f�p@[ƈe��#@\��rp�@]�I�Ń�@^kl��4j@_R	��ܹ@`�W��[@`�P��#�@a
JH�B�@a�y�� @a�ݪcGc        ?����tw?ۣZJ�O<?�	��e/�?���q�@�c��@
����Ǻ@��wG�@�̚�n@^��ڇ&@!:�,��z@$�zf�H�@(	���@+�M�u�@/��*�@1�D�@4 mo&�~@6f���s@8���}b@;6����s@=�Ni�#@@/�T�I�@A�[��';@B�7��1�@DZ�&vTP@E�*-�D�@GR�6���@H܄��n@Jo/3{��@L
�Z��@M����@OZ�ȏS�@P��@ w@Qe��+@RH
�T@S.^|/�@T�G��@UFW��e@U�V�q@V��cIh�@W�� s�@X�rb8�f@Y�<�>@Z�O���@[�j쉼@\�c��@]��F�°@_t
dR@`�{uٱ@`�� 0�@a"�ϴ�@a�IE�D@b?��=5@b�d�^@ca�V�T@c�8�y
�@d��lɜ>@e�1��@e���J4@fN�f�z�@f�.`�=@g���@h Y"'s�@h�*,]�j        ?�#�+�1�?�d".��?�S?!Ff?�x{�޹@?�8���?���=�|f?���0@p�K&��@	c*��	P@�=���h@K���A@f�w�@�J�N�@,v���@��c�@!�8@���@#�k!��Y@%�m<i�@(�;P�@*;R9Z��@,���@.�d"z�L@0��I%�@1���.��@3(�`��/@4v�;�.�@5̰�f��@7)�;Q��@8���H�	@9����'�@;m���r}@<�v<T��@>h;�B@?�w��@@�؝b�j@A��鱙@BVz�6�@C'B��U@C����FL@D�A �@E��3�0@F�����@Gg���\@HI�<�o@I.� ��x@J�\y}i@K�r`u�@K�Y���@Lߣ��:�@MҙFG�@N�3FY,@O�iPg��@P]����@P�D�Ĭ@Q\3���w@Q�a��E�@R_˽��@R�m��]J@ShE70� @S�O�q@@Tu�R�S�@T���@U������        ?����%e?�I�ٻ#?�!�)B��?�zs�2L?�� �^P@ ����@<��k��@�xQ��@ь��@�P.��@���l�@iJ�D@!���w �@$/����@&�$oR�@)�1n��@,����#@/�' �$@1�]xga?@3D�'�:�@5���g~@6�[a琁@8��u$�=@:�{���@<�E��y6@>���̸@@nu#>Sl@A���s�@B���m@Cſ��*@D�r�=��@F!��`'9@GYv&��@H��'e�/@I�ɚ���@K&'}�=!@Lv�y�%@M����2@O(Ŗ�8�@PE:�J��@P��S���@Q�<%w+!@RhNc�s�@S$W���@S�[�ƣ@T�A���@Uf�5���@V,�V�;B@V�hy&�@W���j�E@X��`�@Y\�͙��@Z.�DX@[��H�@[��r��@\�P��o,@]�\{��@^j�����@_J	fq��@`͑,x�@`��y�LT@`��>�;@anu���i        ?��Dݍ��?�r��kh?�klo?C�?�C#V?��HHo@ �_�7S@�;8Oq@>]@O�T@>y���b@8�O�Ek@�)d,�@2�& ��@"��ka�@$�$[��@'��u*�@*{�-�_�@-��G|�,@0h���@2'��0H@3٪�c]B@5�B��#@7���YC-@9�R��@;��!�@=����+@?��� �@@���ŬQ@Bj�AO�@C@B?�@DoJ j�@E�a�Q@F�i��-,@H&C�/�o@Ip��z@J����@L�{��@Mw���}�@N����I@P#H [�@Pۚu�ˋ@Q�����@RU6H��@SiDN�k@S�{��T@@T�b���@Uki{��@V7�� y�@W��/ "@W؈���@X�
�~��@Y�,6>��@Z]�uP@[:-��]&@\�~�X@\�R30�@]����^@^�^�\�@_�
����@`L;+@`�ƌxq-@a:��Z��@a��T��@b-�B���        ?�z~��K?�wK#�%?�����S0?���s(9@�#���@
yZ�wR@��d���@���H�@6�W���@! �޹@$c�]ws@'�7�"P�@+��ʒ��@/�}��@1��e7�7@3�(�y!)@61�-�@8��b$�@:��#�^q@=n��e@@0`5H@ATظS�6@B�'�l;�@D�Ԑϻ@E��K��@GY��@H���>�@J�gz��@K��n(��@M8�Ɯn�@N�+�4�;@PB�m3n@Qdw�@Q���Z@R�,0֤{@S��C�@T�c&I��@U�A��ln@V|��ԞP@WnAiX�P@XcJ��d@Y[�GHfm@ZW1��]@[U�:��L@\W�f��@]\݇�;o@^d�ݩ>�@_o�%�@`>���p�@`�w��8w@aQeA~� @a��F@bi�F-F�@b����@c�]�4�g@d[�B�T@d����7�@e>qa�n@eӂ���@fi�d��@g�ǭ9@g��;I�{@h4�����        ?�f�1��e?�1Ĉk�?�z&�^�?�C��ʞ?�`���?���Vb�\@$'�]�3@��^=�5@+�H��@qܥ��@��g��F@�.��B=@O+FׄY@�.Wu�@ �U@"���0�@%>��Mw@'CLHU@)���2�@+�3τ�+@.R~ ��{@0i�m�@1���գ@3 ��@4c*�d>@5��k���@75*q^O�@8���w�(@:(��W<�@;�_��7@=<@���@>�O?d�@@7�N�B@A	wb�C@A��\Y��@B��Z"��@C��K&��@Dt�giD@EX,"2�@F>��_u�@G(͛=�z@H�A`@I0��j�@I�� ��@J���s��@K�^���@L��Xo@M��CX��@N�+���@O�����@Py�2��@P�#����@Q���x��@R�W��U@R��G
^�@S!o"l�G@S�8��O�@T:B��@TȈ��6@UXl��@U��h�@Vz��
��@W��~ڈ        ?����?Ҵ*.���?�S���C?�Cq�?�x�k�Y@���O�@�3��@�Tje�@Bm3o@t�?k"L@򼄵:@ w�6@#0�E@%�X*J�$@(ځ���@+��ߥ�.@/APTHc@1X)�cK@3#�3�M@5 �Éh�@6�cÔx1@8�+F���@;�z3W@=/?ή�@?f��\Gh@@���Ҫ@Bo���@C9MD���@Dv=Հ�r@E� ��Q@G�SLof@H\@&l|�@I�@�[V@K��)b@L��gd��@M����|@Oq�D���@Py��2L@Q<�c! @R��d@R��6�@S��KL@Tl[_7�@U@gٽ}|@V��gd+@V��G�@W�L�p��@X����y�@Y�|IU�@Zyq݆$�@[b��ҽj@\N�H�hz@]=�H�@^/��/z@_$=<H9@`��o��@`�ӱ���@a	5eޚi@a��6��@b	�O>��@b�D���3@c��*Ij@c���^        ?�x�Iէ?�RT����?�F&A�o�?�P�ZȠ?����#�x@ �byw�@{o�1��@�we�`@̋��h@���,@-�E�iA@��&�@!�1g��@$kiW��@'*�|P�s@*��VN@-�X��7@0"���@1ʮZ��s@3�}���@5L�A��@7&�ڐ�a@9[�X�j@;	��M!@=EBuC�@?)��tn@@�$�t
@A�Ҁp@B�%��B@D�8�o@E<,�߻=@Fri�s�}@G�S�V��@H��F�ݹ@J<��I@�@K��ɏR@L�#M�@N@��/��@O�_�ֲs@P���M�@Q=gAb��@Q������@R���Y�@StU�Sn�@T6�˩@T��3�@Uú�Z�@V��@WZ��$��@X*g��c@X�Jiy]�@YНo�!/@Z�X����@[�s��^�@\[���@]9�5ތ�@^�a��@^��Q��k@_�rt[��@`c���5@`�i�C@aM��1��@a��"ގ        ?i�y�?�Ãܠ�?�%ӤA��?���-&�
@���]>Q@��L���@�O�)�V@J�$�D@xpܙ��@#l초]@&¶�ch@*�	]�'�@.՝`���@1�t�@3�ǤQ�@6]����@8�P`���@;���0��@>I�d��Z@@���^Y/@B�73d�@C��
��@Ew��\@F��6mA�@H\�3���@J[s���@Kȉܖ�@M��!K�@O]�]��@P��yJ2@Q�o�@R�_�=�@S~@��s@T}�B��@U�n��}@V��E Zg@W������@X�e��|@Y�����@ZӁc8	@[���FP�@]C�U��@^4ZҮ&�@_\*�h�5@`C��i@`�\:�@at�����@b�ȗT�@b����W@cJ���R�@c�EE|�@d��>�1�@e0</��?@e�-� Q@f{�}��@g#�e��@g�E��i@hxV96\@i$�@&��@i��?j �@j�c}	��@k3MR?��@k�L)r        ?�O�4��M?�0+h�< ?�e�X?�~�Q��?�	
P�q?��`{��M?��ɰ ��@OP0��@	.�fk`@{�φD�@,܁�&@#��/'�@^���@���qQ@ZC�B�
@!��@9�
@#~E��o'@%�d�ߚy@'�ha�'@)��_s!�@,�I�@.Tw�ϗ)@0Y�I��@1���0�@2ќ�;��@4E��a�@5h�N#S�@6�S��7@8a2��@9����@:�ps]�@<a�����@=�l	�Q�@?[��K��@@q.`�@A7�N���@BLy�7%@B����Z�@C����>�@Dpa0��@EFE�4Z@F���	y@F���@G�b�6�j@H��yL�@I���޳H@J�>��w�@Km�s��@LY�E�m�@MH�$@N:Q��:_@O.qMV�@P���u�@P�4�v[�@Q���@Q�?�R@R�>t,�@R�=2�6�@S���@S���Q�@T9g�Ǜ@T��6�l�@U(N�        ?�8�lj?�TEgD�?�+��$?�]���?���`;ep@ ��syh�@N1��q�@��p5�W@�yxʣ�@���Wx@3�"u@�w�ۢ�@!�&t�@$L��K@'�B@)���bP.@,���[.�@0"A��@1�~��n@3f���@5-b�@@7;O[��@8���dd;@:�-w�Q@<毆
�W@>�,Ԅo@@�.-�@n@A����
�@B���D@C�̩�Q@E�A�@FQ	W"�?@G�)1��@H��\{}I@J��`$�@KdZMp��@L�
����@N�#]�I@Ot�")B;@Pm�ؓ3:@Q$30�@Q�wq>�@R��9`;�@SX�z/�@T8Qn�j@Tު��M@U���c�@Vo�̇?T@W<���@X*�!�	@X��0��@Y�	�=��@Z�����@[a	<�"�@\<���y@]��B�@]��,�|@@^ޝ^�\S@_�
�+��@`U�ʪN�@`����	�@aA>��N@a��x�^�        ?�΂a��?њMz�?��R?�ڕ���n?�CӒ��@�N��	@�^*��@w;����@aV��L@b��,@��?N��@l�_U��@"8G�7s@$�|�C�_@'���E��@*�aa �@-���Ǎ@0��yx@2;��@4����@5� I=�X@7�Z�q]@9�|���@;���r@=���V3�@@���GZ@A i�*�Y@BD�
�F@Cp�����@D��F�"�@Eޤ�j�@G u4�.@Hiqm��H@I�]�K.@K(лL@Lm��|�A@M��E�%@O<�,Q�@PV����@Q��7�@Q��*x�@R��:�@SY&z@T!25?�@T�Y-o�@U�pP�?�@V�l؜�?@W_D��5@X5����C@Y]��%�@Y�(Q��@Z�h�I�@[��
��@\�}Rw%@]v����@^`#4��@_K��M@`'Ide�@`���<�v@a,̸�e@a� ��@b?��\@b�6&�*f        ?�g����?�K�t6�?�:6�M�?����XZ@��<�-a@
K4!I��@��� �S@������@�P�}@!�26q@$Bi���Q@'�c���@+l=L=D[@/R�
Eo@1�bv @3ۓ�Yݷ@6�SD�@8mN\�q@:�
O�s@=Xw<@?��H;�L@ALK]�@B�y#@D̈́�@E�Z���@G��b@H�b�o�@J����R@K�Ir}�@MI ���@N�T�
�@PO�b<��@Q+���F�@R6���@R�	Z��@S��̴-@T�	^���@U��ѹ"+@V�
 ?@W���VA@X�Q�W��@Y�46�H@Z��9��@[�G2$�!@\�e��@]��J��@^����}@_¦���_@`ku1�g~@`�0^t�\@a��i���@ba	e�@b��(~�<@c5�0�@c�>ޫɒ@d^:��t�@d����e@e��ֻ@f&	���@f��� @g]?�qS�@g��ݏ[r@h�*><��        ?�k1-�6?�O����?ډu����?�[�K?�#�ϼݬ?�h�`m%?��τ�Tm@q�o)M@	Y� %5\@��8']@7ϱc6�@I��q��@�{����@�-h���@��w�]@!��=�'@#���<�a@%�US�f�@'ф!@w=@*�Л0�@,G�IE�@.�Mp-�B@0�
�L{@1�i���@3�DU@4P�c��T@5�ҰT�@7��ނ@8f���19@9�Ɂw!�@;F!��@<��M@>B�A�5�@?�n�YL@@���jA@Ax��V5�@BG��"�	@Co�/�F@C���[V@D��V:�@E�e�,��@F� ����@Gb�@��@HGt���F@I/=!�?�@J��3@K��i��@K�l
��@L��\#"�@M�sfh*�@Nۿ�z1�@O��z�1@Pk`g��6@P�2�WL�@Qna֝�@Q��}>�t@Rv�#BI�@R���HJ@S������@TT��A@T�p$��@U"�S|+�@U�x���p        ?��X�G�?�R�j��?�,!���c?���F_I?��̮Z�@ �]x@OW���@�{�?3W@���my@ɱ��	@�� P�@��\�&�@!�z˃�a@$S�Z���@'��P�@)���ы�@-b���@0��	� @1�"0䜁@3z{)�@5D����w@7 �ʦ@9�?��@;�=(�@=�A�C@?0���e@@��͚�"@A��Q}+U@B�zj[��@DX���@ENh�@F����,Q@GɤWFv@I��1nF@J`@�do4@K��Q{Ӎ@M[`�;�@Ns�I�!o@O�\�A>@P�p��ρ@Q_��@��@RY�-X@R����@S�'�
�@Tgg��-�@U0|�-��@U�Z�z�4@V��d���@W�A��sT@Xp4����@YF�-U�@Z��^�x@Z���<ܭ@[��,I�$@\�|��+6@]��d/T@^�!8�@_j�^��@`*��,;&@`�پ9+�@a;��&�@a����^�@b
S���X        ?�|�4�K�?�\	�g�)?�S��p�Q?�l���0?��J���@ ���{��@�.��C�@��b�@�:U`Y@b ��$@X��o�h@��d�4�@!��$T�@$���@'V�
!	@*A<���@-P�eͬ�@0B*���@1�[˕($@3���z'�@5v�0x�@7Tcʣ�d@9A�à@;?>���u@=K��w�@?g��|�D@@�(9η	@A�l6�@C	cs���@D4�C}@Ee�Nq�@F��:UX@G����]@I"M;sDb@Jn.6;k�@K�[�ntM@M�@Nw$�rZ�@Oۃ@�",@P��ԕ�@QZ�Ť2@R�u�1@R� I1�@S�Z^5��@TVB�|�r@U�5�t�@U�㉪��@V��N@W{�q��e@XKPO@@@Y^ǚo�@Y�Ҟ��@ZȣD���@[�ȗ�~�@\};.��@]Z�Vj1�@^:�,���@_W�u@` ��ˌ�@`t	5�/R@`�b�	@a]��c@a�:/���        ?���s��?ۻ>���g?�+^�>��?���d$A7@��\�2�@
Ǒ*x�v@�����@�$8�*�@�jz]@!c���%@$���ޯ�@(M�@�@,hwӦ@0�?�-�@22�Vx�@4l��wMG@6��<`5@9-ڜ�*�@;����@>O�U��5@@�٦�k@A���S�@CW���k@D��t�@@FWY�ޏ�@G�P�@I��з@K$p��w&@L���`ݾ@N��ֹ��@P$j9+!�@Q	ٷQ9@Q�Uq�q@R��XK@S��e��@T�n�_7 @U�8�};@V��X�!�@W��a9�@X��4�~�@Y���!@Z��0�L�@[��Zig%@]�O��v@^*FH�a@_Hw�9�@`5F+��@`�(ZJ!U@a\��P@a�[���@b��	�ki@c%�v�̧@c�j�)1�@d^�5���@d�>���@e��:f��@fA� 0x�@f���@g��P��Z@h2�	�@h��Q\_@i����v�@j2�R%D        ?���s3�?�Z�O��?޷r!��?���	1g?�|in�?��;t�Q@Kn�#�@P][�=�@�0���@f]K�e@�a��+@��� I@���q<@s�V�,@!��ތ@#�bdm�d@%�<=�@(>�\<��@*����@-�(��@/�p��j@1�j�xw@2`���Z�@3�N'�7w@5%2R튋@6�,,_��@8���@9���P�@;��Q�u@<��?y�@>GgD@?�ou\J�@@ʻ-��J@A�/F�@B����O@Cb��bZ�@DG�ʦ#�@E0hJm�l@F�0IH@G��&��@H �?�@H��2��@I�Q���@J�@ �l@K��q�2�@L�(
� @N �l��i@O�׽5�@P	���@P�TA[�@Q"=�7-[@Q���7�?@R<�ȋf�@R̗*�4�@S]�0�X�@S�^y�f@T�$�@U��׃#@U�_/%�@VKH���@V��Wn@W�����@X�4�        ?�$g�ǲ?�v����?�Q�6\�_?�S�j�?�Ҁ����@ �����@r���@ٚ�]j@�y���@�;��@$3l=&�@��厏@!�)}r�V@$f^#x1u@'%�}���@*
��U@-��׷@0 jM��@1�j��@3��G��@5I��T�@7#E�B��@9�#�W@;R�|_�@=e˹tl@?$s���y@@�k��j@A�:��@B�tX�ķ@D�od׈@E7�\2�@Fm�c}]@G�B#���@H�dM�<@J6���\@K��Z<�@L�,vh)@N9�{��@O��o
�@P�5:Ϛ�@Q9]Qm�@Q�myj^�@R�[Rm�@Sp��ۥ@T2�y�&@T��P`�@U��Pɘ@V���d�@WX�]JL@X(L���@X��Bw��@Y��cx&@Z���
,�@[��]���@\^����@]=�h؇@^^M �@_a �@_��j|ہ@`i>��=�@`����0@aUj����@a�1Q�VQ        ?��Ӧ��/?��e�%�?�G �
?����v?�}B*�D�@I#T�u	@"/Y��3@�:]�_\@�w��$@��2��@v�5@@�|>��@"v4|^�@%.��@(�ӘYi@+���O@.K��X{�@0�Y����@2� RN��@4d˵���@6J�R �@8A��܋6@:K�i	\@<fX5&oL@>��,�@@hm��]@A�� ��f@B����	�@C�u�u�7@E7}{pK�@F��yb@G�g���@I'�0�@J�u��6@K�mF�8�@M[圔{q@N�ɧ�ؗ@P'�r��?@P��o4b�@Q��\�~�@Rx���ŷ@SEٙ{�@T.�x7�@T��$`�@U�
`�#@V�|m��@Wy9a���@XZ7W�$@Y>l���J@Z%�8;&O@[V��5@[�����@\�t���@]�r��@^�<�@_�84g)@`g����U@`��զ�i@aiSU�Y@a����@bp!�q�@b�Ƀ�#@c|� z�+        ?����Z�?�dx�u�=?��Əx�^?��&���@m��<@byD�@Js�f�@|-���@?�&�(o@!�z"b@%0��~��@(ڠ���@,��Ũ\@0q�;���@2���٘�@4�߿J�}@7L�O�0@9�%���P@<bŲ�?�@?>FVt'@@� �ub1@B^H,��@C�:�22�@Ea��$�@F�BGh��@H��g�@J:md�75@K����/@M�<�
�.@Os3�rR@P��g��@Q����O�@R����З@S{z��
@Tx685�@UyV��x�@V?1D �@W���,{@X���m�@Y�%c��@Z�ژ��0@[���Ka@] T���@^$�F���@_M��_m@`=Jd�Z�@`����(�@apOx�i@b�4(��@b�b��x�@cK�z��@c�cf�)y@d��9	�B@e932��k@e�6<Ғ@f����!�@g7Ƞ�U	@g�Akx�@h���x x@iG.��`�@i����j�@j���rX@kfڈ��=        ?�0�X�?ʟ�����?��%��]P?���[�?����
�?�8�aJ6@ ��.}m�@7ܶ��=@
ARy�_@��t4�@��V޶�@����d@:	��ט@��d8�k@ .<�~z@"H�HM,@$I���@&!��8��@(C�WBd�@*w���l~@,�}~}"@/w<��3@0�jw@1�5�}�A@3>S0&d@4�L�s=�@5��U�O@79;_~-<@8���W�@:�q$@;v��'�@<���d%@>n'�ZR@?��{I@@�ZH�ͻ@A���W�@BV�hؘ�@C'7��k`@C��>�@D�Q�py�@E��I6@F����]v@Gg��	�c@HJ�z�j@I1��a�@J�x��@K hܚ@K�����@L���K@M�DY?F=@NҾ��r@O�D�@Pe�y�w@P����'@Qf?L��@Q��bx�@Rl�
f�@R�Az j�@Sx�c!C�@T �{�zQ@T�D��M@U��sbb@U��ԡ        ?��q2��?�� �p��?�vԖ��?��H�&�?�6W���@�6�A@��y@K[	@A��9&�@7en�y{@����H@$^3D7@"
�f��@$�4�Ȗ@'qۉBP�@*^,/�f@-o),�k9@0R�J7@1����3@3�5�KNr@5�A�f�x@7g�-kX�@9V�a��@;UFm�6p@=c�	i1�@?�F|e�@@�~�|4@A�ӻy�i@C鷾�@DF)�6;x@Eyuc���@F��� 
t@G���_�@I<p�^��@J��O�@K߇�&(@M:�q+�%@N�'$��@P�@3&�@P�� y�L@Qr��A6�@R/�zgR=@R�[�g@S�̴��@Tw�Ŕ@U@ :�2@V,j�J@V���j@W���Fm�@X}4� @YS#N�@Z+��r�k@[����@[��#_W@\�(���@]��2E��@^�GR�3,@_uH}��@`/���1p@`��q��@a9n�6@a�˯�k@b�sI#        ?�L�|�H?����.?� 8��c�?�Ӫ�e)?�u3�|�o@ ��h���@�����@e�k�%r@� �q�E@�~���/@��!)��@(���BM@!w\4���@$ �I�@&�(��PB@)}��!E@,p�7Zk@/�L:$	@1]EϤL@3��!F�@4���v�@6��?�@8c"�t�x@:I�u�M�@<>@��@>@�Z��O@@(V�v��@A6�V[�@BLuYp�@Cgj���@D���&�@E�ɚ8o�@Fޅ���H@H&`1�;@IK�[Y @J��!Vo(@K�s{A��@M�Ȧ	�@Nic�b@O�b*��@P�MS{�@Q;�K��@Q�+ۜ�Z@R����;V@SY�����@Td��K�@T�1m���@U�HJ�c$@VM�J���@W(��D�@W��p�ۿ@X���u(@Yd��h��@Z/�sP@Z��z䴸@[˟t���@\��j��@@]o��|@^DW) vW@_c�AT@_�1��@`f��^�}@`��j�        ?����;9\?ۢ�M�.q?��~�ƾ?��!xo6�@�Җy@
��Ȕ@�d[m
�@����>�@E�d�g@!)ؤP^�@$n�����@'�O��@+��)���@/���@1ۊ*y�@4�e�T�@6G�N��@8�e��X1@;�|�ӛ@=�;̖:�@@&+2�z@Ar�y�@B՘rzN@DB�̒Cf@E�`��*�@G9څ�
�@H���Vŏ@JV��4�@K�8R)�@M�_�!$@OFB��S�@P~]VM��@Q]�E�@RAt��QA@S)3RU/@T,�B�@U��I��@U��w��p@V�>����@W��F)~�@X�J̶k@Y�,�xP�@Z����G�@[�� SQ�@]�C�@^|�	��@_4�H�s�@`&�-0>@`�1��P�@aE4�<m-@a���qp�@bjm�8�@b�����@c�w$�̕@d/7��s@d�4���@ee:��N@f��5Z�@f���ۖm@gBX��J�@g�Y7�@h���;YR@i-���4        ?���P�?ʕq���&?��>'�3�?��w֣F?��B�N�?�8A���v@ Š�ne�@q���v�@
�tδ��@G��@!����0@])1*h5@ˌ��6@j�)�!�@ �_�j}�@"�
��C)@$�����@&�`&�	@)�_P@+e �W�@-� _��@0 �tKQ@1f)sO��@2�u�(�@4�H��q@5k� ���@6�����@8D���_�@9��i�Qd@;?�J�<@<�a����@>Y�����@?򤉫��@@ɴ�v%�@A���@Bu�~n1@CQn�t�@D0�?��`@E~8���@E�٨g�@F㳴�%@G� �r6J@H�����@I��c�^*@J�""���@K�ž��X@L���˅�@M��A���@N�Ә%��@O�L�'�@P^2bq�@P���j�>@Qm
'T�@Q��_��,@R�ї�_�@Sb����@S�a Y��@T+��Oű@T��:c}�@UN��W�@U� i�@Vv��%h@W�r���        ?�n(��P?ђ[��o?�h����?�y�Tj".?��r�T@ �Me�f@����@�x[@
�8�@
�=�$[@R#���@�!�]@!��2}&�@$��3dkr@'RlA��@*=�G�e@-M�Y�.:@0AZ�d@1�|�%4�@3�	 ��@5y�Vd�@7Y�@�@9H����;@;I,�@=X�ՉD{@?x��4l�@@ӮG���@A���p�@C���(i@DF�[��@E{aY���@F�2�)9�@G���X-@IC�!��@J��=��"@K����@MHo�I{�@N�j���%@P`�Bͺ@PîF@QB�@R=���@R����sS@S�lYL�@T��H 5@UU���$@V"��@V���6��@WĨO�!E@X��b�B@Yr0�Q@ZL����@[*uP.y@\
����@\�C�I��@]ҍ�M�@^�e�tS@_����SM@`Hҗ~�l@`��P`N@a9f#���@a��k���@b.��vW        ?�n�,�%?�2r�,Q|?��Cz?��6�4j?��7a�Gg@ � ʻ�m@J�Xq!~@�3�U8@ܰk���@����@��N�@zI���I@!�W۩��@$9�<�G@&𺑩�P@)�Ѫ�|@,�AJ|Q�@/�/_o��@1��Fp�@3H��/T@5
�t�v@6�I��}3@8�e�&��@:��!�P@<���S{@>��~�8@@j��O�4@A���[@B�v���@C��3#��@D���Cj@F�����@GL����@H��c�˜@I�e��@K�\@Lb��9�@M�.�F�@O��ȥ@P8ˮu��@P�Hْ7@Q�B��V9@RY�f��j@S�F���@S�\���-@T���� )@UU���x@V���'�@V���!gs@W�L��@Xzp��`@YIM5Π@Zُ��@Z�Lj�g@[��e�@\�M�S
@]w��^u�@^T�=���@_3�妕@`
���!@`|;�(Rl@`���aW�@ab�C���        ?�pF���?��..!�?�}���x?����
�@��6â@�l���m@�F�t@��%�@�Y{a@"�n�_@%~e��@),7G��@-��k�-@0��KŢ2@2��B(F@5+*Ug�@7m���j�@9�-�@<uNO�`�@?�~p!�@@�{���)@BUߩ"�S@C��TB|�@EHFtFb@F�ӳ��@HcT�nR@I����w@K�f��@MT��{�Q@O_H@Pg=��`�@QLqM�@R6
(X�@S#�y2��@T+����@U��O9@V��@6@W��~�^@Xe��i|@Y�{u�@Z����$@['��@\:�D�@]PK7@^i���l�@_�ž�@`S��*��@`���2�@ay�׬!>@b�`u�@b�Nyd@c>���@c� �'�@dt�g��@eQ��q@@e�:��@fQ�1�ɒ@f�á�@g��Zܞ�@h;�>Q�@h��=K4]@i������@j2��I@        ?�}j�� ?�����?�,v���.?�,���7?��@���?��cC��@ h$��D�@��"��@

z�Q��@���P�a@�*Cȵ[@��� @E��@�֩�Z�@ Fǻ��@":*'<95@$B�v��@&` d^�)@(�w'i�@*�PCyJ!@-./�V�@/���>\N@1
�)	�v@2Q��>�V@3��C�se@4���o�@6[�ME��@7��管@96�S!�@:�2�*O@<1�����@=����@?L�R<�@@rD�l�@AB:O[�@B�D^q@B���@C��� �I@D���@E��k��@Fm�L�@GU��(=�@HA��Nx�@I0��8@J#D	�_�@K ���,@L쥨�@M���O@N)G���@Of�DLu@P
WDf��@P�})�
@Q ��w�@Q�? ���@R#���A�@R���P@S9Q���V@S�5��u�@TT�F�:�@T�:�Es'@UuV	#��@V�U���@V����p�        ?�Y�&���?ѐ��b�?�i��
�o?�{��i��?����@ �-��Y�@�c���@��׏,@�19�@�S�_@A\e�x�@�Z�}F@!��Ct@@$w��L�@'7a@Y�@*Z�do@-$�����@0(��7@1���HA@3�#�Ra@5Pҙ[xO@7)ۢ��@9�H@e_@;VH�e@=+�l�t@?*	��G�@@�֔�@A���G?�@B����@DS2#|�@E:k����@FpJ~"$�@G��:Q�@H��9 �[@J9��Z�@K�|��t@L߽gu@N<)I�B�@O���1	�@P����@Q:���C@Q���R�J@R����T@Sq�d:��@T4n��Il@T��}���@U��T8@V���0�@WZ(N9��@X*-y	7@X��hƺ�@Y�ް�-�@Z�zq�}�@[��1�ME@\`י�@]?K �+@^ T�w@_�]��@_�ӫ�@`i4aUA�@`ފ1�}@aU���h@ạ�<        ?���	4(�?�xy\R?�p�)�?���{?��H�q@ ���2b�@���q�@/��B�g@2a���f@&y��G@q.��0D@���@!��ixX@$����x@'d��}@*O���9@-_�2��@0I|��@1����1�@3����/@5~$�m�@7[�1
�1@9I�9���@;GJ���@=T5l�G�@?p���ؤ@@��E��@A�ׁle@C�>]�o@D:#�L�(@ElB�R�@F�7rQK@G����EN@I+)JY��@Jw���@K�@ @M$�v�l@N�;�b��@O�/�3@P��G�ĳ@Qc̛���@R�m��@R�H��_+@S��L���@Td��U�@U+'��P3@U��c��@V�^���@W�v�%$�@Xb,�u��@Y6w�e>+@ZPfI��@Z�]|�@[1�w@\��;�|@]��u��@^d���%�@_Jk0��@`3�$uD@`�`���]@a�8R{K@a|;���@a��h��        ?����(m?�^���&?��&!G�?��9�0�@f��rҖ@T�dh~�@>@�"�~@gnr�n�@6F�m@!��6�(@%;5��@(��I�Z@,{����@0D ���@2d�%���@4�(�1K@6�*j�9�@9]7Q2�@;����@>w�G���@@�Kom@A�㕑2�@Ca)��7i@Dך��AA@FW��ov�@G�Z!4@Iu��x�@K�����@L��6�,@Nhq� �@P:_@P��-�e~@Q�Cї�+@R�F¥��@S�|���@T��ך=�@U�D�T�@V��pY�@W�+�W<�@X��gL��@Y����Z@Z��?C@[����~�@\�U7��@]ʝDɞ�@^�X�@_�!_\n@`���首@a��k+@a��dwV�@bGR�`	@bݣZ�u@cu���7=@d7�N�@@d�s5�YS@eGJx=29@e�~�ss@f�����@g'P��[@g�r���j@ho ����@iW�LM@i�s�6,        ?��of�[f?�rRGO�?ܻO���?�u6�ŮX?�X-U�?��Z�9}�@4њ���@�Aas�i@1�T�r\@p]ut�@~W���D@����@3��3�@���c@ �b4@"�"���@$����v�@'��ɜ@)@4�I�@+�;�fl@-�f~s��@0-;��y@1m�̱��@2�qb�@4����@@5bY�z?@6�m�hL�@8,��q��@9�7����@;GG��@<��|q�@>�7���@?�\3>@@�I]�n@Ak�ʤ�^@B<���� @C��t��@C��>��@D�d�d�@E�k���@F�i�2�@Gc&sR=c@HIW.��@I2P���@J��|@Ke𬼶@K�i�)��@L��A0e@M�$\�0�@N���@O�Ϭ�nS@Pl ����@P�֞@Qm��
B@Q�GV8�i@Rr����@R�X�@S|��Z@T)4��Q@T�ӛO@U�-�@U�IA@Qm@V(^��        ?���ˆ?�ב�O��?��!�� ?��Z�?�Tu!�V@'��U��@�&.
��@|�;w�C@cNB.�@c\ٴ��@���,@j� ��\@"6<�G��@$ߩ����@'���Pc�@*���r�@-����-�@0�Z�+� @262kD��@3���B�0@5�Mo��H@7���D�+@9��k�@;�kу��@=���L�@?�Ӝ��@A#a%B�@B7�V�in@Cb1��!@D����@E̟���,@G�,!�M@HS��Ǉ�@I�h�`�@J��P��@LQo�e�@M�b�eP�@O��ņ@PEZ�y�@P���i��@Q��2i�@R~�eWC�@SBf���+@T	J�	�c@T�'�{�@U��f���@Vo�9*��@WB:|yC�@X��&�@X�����@Y��4��{@Z���a�@[��	�@\l9��)�@]Rޚ��@^:�
B@_%��M]@`	����(@`����l�@`�7ԛ@au�Փ(�@a�ϼ3 @bn�d�>^        ?���:�t�?�a�=8�?�S�$E�W?�f����?�� 髕@ �y�L*@�";N�I@��y��@��?w�@�U}�_�@B�o3@�jaP�@!�6c:@$|��Q�@'>��� 1@*%�G��@-2���P@00�7�s�@1�[��L@3��^:�@5`C	V�%@7<���@9'��@;#�u"�J@=.�~;B\@?I�i�R@@�-/',�@A�"9{~5@B�G���Y@D"|B٫�@ES�����@F���z'm@G�B鮆@I�h-�'@J[Pb�\@K�}J��
@M�W�A�@Nd�OY�@O�}J,M�@P�-��'>@QR�(x�@R�Z�@R�0�eH@S�M^&@TQ<��S@U�u�@U�p���#@V����@W|���S@XNkP@Y"G� Y�@Y�NۧX@Z�|�-[�@[�r"�L�@\��hT��@]m�9y%�@^Qs��3@_7h�Ef}@`��:@`�L}#�@`��/;�@as��A�8@a�����        ?�:��z��?ܬ�!�}�?� �
ɱ�?��)��&@��*�V@�I:���@e7~ �@�L֍NR@T[��Ń@!��p%�@%,�i��q@(ɒR���@,�o���@0U�o�b@2v @+@4�c[�͑@7 ����@9iK�p�@;�Ni(@>}0n��@@�u��<�@A�4�L�@C[ء��*@D��X���@FK3���@G�����@I_��F<�@J�2'�
�@L�j�R%�@N@��*@O�pծ@P��]md@Q�v�R(�@R�Ƞ�H�@S����ӡ@Tm��t�@U];���g@VPP���(@WF��~V�@X@���@Y>X�Ϯ�@Z?���@[B�����@\J�r�@]T=���@^ax�J�0@_q�(�*�@`BgA�A�@`�eQI�@aY�[O�@a狠�G@bv���@c�am�@c��/�`@d+�<-��@d��zF*�@eU_���Q@e���|Z@f�� İ@g��"�@g��L�B�@hR[��@h�lb�E{        ?�V�2J6?ʺҩ�N?�D�� "?��;�8�;?�C��&�?�_ʒ���@ ��Y�	E@��o5}�@
����DN@3}�@>	�C�@~tC��@�_�N�O@��ۆ�@ ���_@"���j��@$�Ƶ劉@&�N�3@):��}o@+��E�@-�,Tj@0;�
��=@1���EZ@2���H�@4/5Y�!@5�r�U�@6�c���@8rެ~)X@9��0@;tϖ��@=�(/V+@>�#e��G@@G�ʛ@@�u����@A¬�^@B�����@Cz^nΚ=@D[����<@E@�=g�@F)]��;�@G�n�$�@H$ ���@H�;�h�{@I0��@J裮
�@K��{�=@L�o�}Q=@M�F����@N�_3�K@O��Vղ@P���k@Q�ɌZ@Q��\&C@R"b����@R�k��V�@S=�a~�@S�^���@T_�0�@T���v9@U�Mf���@VMhC�@V��#T �@WM����v        ?�q[e۴?�m��I�?�P��̇|?�����d?����@��6��@�0+��@u���)�@��U��!@!a��:�@�s ��X@ ;�t�@"ы"I�@%��C:e�@(z�q�1@+��d��@.�6�� @1O��(@2ш�t�q@4���H�j@6��<?H@8�y�Up@:�
��@<�Fo��9@>��͕��@@����e�@A��
��@Bжnm�@D�:�@E>���1�@F��|�U�@G��.�@I!J�+@Jq'�VnZ@K���}��@M3h0�+V@N�l�	�Z@P�IT@P����)@Q��|��@RE��ڲ@S
C�Y�>@S�y8�@T�����@Uk��*u@V<�2��O@W�ݧx@W�k�M|@X�����D@Y�EPN�@Z|RœV�@[^a\�@\B�l:u�@])���H3@^u�>�{@^��<�[L@_��/�A�@`pA3'��@`�W�=��@ae�"��@a�V�X�j@b`9�N��@b�\s��        ?��.��W�?�j��ɒ�?�]�ώw�?�zw&�O^?���o���@ ��%5@����@�-��@*�t�:�@!fb56@o��*��@�A�=�@"N��'@$�����@'s��ª�@*e)Q	��@-{�VS�v@0[T�n��@2
�	��@3�L�C�@5���W�@7G�4�V@9q�2U��@;tG��ӷ@=�O߅U#@?���K]�@@���-��@B~�
 �@C2DG�Ӵ@D`)ո��@E�_��@F��i!&�@Hb��+@I\�}��@J�Gc{��@Lg��q[@M^�Qʧ>@N�|p���@Pi��@P��g�{@Q��NY�&@RD{6K�@S8^��@S�-��|�@T��d���@UUl0%�@V ��[	@V�~}z��@W��?pW@X�����@Yg���7@Z@"���@[�Hǜk@[���~/@\ט���@]���֊{@^�'�Tu�@_��"���@`7���+@`����_@a#���a>@a����@b�n�        ?�xU
�U?�!GJ���?��e�\�?�5'^�@���t�@!���k@�[�}ڷ@@8m�a@����@"6,���@%��&U]n@)n�E$��@-h�t�f@0������@3���?@5W�21WK@7�CE�M�@:J�N{l#@<�u���@?�����@A8�!%�@B���Kܼ@D)0]�A @E�Z��&�@GF=�T��@H�gW@J�K0�J@L@=i��@M�Õ�*@O�4I�@Pɚ���y@Q�NE�j@R���&�m@S��va�@T�ޠ���@U��+��"@V��.�ӟ@W�*��!B@X��*��@Y��	�r�@Z�p.B|@[�[�fa@]B�҂@^$�X��@_G�D�@`7�j���@`�]Y3j@ad��� @a�P��
w@b��A�@c6�� 0@c�wXV�@dv�yc@e�19q@e��`G
q@fb�`�ī@g
Uo�?@g��Saׁ@h^�x�B@imj�H@i��էI�@ji�\?̆@kM0|�        ?��;���?�ل�R�=?����*W?�6�M���?��3�T?���*?���,V�@(3-���@	x|-@S"׍S@���s&@��Hd3@N�F���@��F�@Nptp��@!��<� �@#z�}؋@%��;;b@'����@)�;M��@,9�+�@.Un�=�@0Z���@1�ѽy��@2��t��=@4�ge|@5j�$K(@6��� @8�E��@9� y���@:��+�\@<b�Q�I@=ܔ�뛃@?\��F�@@q����@A8N�,S�@B��@B��K)�Y@C����Y@Dq��E�y@EGj�T~q@F 4��`n@F��)�@G�b���@H������@I��'B�^@J��0���@KpX5}@L\(OVRp@MJ�h"�q@N<=\7@O0#=��@PI��8@P����5@Qw^"�`@Q�gX�	@R�D.|�@R��I�O�@Sn�ʥ@S�#�/��@TKt'@T�
{��o@U&6�Z�        ?����F�?�ݮ���?���
t�?�fJ�A?�NĜ��@ n���@����e@>+fGP@�q���@p����@�&K���@����@!m����@#���,@&��Ψ[n@){���|@,s���@/�#�> �@1eL����@3's�q�@4�MvZ��@6�p*��@8�C�t��@:o��"�@<l�D�^�@>y�Q�@@I�*zk@A^t�
B�@By�B���@C�f��r�@DŌ��P@E�P ���@G+�	��A@Hh5.���@I���ɋ@J�'�K��@LC=iq�d@M�BS��F@N��)`�@P)�,S5Y@P��c3�@Q�� ��@RK��JI*@S�d�(&@S��e���@T��X���@UH�BmO@V�H6*�@V�1吩�@W�88�@Xow.��x@Y?Jk�D�@Z�z���@Z�-����@[�0�c�@\����
v@]r44Ε?@^P)Bέ�@_0c-�@@`	m�
M�@`{����@`�4S4D@ac�e_�        ?��I����?�g���9?�a���-@?�d�F?���)�&@ �;��Q�@�0��I@(�|�~@/�۪@X@$�{�V\@p�u��@�&,�@"p��``@$�����@'iP�t�@*U�w��x@-g3����@0N8M1��@1�^׮�W@3��
��O@5��A��@7du��5H@9SGȮ��@;Q���.�@=`D3�t�@?}�q��@@�3�Mi@A��I�8@C��8�q@DC��O��@Ev��=�$@F��=�6@G�%�V�@I82D�O@J���u�[@K����`@M4Fr
@N������@O��ڎ^h@P�0k�@Qm��nT�@R)�@���@R��-��@S��x+H�@To���F`@U7r�|}@V>�Rn$@V�޺J@W�{��i@Xoz
�r@YC��H.@ZB���@Z�}�SR@[�cPf�@\��P���@]�LĞ�1@^r?�M�@_W|�ů&@`~�D�@`�]IPa@a
U�8Ok@a�d��n�@a��-7-�        ?�KL�ԕ?�	��ɺ?�s��?�Ug���@�t����@
8��t@e��΂9@P�r�[�@�s~��@ ٖ1���@$$Q�A@'{�m�m@+��>�@.�wX��@1�Y�N�@3���y��@5��y9�(@8X�=�@:x0�9w@<�|I��W@?r�<n�k@A�!X�@B]�&U��@C�4E�r�@E'k�Lcv@F�jތ�@H�T .7@I��_t�@K",|��@L�-�&@NP&�Ƌ!@O��1�W@P΀�;;@Q�M�b��@R��_���@Sc¨��*@TGK�V��@U.Ll8��@V�A�@W}���\@W���l @X��7o4�@Y�vXK6(@Z�&�-�f@[��D��@\����K@]��kV�@^�d���f@_�!�cB�@`~�k�k@a�I���@a�Ͻ)�@bceh�Y@b�Y�`��@c3�3gZ�@c�`}��}@dRj� �@d�ʘ:k
@ev|L��L@f
}2T��@f��	�\@g6bʣ��@g�A�,#        ?�:����?�����N?���?���.��H?�"�)�h?�nE䥿t@ �Ԃu�@�<UI;�@
����@,�B��s@0���;�@h�A��0@� H%@k&�Z��@ �c#@"����
@$���w��@&Ŋg��e@(����B�@+I��9��@-�γ��@0c>D�v@1O�h��n@2����r@3s�8@5K<�Y��@6�Lw�ϟ@8�fP�@9�6=�o|@;�;`��@<�Be^��@>#��'q�@?�j�`�@@�m Z��@A|Z�j��@BQ𸉜�@C+"Mq9@D�v��@D�%,��@E�݇E@F��c��@G�~[�c6@H�O.u�A@I|e�Qx"@Jp�y��)@Kh<(��`@Lb뀣O�@M`�2��(@Na�V��@Oe���
w@P6`��}@P�j]z/�@QA�(B�I@Q����@RSn��4�@R�Z(x@Sj�Ҁ@S�w��v�@T�����@U-�9d@U�\ �a@V=^T�K@V� ����        ?�dY��K�?љ�fP��?�s$_�i+?��j��?��;����@ �E4<��@�{�V�_@,e��T@R{��;@Sކs�@T<�Z�@�lF.ً@!�;�o@$��֠؜@'Q���t�@*<�YZ�C@-L��?�v@0@P��*@1���W�@3�#�B&@5w=-Q�@7V8�F@9E5�A4@;Dx���@=S�#�a@?r��@@���{�@A�O���;@C�s�@DAS6�o@Eu(J�lK@F�A�!}@G�8��@I:�"Ҏ�@J�U��6@K�H��ֈ@M<��l�@N�����
@POR��;@P���V:�@Qv�t�
c@R4pd-Z3@R�',���@S����[@TP<,��@UH���G@V��J��@V�=�`�@W�M����@X��(��;@Y`~�Ϳ@Z:��v@[����@[���q!�@\���ly@]�f�=�@^�e΋WW@_�ǝ !@`9A����@`�ȫ�_ @a's��ۻ@a�?K᧱@b'W�y�        ?��2/LhJ?�i���V?�aZ��1?�XWC�?��CY([@ �G��=�@�@��S@�k��@"��D��@+����@\v�R�g@��mCN@!��w,@$�^4���@'W���_�@*Cx�o�"@-TC!@0Dg" 4�@1��r�0�@3�!�5��@5|�v���@7\@a�v@9L?��d@;L��q��@=\嵃�5@?}��#�@@�t��<@A�բ�M@C?�hՌ@DK��*�B@E��X�@F�&�p@H�h�@IN����@J�7���@K�U�6%@MZ-3B=�@N��u�%r@P���@PЏkh��@Q�w�>�@RM��\�G@S�%�v@S����0@T�P��@UlG�@��@V;p=�$d@W���s�@W�x �@X�C�cq@Y�ܲ��5@Zr:dAD@[RS���@\5ii��@]���,@^��X��@^�T1|Ϭ@_ڎc�@`e&�ؓ@`�EVT�@aX��DW@a�0{+&@bP�l�c�        ?�U~qW?�� @R�?�dC �4'?������@ś|��m@��fX�@�(��ll@��3�q�@����X@"��m�@%����@)63Jo��@-'^W�u@0��H��@2��W\@5)��1��@7�ό�BU@:��9&@<��J�T@?b��/�v@A2�:=�@B��iYF@@D���@E�"�R�@G!�W#�p@H���b@Jh�=�.�@L漊��@M�}M�M@O�+�w��@P�dRڅ-@Q���)l@R��}���@S��NKq@T���~}�@U�.�1Y@V�1E"<\@W����@X��#*6@Y��U�)�@Z�[UrO@[�'?k�p@]"���(@^/?ϖ@_Vo��{@`@�N�{@`�i��vm@aq�D+��@biq���@b��0=��@cJڝJ@c�J�2�@d���:�@e2�xX_�@e�]����@f����@g+ɝ�L4@gםս�$@h�*�H��@i4l�d�@i�a}���@j�
:!@kLW���C        ?��p�~w�?Ɂ��=C?��";4�<?��Q��v?�I\�J^(?�Dc��w�@ $�i�&.@����E�@	��ч6@̊iF�@m�^��@��/���@ڬND^�@X�t�@ "ụ�@!���R@#�Lm��@&�Ç.]@(-Vc��#@*j!����@,���~?@/9�@��@0�YY�32@2zʔ�@3WR�9�@4�����@6t�/|�@7mn��0�@8�|x�^@:O}*bl@;�RG�<Z@=P�.P��@>�,qR,@@8N��z;@A�(�P@A�����l@B��x��@C��W�{@D_��,�@E>���eG@F!3<~o	@G�h|�@G�5����@Hܞ��3h@I�A�8�(@J�<O�@K��)@L�!&K4@M�Hz��c@N�w��0�@O���a|�@PXaUy��@P�f,�49@Qaܢ���@Q����lV@RqZ�8�@R��P~��@S����{�@T\��w@T�8��Xn@U/q�{��@U�b�@VQ��e8        ?�iN5��?�S���?�*�o�Ε?�@p�k�?���X��@ ����74@K)�@�T��&@��T�{(@����@�"�b@��Q�^"@!�5-u��@$L&�@'	C.�Se@)�	z��@,�{'	�@0f~���@1��R�'@3o���L@58jP��@7Yf�-@8�����@:��X�2�@= �y�@?w�@@���oCN@A���e*]@B��n��@D�k�/@E=|~�[�@Fvu�+�5@G�q�<*�@H�[n�9�@JK-���@K���9�@L��)�k@N\���s�@O��S��@P�͵>�@QTL<ݐ}@R���v@Rғ�,�|@S�IO���@T\�U�9V@U&����/@U�>����@V¶3C�*@W���v�@Xj!s��i@YB��@Z����S@Z��*^�@[���QPK@\�]��NK@]�x����@^�+i��@_sB��(�@`/���aT@`�y/���@a 7/��@a�'��@bG�ȝ�        ?��͵�+i?яl�k%�?⌑Á�?�л�|�P?�=°72�@oa�Wx@�ԏ���@t�tt�@`DB҄@bf��7'@���s�@n��Ns�@":#Ƥ2H@$��� �@'����@*�7ιV�@-ӟuNAO@0��S�F-@2A�y�ra@4	1a�r3@5� ��Z�@7�sa���@9�ݕ�@;��6;>@=������@@��1��@A-{��='@BS���R�@C�Q�s@D������@E�ma��^@G:Y�Z]I@H����j�@I�9�[�n@K5 4��@L��~ny@M�͔s9@Oo�Ï^�@Ps2>��@Q1����7@Q�z���@R�kg��@S���|@TM��~@U�
�@U�"Ktc�@V�lȆ�@W���jL�@Xx6]=�@YV�G�F@Z8� �&@[X޷��@\��!B�@\��"QD@]ڠۀ�&@^�c�>Z�@_�v	@`YP.��@`� �%;@aR~׍�@a�3�!�=@bQ;ާ�h@bҔ (U�        ?��(gb?�Z�^�
O?��I�,X�?��o��f@j$N���@]�qq~{@G]\�S�@w���/�@8�j>=w@!�݌�@%)L��@(���'��@,����z�@0g� �CF@2�G���m@4׼}<�@77O_g�@9�1 ʿ�@<A�����@>��5:Ѱ@@չ)�?�@BAIOzi@C���@E9=��87@F�"�u�l@H[W��+^@I������@K��tN�@MY�d��@O�j��@PoA��w@QWfV�\@RDB<�@S5R�{@T*�@��/@U%a9B@V#i�.�O@W&å9G@X-	h-�u@Y8%�h�@ZG]�q�@[Z�܇-C@\q߽�]@]�.'�g@^�!{�>�@_�\z@g@`z�T��Z@a+9���@a�N3�[@b@J�c9*@b��p��@cw���y�@d)�,@d�H��ج@eX0���@e�Ӣ@��@f�-�VPg@gH;�^��@g��i&]Y@h�f����@iG~ӹ�@i�>����@j���E0�        ?������i?����w?�.f�F�@?�Z���	*?��w�;c?��YB��?����An@Z'x�iS@	H�����@�s���@;T�~�@U�ӐQX@�>lU�@(Q��@�n<���@!�.s
�@#�9U�@%ެ�X�@(�G7�p@*@v�\�t@,��u�,\@.�x>-��@0��P{=@1�'�clB@3;c�̜�@4���X@5��O�@7LP��@8����o$@:*�{
��@;��i��@=(.�!@>�]/�r@@"���@@�8W�7@A��]�b�@B�t�O0�@Ci�L�C&@DDy�;�?@E"��l�8@F2~�"�@F�J�@G�3��V�@H��s��&@I�#&@@J�ޮ�B�@K���l:@L������@M��}��<@N���Q@O�_����@PD[7�`@P�
9�u@QM8�o�@Q��RN�@R\	�"�@R妌8�T@Sp�h�~X@S�9a�@T�(<�,@U��Ge@U�A��F`@V=e�,�e        ?�0l���6?�l���u?�E�%��>?�AؽЕ?��H��05@ �W���L@q�".��@܌Ì��@ � g��@�
�8;D@0J��Pg@���d@!؏�ǘ�@$u�%�B@'86D"P@*!>���@-/=�M@00���=�@1�v9��@3����@5d���@7B�i]�@90�ps��@;.� ��D@=<��re@?Z'���D@@�L�t�@A��Am�@C��O�@D1޷� @Ed�1:HL@F��[�V�@G߿���@I'AbLw$@Ju_��@K�k+}%@M%M��@N�wQ*m@O�]�X�@P���Xxd@Qg����@R$�-�7@R䣬��b@S�e;F�7@Tm��Gt@U5m���W@V �叾7@VΌr�	v@W�(�m|1@Xrk?e��@YHJv�ݯ@Z ��<�1@Z��4 '@[�?1(w�@\�;5FWT@]��_�R�@^�}˭�@_g�k�F@`(����@`����\@a�Ґv�@a���B'@b��C        ?��y��:?�tr�F�?�n�x��?�~w��\?��9�"?@ ���N�)@� ���@;��Ya%@;D�+J�@2̜?�!@�_�U�@$!9m��@"7:[�@$�����@'v$Ԛ��@*c�r�Z@-u���DD@0U���@26�r*;@3���ڀ@5��ʱ�@7l�S}�@9Zs7[_@;X���Vk@=f�Xc5@?���?��@@�����@A��'zX\@C�
=E@DB���A@Et��9�@F����*#@G��db�(@I2�0�S@J~�Ԁ��@K�B3�~�@M)���U@N����j@O�P����@P��LqNL@Qd���@R�t�@RܾY�@S�/�v@T`N+@U&��o@U�b�N�@V�B�ޝ�@W��WS@XVw{���@Y(�{o@Y�b"�v9@Z�i��G@[��OA[@\�xj�s�@]gp�T��@^G�hίu@_*�U�o@`Vff�@`z����@`�$O��,@ad�=@�u@a���;        ?�����X�?۝R����?�P��V?���Y�4U@�9:$}@
�.R��@�T��;O@�R��W�@_�ң@!:�3�@$��^j�N@(���#@+��P�UB@/�l*��@1����2@4"���W@6`���*c@8�����g@;/-���Y@=���V�@@*�P��@A�kڸ@B�!O@DU!]��@E�w�?�h@GMl�q\"@H��ֱ��@Jk�{�M@LWzV67@M�&4�(�@O\��)@P�JhD�@Qj~]�@RNT�P�T@S6��/n�@T#=��&@UȔ��@VM֠�d@W ����@W��|t3@X�-f��@Z���4@[�0�F@\
���@]#]�@^5�ו��@_K��s��@`2͏�o@`�o���@aQ��4�@a��ske@bw�d���@c9jM��@c�j�3c@d=HUo�
@d��KC�R@es�)*"�@f��a'�@f�0�߶@gR6��a�@g��i��@h�����@i>���x        ?�������?˾vHČG?�G�a?�k�]L�?��v%+.?��16�@GX_�i�@j����@=�`��@sF���@}���@����*y@*���x@�)	�o@ ʇ�_R�@"�fQ53@$�noގ@&��P`�P@)6\��h@+�"?�N@-���V@0*]܂�\@1lQ�
U@2��V�@4
G���Q@5e��i@6ɸD?M�@85��i��@9�7J>š@;$�''v�@<�Lhy7@>1ZN�p@?N�&H@@�U ��@A|�wO�@BO�ҭbs@C%¢�ҕ@C�]�`�@Dە��6F@E�%: �@F���S�h@G�5�r�@Hk���t@IVĮ,�^@JD�}щc@K5`�{�@L(��E�@M���H�@NQZ�
�@O|sY�@PW$�@P�/Z�t&@Q	���< @Q�
m��n@Rď�ba@R��v��@S�n��@S����"@T*Pu��@T��G�f@U>W2;@U����I@VV�Y�T-        ?�m7t;�c?�]�`Cn�?�;�K��?�pe�.�?�a�e�@��v�v�@��߶l�@S;:�@�g)_�@
����@��5J�@ -��S@"�ـ_�@%��~�O�@(k�DuԹ@+}'�<�@.����Sk@1
R{ƫ@2̠��k�@4�c�LD@6�?�RL�@8��J��@:��klz@<�
�5�H@>�r�#�@@�?Ѐ6,@A��0�j@B��7Q�G@DzQN@EO�\���@F�O�(c@G����@I6,�gƭ@J�e�~�@K�ߥa�@M\��@N̺}O8@P!��WJ@P�?���F@Q��R2�@Rg�7�|@S/ N��@S�K�Y�@T�}�&[@U��u��`@Vm�����@WD�P�&�@X��ԟ@X�>i�4h@Yڤb��D@Z��:��a@[��J�yt@\���$�@]s �bK�@^_�g�Q2@_N���Q*@` (nHd�@`�2�37@at`E|[@a���#�@b����\@b�X <ֈ@cI��v        ?��@��4?��6�n�O?�Ȯ��K?�r�A:��?�*�2�D�@ T��T@���5�s@	w0	�@w�I�5@@G���@Z���2�@���"E@!<��i�@#�rW�=�@&`�{��@)&}w]'g@,��7��@/�aRظ@1 �לΞ@2Ĭ?��@4x�0�@6:V�pM�@8#�U#�@9�%���-@;�+[X�@=ц���@?�O�i@@�su3@Bؘ�ec@C���yF@D<R��@E_'LF�@F�$���@G��C,��@H�=�x��@J%%&qx@Kd|Y�p�@L�+1�@M��l@OB2��@PK-�s0@P���m#�@Q��`>1l@RX0tP7@S��רp@S� X8�@Tz~]h+�@U5(�UL@U���)@V�!ޗ0 @Wra�4@X5ġ�	S@X�CT�l{@Y��58��@Z�v�c&@[X�K�N@\%�-��c@\�[$���@]��'�Ӥ@^�V���6@_o�7n�v@`#k�W �@`��6�/        ?���.��e?�1�"n��?��3fS?�V%�-�@C@5���@"�6!��@�SG
}@>�K���@�,l|v@!�Uc�@$��G�@(�\�,s�@,[�EuB�@04O=Gs@2VѾ�@4�K�1�@6�+��@9U�B��@;�����R@>y!�4�@@��z �@A�zF�@Ck%�OZ@D�B�?1@Fi��l�5@G��?Д�@I�κ6Q@K1O~r��@L����@N����@P&i�1Jc@Q	*;Ch�@Q�+��TT@R�W�e�=@Sʕ[oh@T��TT��@U��֟�@V�׭;�r@W�|��D@X�� ��@Y������@Z����@[̶>[z@\��R��B@]�4s,�#@_����@`Pv2��@`���S�@a.�nx>@a�JA��@bSJ���@b�¾�:@c}�*�R�@d �^��@d���7@eG��v@e�B�|8	@f�n��@g_Cd@g�i�J��@h]��E��@h���q@i��vk�_        ?��E����?�RԫU�v?ۙ6|#*?�?��jw?���v/?��~4@ �w���V@F]�@
c����@�g��@���
d�@/lb0��@�d��l*@-�u֊�@ yi��;=@"rR"ȁ�@$��LLϥ@&��^wj@(�jp@+&�/�N&@-�c/p�@/�e%���@1=&Oz@2�dJ;@3��)��@58�#�T@6�ٶ�xo@8x����@9�ZY�h@:�XoN3�@<�M��(P@>�n�@?����m�@@���<�@At�V�U@BJ�Ʋ~@C$dJ6�@D ��&"�@D�CQU��@E����@F��ҡ�@G�l�sݵ@H��똘@It�8��@Jh�8>�@K`<�T�@LZ=�CB�@MWn�؛�@NW��o�C@OZ�؀4@P0N�n�@P��b��*@Q:~ϛPR@Q����t@RJ8ެ3w@R��l�@S_Yé@S�┇@T@Ty��6�@UѸ��@U�-�Qa�@V*�7w�3@V���	#/        ?���g�?�偰d�W?��K�`��?��BW|�?�o&~��Y@<A�{�@��8@����@~���L4@��N���@�0�[5w@���۪[@"Xq~���@%��/=@'�x�'@*�bT�(z@.��)��@0��8�e@2b��	@4,Y��/Y@6S���L@7�����3@9�Vo��@<=���@>"�קY�@@)o+���@AId希k@Bq9nΪ3@C��g���@D��I��@F�9SH�@G\�yP�@H�:�q�@I����@KZs-�ל@L��k@N&���|8@O�C���@P�:$U@QF��@R6���@Rͯ����@S�b��S�@TbF��͒@U1Q ��@Vx�v�@Vص瑊@W����T�@X�N/�n�@Yj���,�@ZK֬��n@[/���\�@\Ⰺ�@] �z��w@]���Y�@^�6�X@_ς����@`bEz*Ls@`�#��}@a[YV���@a��(���@bY��4�*@b�਴y�        ?��L;�ft?�i� ܩ�?�bq"uc$?�?��,���@ ��׼>@��fQka@,'�9�@2��Ujg@*6�<�@y~&���@�P-�@"
srN�V@$�%��-@'x�%�w@*i�<�y@@-�7�KM@0]l^�-@2��rD�@3��uÂ@5�����@7�GM@9s��:�n@;v�����@=��O�m@?�\��V�@@��b��@B�m�.�@C7��[g@Df����@E�H�~��@F��]�f@Hw=���@Ij�\�ϴ@J�C����@LE��e@Mu�S~^�@N�	!z�@P$O��Y�@P���an^@Q�k<U�Z@RZ+?~ #@SPx@S��
�_�@T���*@Uw̗Pt�@VF��W�i@W��9l@W��v׹@X�A㹛o@Y���
@Z}g�a�B@[]�����@\@�-�B�@]&�pI��@^��ʢ�@^�e���@_�U��@`mΉd@`����,k@ab:u�_@a�nK��@b\ �,��        ?�
m�Z�#?�l��J��?����/�?���rTS�@t��с@i��z�@N����@}Ӳ�Ǔ@<���|m@!��	&fB@%%变��@(Ǣ�߆�@,�>��s@0\��0y�@2�.��ep@4��ߜ
�@7�����@9��,�E@<���w�@>��9h@@�����@BF�.�@C�'��̌@E�Ç��@F�Ֆ���@H���2@I�1^�2V@K])Zըc@M
�K��F@N�ǅ�E?@PA)d�D@Q%�`L�@R��7�)@R��b?��@S��?@T���ܱ�@U�"u6�#@VݙSc��@W�V�L�@X�����@Y��l4)@Z����@\��T��@]&���d@^@&I�<�@_];����@`>�?僥@`��+�*@ad��P�R@a���+X�@b������@c*����@c�YrDW�@da��2ˋ@d�[�ª`@e��"JH@f?�͋0@f��}�@g�
"sR@h+z�4��@h�b�S6\@iz��]F@j$��Ea�        ?�@�����?��Wi=�?�I��7�?��#A��?�C����l?��]����@���}�@�e\��9@����@^q8���@ql�h��@������@81]�֊@��.�+@ ���D@"�@��H@%	�O��3@'>H��X{@)�A�G�g@+�I���|@.Z�wN�@0qa#K�:@1�2�ϊF@3�^cr�@4w�N׋�@5�B�ѡ�@7U�[@8҈�L.@:X��O@;�I�Z�+@=}#ǱX�@?|�=Xg@@b���s@A:r�@B4yx�@B�Rf��T@C�jd��@D�n��.�@E�Rz�>o@F��K�y@G����ύ@H��ݱ��@I���ɨ�@J�I'O�@K�)&��@L��纒J@M���
g�@N�����4@O���,�:@Pa�{�ɞ@P�*��C_@QzU�J8�@R	+��@R��;k�l@S+΁m�@S��`�!Q@TT�g��r@T�����@U������@V����@V��rUFY@WX�Db;@W�Gp?�        ?���٥�N?���47]?⩮cPU	?���qRM?�D�;�M@�k@l@��;�m@e��[|�@TS���@P/��<@��U���@M�ŷ�@"$t&�Ep@$ʥE%I@'���.@*���8��@-�����@0q�̭@2!�Nd��@3㥂��@5��hx�@7���5�@9� �%��@;���i@=����@?� )�c�@@����L^@B �O3ϕ@CI�	�z@Dx��y�B@E�|��k�@F�6���@H1��lH�@I}@f@/R@J�c�m@L((����@M�x}��l@N�;�2E�@P,�P�	�@P����|�@Q�Zġ�@Ral�AE@S#��Dr@S���E��@T�/W�\�@U|E�TY@VJ89���@W��Ig�@W�ۈt�@X��/�<@Y�S6��@Zy�Z���@[X=��i�@\9M���h@]��N�@^,b#S�@^��o�h@_�1Jh�@`bxZj6�@`ڒ�b1@aS�4<�@a�i�k��@bJ b���        ?�-C���k?������O?��i��)?�D���?�Ƚͫ@}X?�i+@eԼ�L�@��t��@�2Y���@�w+3[�@K0WU�@ 	�����@"�6Ϻf@%P9���@(0���=@+8�9#T@.g	̏��@0ݸ���@2���ķ @4i�]�R�@6J���G@8=M�ͺw@:A^��=@<V��F��@>|~�%�@@YP�P,@A|�_�B�@B�?���,@C�|�4-�@Ew��ey@FYzn��@G�-��#a@H���h)�@JMyo��@K�qօ�@M}�[0-@N��E�R@O�m���0@P���(��@Qz�d���@R?Jv$;>@S� ��@S��wg@T�S��@Uq�d���@VF,���@W�v�=&@W�R����@X����@Y�t�5 U@Z����@[�L���@\i�-���@]U���<�@^DY��tl@_5��.(;@`>d9>@`������@aQ��\�@a�h�X-@b
ʣ*�@b�u`�Op@cfPK��        ?�pn)A:?���_t�F?�~ K��?����P:@z�7�%@ؿ,�$@B��6�@�^�u�E@��۝W@"��ڣ]@&@�:~R�@*E@��e@.(�Xq��@1<���W�@3�>E�@5�[��\�@8b���@:����&�@=�[��@@<���	N@A�B�#.P@C-��V�@D�y;Y�@FN���@G�^���m@I�8�/��@KU�̛�@M�(��'@N��ul@P^PL��J@QOGa�)�@REK�k�@S@I���+@T@0=D�@UD��D3�@VNk1��@W\�Qw��@Xou�X|@Y����g@Z��5�'�@[�I]���@\�*��^@^o��~@_?	��!@`8vBZڢ@`ӆnu�P@ap�����@b�r�C@b�.��i�@cT{�L�@c��Xᬔ@d�B[�@eJY�S?�@e����|x@f��S?�@gQ�w`��@h�F��@h��ׯ@ijz�HP@j!�D�(@jه(`@k��vj]@lO��v�        ?���x�}�?��S�m�?����?�E�_z+?��N:���?��� ,y?���?��@6[a23�@	�h���@e�`�$�@ȿ1�@H�� @X�4�6_@�Gx�@V��q��@!�����@#|Y�{��@%��;��@'��Q���@)Â6՞e@+���*�@.J�8_��@0S��F�F@1�T�
��@2��:�%@4�$�!k@5\�*"#@6��Cʹ@8�z-�s@9rml�o@:�J�j�@<O1W;@=Ǻ��<�@?G]H�h@@f����@A,�k�]�@A�Q�@B¥U�W@C�<Y:�6@Dd����@E:^"*`Z@F͎ v@F���T9@G�&ވa�@H��J��@I�|�%M�@Jv����@K_p$j�j@LJ�-o
|@M8�	�P�@N)rWk�@O�K�!@P�ې��@P���vLV@Q�g���@Q�$H@Q��@
�\@R�@�!�r@S�l�y@S�"��K@T	4��@T�p���D@UĴ-        ?�dk�?�^�s]��?�5��<��?�#	�!��?����R@ ��"�@QZ��K@��1:Q@�[<�YO@��-!%�@��$}{�@���x@!����Sm@$>���@&�P9��@)��� @,�h�fċ@/�a��o@1���ݖ�@3V`-�� @5��/@6��pk��@8�/�$@:�,�
:@<ӱnE�~@>��䴲@@�B��$`@A��<�I�@B�1>[<7@C�腷�@E�?|�3@FLD}�z�@G���6	o@H��߁�@Jz�e4z@Ke��ӭ@L�43��@N�6�@O|q"��@Pr�P�n@Q* �Pa@Q�{&@R�lQ�@Sbq���@T%���U�@T����@U��@=�v@V�8���.@WN�+�f�@X��CG�@X�o���@Y���	*@Z�䪙��@[~��gx�@\\�qii@]=~ġ��@^ �4�{�@_�/X��@_�O\��@`l�YaR@`�:��$�@aZ�Ē�@a���.F�        ?����Ts�?т3͈M�?�~�'7�?���"�?�*X�@��}�@���p:@W�|�@L�A�%�@H��/�@���g @FhC�@" �	�_�@$��5j�@'�7��@*���Fm�@-��I��@0o-I��@2�-P@3�[���b@5�׏��@7��1wT.@9�hs"X@;��j2Ss@=�|Mx@?���s@A/YQ�N@B%�5�@COe'��@D��Sjkk@E����@F���P�@H@�akX@I�4U��\@J䡘D~@LAピ�@M�L"���@O^\'�@P?��	�<@P�Jd�?�@Q�H⽽d@R|�o�-@SA����*@T
���@T�C��@U��@Vv��\l1@WK��C�^@X#n�f>�@X���)@Yۥ�@�A@Z���JY@[�+p� �@\��$�@]m�h�8@^X�ų;@_F��di@`�iLD@`�G��@a��@a�0ӖP@b	��wE@b����d        ?������?�}��g�j?��➵�z?��aL�F�@īY�U@
m͐��$@�CL/��@�k�*�@�_���@!
�O;@$K��gq!@'�t8��X@+mf�
U@/L��~�@1�� ��G@3�_hM�@6�Tu�@8R��x@:���Q@=+�2 W@?�ŔQ�@A*���v�@B�k ��@C�j�8@EP�.��@F��&�}�@HA��R@I�'���@KT�S�&@L���M@N��mNS�@Pv ��@P�NB��v@Q�򁉮�@R�Q�^9t@S�Z��@Tn��2� @UX)4M��@VD�j��{@W4�v�@X(9�� �@Y�{�%P@Z�p/W@[��ԛ@\6	��@]p�p�O@^И�Nl@_)3��@`��NIC@`�p�C��@a+��a@a��g@@bB� @b�~ � @c^J<��B@c�yX��@d��tS @e�ah�@e�5�loU@f<иl�:@fӾ��ޓ@gk�a-� @hӿ}�        ?�4f�Ę?��7u��?��"�)Y?�G�5:L?�l�Z��?�g)��g@ 2]�[ @��D2�@	�[1��@��Σ*@To�)*@b��C��@�1��n@�����@�3"��@!����@#���$@%�D[:P@'�F����@)� Ԏ��@,󛊪�@._� ,;2@0\��݌�@1������@2��
��%@4J�ʎ@5_89��@6�o���@8���?J@9n#�h"�@:�^�١=@<EX�mc@=��M��@?7z��@@\�>��4@A!D�J�z@A��9y4�@B�r��!	@C���6w@DQ�!lL@E%�2h�@E�m��w�@Fԏ��
@G�s��W�@H�2�}@IpYG(�@JTD.�`@K:��3%@L#�Zp�z@Mj-�8@M�}��T�@N�	�}�@O�
��~@Pk>�9�@P�.o��h@QdS���A@Q�t�K6@Rb6QO�[@R��@Sd���#@S�����@Tl)���S@T�0h�        ?����wvS?�<ZVL�??���%K?����9��?�w�H�@ �	~�A�@,ˊ
�@kQ����@�R����@�a{oe�@��Vs;@=#����@!��Wܞ@$���@&��ӕv@)���aG�@,�����@/�Fb}@1|K�@3,̠��@4���<$@@6���h}�@8�.j�"@:�
���@<��
�J@>��1��@@[죒m@Aq%����@B�^*�8@C�u�g�@D�N� �@F
��^�Q@GA�]l7@H8��@I���h1@K��#ϒ@L\�dK�@M���}V@O�khQ�@P8b�;C�@P�1�ٮ>@Q�۷Iw�@R\V�\v'@S���H@Sך�ؓ�@T�P�5��@U]�l7@V$���@V�N��-@W�x'2|@X�'����@YZT$��@Z-��A� @[:�Q�@[�~kO��@\�WʡÛ@]����#�@^twƖ@_U��o1@`P��@`�7��M@a��"�q@ay���|�        ?�l��.�?�M��|R�?�B�H{9�?�L�,��?�ՏRS@ �nnXP@|����@�ZC�pF@f�0H�@�Ő9@6%��"@̨���@!�Q�0iX@$u���}A@'8#��d@* ���@-,�C{A4@0.�)v�@1�~",�@3���Ǒ@5_n��6@7;�i1$@9(J�C�@;$��D@=0z�o'@?K�ʙ�~@@����@A�4��z�@B��2N�n@D%�2h%@EWl���@F�,|@G�Ŵ�&@@I ��[�@Jc%�ui@K��YP8�@M֜ ��@NqU�FV+@O�'��q>@P��^<j@Q\6E���@Rاs�4@R�vVa||@S����w@T`v:=�@U(�^5tf@U��k��@V�Ѕ��@W�|�t7�@Xe�)^��@Y;����k@Z����@Z�+���@[�2�e}@\��	k@]����^�@^w�[*b�@__�+��@`%K6��@`�݈
�@a��V��@a����@b��        ?�s�/W�&?�Y"y���?�n��.�?���Z_�@�Ɍ1Lv@
B6��B@�k��H�@u�/|L�@���5�\@ �ݯ�
@$(���\�@'�qz�)W@+@:_�ļ@/�m'[@1��&��@3���rc@5��Z(u@81�Y��@:�f�p�@=�P��@?��q�Fe@At$��p@Bo�،|�@C�Ue��d@E<�*�r@F����3@H+�;�@I�����@K=ǆ�s�@L�zV�@NpF�܄@P
�=%@P�����@Q�P��g@R�=<6	@Sz��C�:@T`���@UH�����@V4�V��O@W$�c�H�@X���{@Yݷ��u@Zn̢y�@[9�I�
@\4��@]V"ӄ�@^�F\@_� �pR@`�����@`�>�a��@a"]�f��@a��ßl�@b8�{���@b�\���@cU2�U�0@c�pw��@dw��fZ@e
�BSw@e����Y@f4G�r��@f�m��5@gc�/Ze@g��r��        ?�2��-ld?̘��}?��Q���?�l��5��?�3(Qx�|?����5J@Ά�Ż�@�����!@�l��I@��(�F@�ԯd�@l}xa+@���(��@�܄��6@!KK �@#U�Xw��@%u�deo�@'��\r�@)��8v0�@,Qi�Ù�@.�VX�d�@0�(���@1�u�̯@3B�X@^�@4�fWO�@6�Q�@7t�%�@@8�S�H\+@:jM��M�@;�O�Y�@=�7�]fG@?��^@@Z�.���@A-���~V@BJ��9�@Bެ�-,&@C��B�O~@D�Oo��G@E�x�jq�@Fl$�6�@GXGD��@HG��g,@I:�S�|v@J1�p��@K*���V�@L'�2K�+@M'�R34�@N+�yP�@O1y���@P�t�@P��s��@Q+�m�ir@Q����4@R?�-|�:@R��a�G�@SY��r�@S藤�A'@Ty��;�@U
� ��@U��]@V2�%�s�@VȃXS�$@W_�I)�r        ?���[�?��p��?��S�3�?�6g!|?�`(��`�@.g��%�@��Ϳ�@��ˬ�@@e'�%@c����E@�-����@e��l@"2/�	6�@$ٻ��@'��I���@*���l�J@-���t@0|���&@2-�t�{@3�W�J8�@5�0����@7����+@9��;W�:@;���jU�@=�ެ�@?�L=�4@A�+��@B2���]@C]lϯ��@D��$��@E�"kH��@G	缒��@HQ��̀@I����@J����@LSy��@M��N�K@O!F�`s@PIU�|�@Q�B�g@Qò�^�a@R��s؊@@SK�0y@T}�r~�@T��<NcN@U�q�^@V~��pL@WSVy��?@X*�mZ��@Yן@u@Y��9�sr@Z���)C�@[�4���x@\�z��Y�@]qp<�@^\<Ǆ{@_IIf�/
@`�511�@`��߆˝@a2ݣ�@a��m��F@bՈM�@b��*�        ?�ݐs��?ѧd_�D?⟰�'i�?��'�O�?�L]�C�@#� �@��j��@v֜j��@_1n3�@]ᖛ"@�y�� c@`/|�W�@"/;�J�@$�}7|z!@'��*ٖ�@*�-�S�@-�����@0x@�S��@2(�*���@3����y0@5��2;�@7�����@9�Z���@;�kw�/�@=�����@?��֊@Ak�>a@B#A��@CKh��x2@Dz�'�(�@E�0�X��@F�))�@H2��f�0@I}�]C8@Jϩ�}�C@L'��q�@M�Ҳ��j@N�C:
�@P+㫣��@P��
�2@Q����@@R`.����@S"n.?Ǵ@S粼�Ic@T��ݨ~i@U{)�_~Z@VIL�"Sa@WU�v�.@W�;as�@X��͡@Y�{��i@Zzľ E@[YǴ�@\;||ϯ@]��x@^�\�@^�x�Ŗ@_ܪ&��@`e���r@`�Yt�@aX=!��}@a�]��,@bO�g�l�        ?�_�����?� �oeK?�}�P?�c?��BM�@�q<cR@����@��ւi+@��4�N:@�i�m{@"���4@%{Å.@)(���@-ө��@0���̬�@2��o�d�@5$U�7M@7k��c[O@9���{��@<s��Ť@?�M�k@@�Oi��@BV�'�|@Cʛ>�K@EI����"@F��=Riu@He�^9*�@J�q@�1@K�~�@�f@MYbK�K�@Os�eB@PjC1/�(@QO���#�@R9��#��@S'��*��@T�g��@UfWm�B@V
�_?��@W	�u�i�@XwKsO@Y�H��L@Z�ϲ��@[*�F��@\<ת̱?@]RiM~;@^k��w62@_�k��+{@`Ta�!��@`�L!"�@ay��y�F@bF��n�@b�Ju��@c>��9�N@c�B��f�@du+�l�@e��&.@e����Ӥ@fRW]��Z@f�{��c:@g�#a�
�@h=I��Q�@h��憷@i� T4u@@j5�@        ?���w#??ʝ�K`{?���N���?��7���?��R(./?�5bJ���@ ��	g�@d�!Eg@
���y�@����@���n@58]u��@���ҢC@&߸��@ rSl���@"g,~��x@$qJ+e�@&�oe��@(��BDE�@+	ap�1@-b�V;@/�Z���@1';��@2o[C �"@3�|���@5@.nXC@6|xrTyy@7����bg@9Y�����@:�Lٔ��@<V�B�|w@=��K(�@?sH@@�A Ҽ@AV�g�17@B*ϛE�@C�ٞx�@C���؛�@D���?Kr@E��ȍ�)@F�]I6a�@GmO�B@HY�c@II�0Ao@J;�!#y:@K1�N�h@L*����@M&ݑ�MU@N&!֓p@O(E���@P��J��@P���#@Q x��@Q����X(@R0!�z@R�,���@SE��\
@Sҥ�Y�@TaU��@T��o�|@U�)�o	L@V؅M��@V��O��?        ?�!�f�H?�P�8�	?�#I��L?��&7zz?���9��@ ���'̝@>�Ti	@�k�@�?�K�@�
���@�#v}�H@~��F!@!��>l@$Ei�'h�@'���a@)�ݍ��@,�+DuK_@0A��l@1�)�~n@3nqѵ��@58���H@7ćZ�;@8�&π�@:��S�@=����@? K_z#�@@� 4q�@A�I� �!@B���?��@D�����@EAy�"��@FzE ^t�@G��VS��@I a���~@JM�s1�w@K�DD_�@L����@N\;i�@O�G{���@P�L)�o?@QR��4�@R�� �i@Rγ�\�@S��;�/@TWP�@�o@U 1�@U�L���@V�
�Bo@W�L��ƣ@X_W���4@Y6$��@Z��׳@Z����]�@[��ii�3@\�H%�M�@]�gg0@^w_�Q�@_`]���@`&�sA.@`�6���D@a��!@a�.w`@b	�O�        ?���C�T?шޤK�?�z$x�2?�jT��?�}{H�@ �N���=@�W��]@+4<p��@-�C#B�@��5m:@ec����@���9�5@!���h�@$�pOF]@'P�a�X~@*6ROU@-@&1�i%@06[o��s@1ݳ�v��@3���)��@5^�U��@76t�wS�@9f��@;��aY@={?�T�@?1�s1�I@@���{S@@A�:��r@B��/{@D����@E:&R8c�@Fo(d>{@G��|N��@H�(f1�@J5؀�T<@K��|$�@L�gd:�@N6�9�@O���D@PÍ���@Q6�j#��@Q�cYeUD@R�	V�"�@Sl��Tg�@T.ǓS��@T�ȅ3o�@U�{՝ܥ@V�ע�
6@WRѭ���@X"^���y@X�u�8O�@Y�6{�@Z����@[y����@\U~ b��@]3�:V@^L��0@^�&�{(�@_�B��6[@`a�Ѹ��@`֒fwme@aLn�5i@a�^b���        ?���7X�?���F�b?�Z.J5�l?��[O�@��C�@
�ET�@��S�@ ����@�S����@!�]K�WE@$�.���0@(x�5�5�@,P�O�o@01�6���@2V�wu�y@4����@6�&bA@9eēF�b@;�ʹ���@>���t�@@��5̇@B��*��@C��]l�@E
�T�]$@F��@H,U�m�b@I�I?�@KxIc�\`@M-��$@N��nu�@P[9Ki��@QD�u�Z@R3U�@S&%�tVe@T����@U-����@V�T�@W N�ʃ�@X)�+q��@Y7��T��@ZJ?�B۱@[`�s;�@\{D6�U+@]��f�)�@^�{�k��@_�|/۳@`��r���@a��pĬ@a�Ƣ���@bQ� ���@b�E}[5a@c��O0�@d,���pr@d�=�@er�1�
�@fc�ؠ@f������@gh���a@h��ˀ�@h�G;�@inV�N_�@jS���Z@j���Z        ?����K/?ʡ�$��5?��h�?笡?��C?��
��8?�n��n�@ ��+۳@*8��Z�@
/�?_��@�i��#@�wQ�@ޚ��D+@,���@��j@ 'M�2�R@"g8)v{@$��	G�@&/�Ѫ�@(=���fP@*r�f@,�D ��@/�{�c@0�ߺV��@1�rS�C@3<7��p�@4�i�}U@5ۘ.���@76z֌��@8��Gheh@:�f/�@;r:��(�@<�lê�@>gf��TJ@?�)��@@�����3@A�r}R�@BPs�uW @C�W�E@C�ώõ�@D��7M�@E�I�U�@Fzp���@GXz[�@H9[�^�8@I�6Wc@J��~G�@J��@f@Kز&,@L�Z�X}f@M��D��@N��1�@O�:<�9�@PN/a^Y@P�ۚ�9@QKs��@Q�n�i"@RL��6�@Rϸp�+C@SS��Y~�@S��
!@T_*�FK@T�f���/@Un襪[/        ?��̛U?����b?ⷵ�P�?��_���?�Sh+%�G@&��6��@����@}<S:�)@dS々�@e��|�@�G|�&�@p�A��F@":���-@$�_c۶@'�j��٥@*��.�%w@-�s�Ͷ@0�Q�ڧ@2?�GG�@4-6v�@5����O�@7�:�k�b@9�x&�� @;�rp� @=���u�A@@	�+�@A'��?�m@BM�a�"@C{[�D@D�V�	��@E�-u���@G1~v�`@H}0��TN@I�*�F�@K*V��B�@L���o�@M��C�W@Oc-{�%@Pl�x̲e@Q+K22@Q��_nJ@R��Hn@Szu�M�y@TF�(1Q@U�_��@U����-@V�'x|�?@W�hs��(@Xo�<�Z@YN ��7@Z/k��v)@[�zկf@[���1�@\�2� @x@]�@�1�@^�#���@_��M���@`U&�	�#@`�B�
@aN�n���@a͋��o�@bM�8-�@b�1©�        ?��]ˠxr?���S}��?�;��?�J�*t�?�����@ Dd��O�@��+�*U@��쀮�@n��[�8@7��>��@S�-�%U@��8���@!<H��Q�@#�.s�)\@&dY+�O@)-�k�@,of$G@/&�Ts@1*�^@2еi[+�@4��}j�t@6L%��'�@8 :�E�@:����@;�FBiC@=����@?�,�F'@AŲ�8T@B󳥻�@C8~\�W@DXC�)f�@E~"��J@F��2��@Gۥ����@I���@JPj��H@K���<D@L�`Axp@N'|��4g@Oy���_/@Ph���:@Q����_@Q�O��@RzU����@S/�j���@S�{V�V�@T��7��4@U]ܙ��@Vl�UI�@V�176@W�#�.)@Xe:ݗ��@Y,p͆�@Y��Qq�@Z��=�@[�~��Ȍ@\]�3�x@]/E?��@^���d�@^�ү�c@_����@`C��5Rv@`�Z<�        ?�eٟ�ت?�@��x�7?�]�_��?�}�+8vc@�ߴ}18@
:��/�@����.�@ur08��@�UcA�C@ ��a��@$0*Ȁ�@'�To� �@+O����@//JES.@1�þ��@3�'T�<�@5���Y�u@8JP�>T@:�����@=)�i��/@?�x�O@A.	�C��@B�K��8@C�N���@E\�ey�@F�+ҧ4�@HS*���@I��|<@Km!�S�@MĚ��n@N���ϑ3@P)M:�7�@QCi��e@Q�$go�W@R����n�@S�k��D�@T����	@Ux�hF�\@VhX�T�@W[��cv@XRL��pW@YL�zZ�@ZJ��@[KM="@\OdMү�@]V�ȯ��@^a�;$��@_o�c졍@`@{�D�@`ʦ�4U�@aV^�|,Y@a�Qow@brcDr@c���@c�^�U�@d'�����@d�#�cr�@eR%7"w@e鋳��@f�S�Z�A@gx�8�x@g����@hT��ϱ�        ?�fi�~Z?�N�nZ�[?ډ�2+?�{:{�?�$p��̅?�C���0@ ,�_@y��i@	fg�H@��Ӯm$@EZFp�@[�� �@�i�.o"@J�7v@�"O"��@!��M�@#�z|���@%�{�"�@'����T@*#��rM�@,k��!i@.�t�8�@0�a�W��@1�E�MP@3��h�@4o�\[@5���žo@7(߹��@8�X
�I@: vi�:�@;xNJ�$@<��:�u\@>~�5&@@}~8��@@�A.��@A���9A@Bqiǉ�q@CF�xmPw@DeT5~�@D�r�a�?@E��\��@F�p�\@G�H4)��@H�I�h�@Ixj�^3�@Jg��N�@KY�V�@LO�p8�@MGPq^j�@NBp�7�x@O@p�҅�@P �[���@P�t8�=@Q%��[�]@Q�4�-%@R0���@R�U�^`�@S?��a�@SɹIؓ@TT�F�~�@T�4D�� @Unξ��@U����}        ?���4�?�;P�	/?�~�o?�ߖ���d?�|C��@ ��U�%@#�C"�;@u1�G�;@����Nv@��V{�A@ǻ�Σ�@HEЍ�?@!��cuI�@$���S�@&���J@)�Q�m��@,���b�m@/�ψ��@1}pۍԽ@3-c.�
@4����;@6���[�]@8�p�2G-@:���9@<��G�L�@>��Wa�@@Y�1�@An�X8@B�����v@C�$���@D���u�@F����	@G?��<@H}�)��2@I������@K/�Q��@L\��w��@M�`�K��@O�<�w@P95�(@P�P!WP�@Q�@�&V@R]�Ѓ-�@SsH?�+@S٢[$��@T�}��@U_����V@V'�/>�@V���\�@W�܃z��@X���fй@Y\�|lۖ@Z0$���@[cHy@[�T��[�@\��+�]@]��F#l�@^t��o�@_VU��/�@`�O��v@`��UB�@a�[d�@ax���<        ?��a�_?�z� ��R?�pi�;��?��'?���x�@ �̅�@�֐;��@?�.�R�@?8�qyD@9���@�@�B`�H�@4nٴ�U@"�^~�@@$��l���@'����T@*ρϹ�@-��g���@0lZ�Jl@2���Nu@3�9��Z.@5��$�U�@7����f�@9�B5�ˬ@;�>�F�7@=�_;i��@?�Z�s@A�W��@B)��T�@CTo��U�@D�d@�;@E��zU)4@G %'w�]@HG��у�@I�F��y@J���}@LG�)��@M�ȼ��@O;Z��r@PB#�@P�?�YU@Q��j���@R}EG��@SA�����@T	.���@Tӡ�?z,@U�"���@Vq��N��@WD�h�	�@X�0�@X�ӗ;Đ@Y�yStn@Z����D@[�ླ�@\r��y�@]X��qq]@^A��L@_-	|�@`y07״@`��b��I@`�0�]�@ay�<�[@a�[Z�L|@brJ�h�        ?�;0>Б�?�l�"�?�yk���?�]�`|�w@�}k"@
B�;�@n8�y�@\���0�@��C�|@ �S���@$�?(�g@'�tv�b�@+3Bq�@/�=�<@1�[:g�@3�2c�Ƨ@5�11x�@84�m��@:��]���@=k��@?���TO�@A!�_"Q�@B}uUb�G@C�3��@EQs���@Fə�G-�@HJ�Z۝@I�X�V�@Kh�ȟ\�@M���@N�:���@P+$$��@QҾ�� @Q�E�@R�dVa�@S�&Í��@T�Аd�@U�R����@Vy�X/��@Wo�q��a@Xia����@Yf����,@Zg�Z�}n@[l&!^�\@\t����@]w��@^�9vv@_�U�&G�@`Z��%@`�8� �V@au-��@b����@b��=��@c(z�ہ1@c����l@dRZ�.��@d鈴���@e�/xp�@fI��z7@f���
�@gT�h��@g�}�r@h��T��        ?�	I!��?ʕfP��L?�֒(D�h?����?���J�3?�2%����@ �R��+�@h��1w@
��E�2�@d�ݵ@h0�6@IAj�@�&(�\@H��;�@ ��y��@"LSg;@$��gi|@&�D�7y�@(�o�qK@+.���08@-�^���@/�.d�	@1=}�u��@2���,0@3�}��Kt@52�߸{@6�@�U�G@7����x@9rz���}@:��í@<n�^�@=��䅴@?���{
h@@���ͅ4@A`�a��O@B4Q�b@C
�- ��@C��u�@D±�!S{@E��c��@F���4��@Got�Gy�@HZ%ˠ��@IG�]ҍ[@J8���@K,߼�	%@L#ٓH��@M�$�@N���b�@OF�� @P_�־�@P��$Gj�@Q���^�@Q�Ań��@R �=qp�@R��p�.@S2=[��@S�v�Wæ@TH(��� @T�܍�	@Uc)35�|@U�lE��@V�ԯTCf        ?����֖?��M7��?�в��A�?�
<4 �?�wQ9ߥ@@�7��@?�$�[@�b�_y�@�?���@��p,j�@���?G@���?@"Tmv��@%�ji�d@'�銯�v@*��BgC�@-�φ"�x@0�`�N�@2Vuk8$b@4Ao�6@5�e�I=@7ሹ�d�@9�S�[�@;�r���l@>����D@@���N2@A3�H�j�@BX�YB��@C���Ⱦ@D�I�cqz@E�-�2@G4ԛ�|�@H}���?7@I�F�R+f@K#���b�@L�����@M�S"��@ON[����@P_^��C�@Q�P좸@Q�d�kt@R��1	V@S^�5EY}@T&g��@T����9@U��_�S@V�)k�@Wa"����@X6�4�a�@Y~�`R@Y����4@Z��?k��@[���X�<@\���N.@]r���[@^[4z�u@_F..3%O@`���?D@`��B$�i@a
��МB@a�@ǝ�8@b ��@b}s�E8�        ?��&��5�?�gZ省@?�V�5�h<?�j��-S�?�� �}~L@ ݹһ�E@�	K�E@�|���@�+�X@��@�[�@=̲�_@�o v�.@!�y��f�@$r���@'1ё!T@*���D@-��W@0!PQytr@1Ɲ�{U_@3|k�
v@5BXa�K�@74Sy�@8�!�?i!@:�NSk�n@<�;�͡�@?���@@��zO�@A�>��{@BƸ�[�R@C��w�څ@E�p0@FF��qD@G~�4�@H��7�cT@I�gg༿@KI!����@L�ª���@M�3�w�@OI\"z�@PUa���@Q=�Ǖ@@Q� �;�W@Rv��r+@S1�ʙ@S�k�o�@T���2@Us 
�7�@V8[���@W #㻕�@W�M�ű�@X��!���@Ye�/{G@Z6�����@[	��6;J@[�l�u�@\�
�<A@]��<�@^l����2@_Jd�vA@`�`^�@`�GI��@`��o�Y@aj�q*        ?�BT32)?ܡ�.���?��MKq?���
x�{@�4BF�@��X:@\՜t@� �0N�@J���@!�4�j@%)=���@(� Cp�w@,��B�/@0Xc �S�@2z�oz�.@4�+,f#@7F-�@9x��޻H@;���31h@>����T@@���}�@BQ�ZB@Cs3z�@D�־�E�@Fl9#[�@G�"��I�@I���F-�@K)�q=@LЧk��m@N���>�K@P��R�@P��)�	�@Q��bg@R��&&��@S�HD��Z@T��4��U@U�����@V�gp�+@W��&ٹ�@X��.�@Y�^�z��@Z��	��@[���?v0@\��@�>�@]�т(pp@^�|��r�@`Hfɢ@`��@di@a!\耪�@a�ZĬ�2@bF��<a$@b�Ђ�6@cr��^w�@d!��U�@d���.�@e@2�$�@e��L�/(@f{Ue�M@g�y�A@g���Ɗ@h]�1�J@i}�@i�gNOD�        ?���� '?�HX���f?ۈU�|�?�u�Q���?��V@��{?���%�@ ���t�@(6�K[@
9���\@��Hs<�@�4���{@�j��@_�gڧ[@�i	UC�@ T�d�z}@"I�����@$Ti՚�u@&t�q;�@(����R@*�'�(�@-P��K�2@/���;�@1"�2.�@2n���T�@3�K$7@5!,ɷ�'@6���^�@7���#��@9p^\,p@:��w)jj@<z`�0<�@>6�g��@?�_�6G8@@�b�ڶ@@Ay�`C�m@BR�B��@C0O�   @D���@D��=��@E�ݺc��@F���y�l@G���U~@H��Grs�@I�#���@J���y�@K�eDYG@L�g6<�@M���d'@N��Y��G@O�f����@Pk�����@P��|a�/@Q���;_�@R��h!�@R�	�%AW@S.����@S�vN/�@TT�C�|�@T�p�ϔv@U�y_R��@V�F�r@V�&��XN@WO¯�n�        ?������?�.�bk+9?�U���U?����?�t�"���@ ��y@!���@v�Qu{@����XJ@�Z�՚@�A5�F@`�MAQ@!��.�@$35w�k�@&�7@)ІA�i�@,���jN@0 ��5�@1�쾞}@3_�M$}�@5(�����@7����@8�C�~@:��u�6@<��gs��@?
>�D��@@����@A�k3�	�@Bؾ�ռ�@D^b�J�@E5-��n@Fn�2Q�@G��	�@H��wʷ�@JBL���/@K���#!/@L��FC�@NR�%Ag@O���Dh�@P�����@QN�� @R3�^e@R̟���J@S�u��@TV}կ�@U݅�@U�%QT?@V�J�yߓ@W�C���"@XbkG�-@Y9�T�,�@Z��I�@Z�qX!m@[�%I��@\�.��@]�ϔI>n@^}�J�=s@_g���?�@`)�����@`�y[#Q@a��(�@a�$|��@b���5�        ?��9'7��?Ѡ)b�?�-����?��!�;?�Jy؋��@$S;��4@�S�-�@\��[_@f�C���@jT�G�0@������@z8��Q@"@�ڙ��@$�R���o@'���C'@*�&�`5@-�]N��m@0�l�6��@2Gۢ҄�@4�cv�@5���g�@7Ѭ�X��@9�U�X�{@;ׂǪ�-@=��@�^@@#��@A,��qe�@BQ����@C~�63�6@D�1���@E���fmw@G2�Hg�@H|O�R@Iͪ�@K& ��@L�B�da�@M�N�4�@OX�k�z@Pe�̵�V@Q"���A�@Q�܎P4�@R�:�6O@Sl�E[��@T6`�M}@U<"�~@U�����@V���c�;@W{BR�|x@XS�Ƣx(@Y/kF��@Z�C#�@Z�m�x�@[���@\��3���@]�t�-�U@^���MH�@_~�9��@`8/�em�@`�X�R@a-�C��@a��qҨ�@b(��H�.@b�JX��        ?����E+�?۠zl��?�y?�mO?����8�@�+q���@
�?��@�L�[��@鷾r@���K�@!^(;Z��@$�m��@(PH�yL�@,&e	|�@0�=�.U@2A#��1�@4�A��- @6�nKK�R@9T�ajq@;�$�e��@>�i�J@@���c�@B y��{@C������@E�l�u@F�w����@H<+�s	@I��&x��@K�@T��@MMG��%�@O�
 �@PqC�Ɖz@Q^8�j$@RP/�ʀ�@SG��!7@TB� Ee�@UC�l3��@VI %�83@WS3�_@XbRS�t@Yu��~v@Z��1�#�@[�pT=@\ː�u @]�b�0@_��@`$�'&\�@`�φN��@aY"�9 @a��QВG@b���P|N@c7��@c�����@d��;c�#@e(�ǯ�@e�|Q[M�@f|���?�@g*AQ�a�@gن:1#�@h����^�@i=��ye�@i�ۦ4-@j�hn��@ka��ʠ�        ?����W)�?�>�mUy�?ۄ"YŜM?�x��ƪ?���ODL?� -�s�@ �?�z�G@NY�ms�@
t�$ ��@	J+�@R���@Oh�(�@��~E@g��m�@ �m�ȁ@"����d@$�M*iB@@&�p!s�@)/���D@+�u��6@-� ����@0?�@�&@1���@2���ؽ@4@)��@5����Ƽ@7� ��+@8�(�jq�@:JF/��@;�@�т(@=<��в�@>�#��h�@@@��M�@A[Syv�@A��+�|F@B�r�Jn�@C���@D�^K��@E��NT�@Fx��N`@Gk��*�5@Hb�A�F@I\a����@JZJ��h�@K[�$�o@L`�_�%\@Mi�͝*@Nu��K(h@O�P���Q@PL3����@P�v%iC�@QdkK��@Q����=@R�X�fK�@SE���h@S���3^�@T=�qy�@Tԟ2���@Ul��$@V��bF@V��%���@W>�tX�@W�����        ?�!��ph?�Wly�8?���@~?�A`5��<?����p�@s͑H��@X����7@�u�F�@����
@�3�IU�@@�7���@ ��Es%@"��o*@@%L����_@(.ŸmE@+8ZP�S-@.h�j�7'@0ߣt�
@2�w�B�[@4m��C¦@6Oj#Ph�@8B�O�/y@:Gfh�w�@<\��C>@>��Yޭ@@\y�	D@A�V��T@B�f*�l�@C���b@E�7��@FX�=؛�@G�m ��@H�|��Qb@JH�|8��@K��KF��@M��@Nw�,�+@O�~#�1c@P����@Qq��Ԕ@R4����O@R� ȿ�^@SĆ��q@T��5?�@U`����@V3W�z@Wu�)�@W��ow �@X��^q8@Y�&�8��@Z{�e@[^����@\E���@].x��@^�gO`�@_%d3�"@_��W�@`vP�I��@`�W���@am�%�]@a�!�@�^@bi�8�b@b��<[�}        ?��Ō�b?�v*
���?�qt�O?n�%y?�A^�@AF}E�@�V��P�@BB.h^@@�f�^@9��_V@�p6;$^@20��G�@"�u`��@$�ķ�He@'��C�'�@*y<��D_@-����"@0f�Yu&�@2����@3؆y_@5���#7U@7��)��@9�eki]@;����@=��ō@?�.�@@��lo��@B�e�|,@CH�d��@Dy�'��@E�e��J@F�Q��4@H9nti��@I��E���@J��t�e�@L9 h�O^@M��"hN@O��rd @P;�JY�@P�|9y�@Q�/��T�@Rw��v@S<&V�.@TU>cD=@Tϙ�:4�@U����^@VoA��`P@WC�o8�@X��|�@X�#�xu@Y�J����@Z�P�1�@@[�)����@\z�ه�@]c-"0�@^NF2r�*@_<���7@`C��n�@`��W�6@a
��Q�0@a�ޯ���@bW%y��@b����        ?�Kk�lG�?��fȘ�=?�A�J�?����a�|@�u�S�l@�Q~ ��@�����6@�MeC�@�&��]J@"�p�Q@%{�QE2@)10����@-$��o-@0����@2ܰ��@5+�@�t�@7��jH�4@:_vy@<��{x:8@?m�\n�g@A�y��@B�#zm�-@D����X@E�����@G.��u��@H��a��|@Jy�[�cA@L/'�z��@M����#"@O��A�Z�@P�_�Kn@Q�H��1:@R�fL��@S��j�]@T��h�@U�����@V�=
���@W�5��n@X��!��@Y�cT��2@Z�x|%�t@\	�յA�@]*Z58�d@^O�ox@_w�r�@`Rg��Z!@`��~��@a�Zk�l�@b!���@b�3�<Q�@c`���@d�r���@d���R��@eL�oI p@e���S�@f�N��@gI�h�m@g��#�(@h�ȼ���@iVi�IIm@j�ٙ^�@j��[�+,@kr}-��        ?����yw�?ȭe�Ml�?���^���?�Y���?��ܼ�L�?�����:?�au`^�n@+��@��Kn��@FذZ�)@�ݫ�@wb	@V����@����;@j�b[o{@!�洭"�@#��V��@%�y�!@'�>��d�@*�?�|@,P�%�>@.���IY-@0��x�ѫ@1�yiq��@3�N�-@4l9J���@5Ư�<~�@7)Q���t@8��n�3@:~k���@;��}i��@=���@>�| 6L@@i!�K@@�t+�Da@A���n@B}C�R�x@CS�<�`@D.�S�@Ewݏ�@E�@��*�@F�OY�X�@G���U��@H�S9�@I��;�}9@J�a>Ř�@Kt&3Hp*@Lj��(K@Md��c��@Nao�֣�@Oa����@P1�۝�q@P���5f]@Q8��ڑ�@Q�&r�b@RE
1�@R�J��x�@SV�0@S����)@Tn(��@T�����@U����d@V��ٰ�        ?�S�{�?�P�$��w?�3{� !�?�lv���?� �UJ��@�]Ovv�@���]z�@_P9�n�@�Y��@��$�@���T�o@ :�+�@"�!��@%�����0@(�_��V(@+�6B��@.؄~�0@10>C@2�����@4� 廬@6�T��\@8�3+x�Z@:�cɒE@<ǓxŖ�@>�s@4�-@@�۸��[@A��F��@B�&����@D'�+=�@Ee���e@F���u�@G��傍@IM�b�H'@J�d�G��@L.hV�o@Mu��_�@N�c�6�@P.˽�@P��,��$@Q��oa��@Ru.��u�@S=�n[��@T	D���@T��E�@U��k�(@V~7~m�Q@WU�Kۛ@X07Lx�@Y���d@Y��I�@Z�l��|�@[���z�@\�Bߞ�N@]�1q'�@^v��U�@_f����@`,�+9X�@`��
��@a#k����@a���ބR@b�q^�=@b���e��@cr��6�        ?�x�j�?��o�$?�� ��?��?gx�?�D�"��@ jj2lE�@�>����@;il@�#�~�@oUlq��@�����k@
ЉFr@!l~�*�@#��\g�@&�c�C^@)x�x�"@,m����@/�2�ޯ6@1^�p�m@3V)v��@4Ǌ�}�@6�)v^.3@8m��U�%@:WXU�
�@<ON����@>Ux#��@@4�M�#7@AE�(�H@B],�L�@C{Fp@D��+�ۭ@Eʪ���@@F���
o�@H2�U;/k@Ip<8/�@J�#S�@K� �]�@MJ��F^@N����g&@O�p���@P��r&�p@Q^�(,@R�����@R�d��Q@S�nF�|�@T@���9�@U ��y+@U��r��@V�p�eɮ@WK��t@XiZ�@X�g��!@Y���mւ@Z|An�a�@[N�dj@\"L�I�@\�G�[U@]Т=ŝB@^�l$|�@_���O@`3$pG�@`�v��@a�Wo�        ?�bXx�j�?�K�����?��2d?�?����Il@�P�<@
Z��uX�@�b=�=@��xTS�@(:<	��@!�M~5q@$d�0�,@'�d��@+�����<@/�S.���@1��	�!�@4䋊��@6^��Yq@8�Fv���@;9ڹ�@=���0@@7VH�
@A�&��! @B��F�% @DpOo ,@E�+a���@Gs�J��[@I`ة�@J�SI߫�@LA��X�@M��׵C@O�H��$@P��i|n�@Q�jNd�@R{��W�@Sg���S@TW����@UK��F�@VC����@W?t����@X?>Y�i@YB��`�@ZJ;��@[UVW�@\d�� @]v��V�z@^��2�L@_�
{��@`a���۟@`�����s@a����B�@b}Y$@b�ӎ�8@cC��r��@c�s�u�@dv���@e�4���@e���:J@fN�'���@f�p@g��h�:@h5@y�@h�c��Y]@i�H��        ?������g?�gt�f?ۮe|�kb?�Y"g�2?���и�O?�]�b��@ �=1s�@V��Ԉp@
u�:�.@���@Wc��@2��\��@�=��' @&�H@ q���H@"e�����@$n�d��@&�<�+�|@(�E-@]�@*�vJ @-R�t_Q1@/�qh�[�@1����6@2\�4�7@3����I@4���t@6X�C�P�@7���V��@9&x����@:�էՄ@<'>�g@=��)�I@?x��f@@P�sQ�~@A�j�"@A�_�3�`@B��{Y�@C���We]@D]p�x@E4����@F�?�d@F����s @G�Ǟ5�@H�Fú=T@I�J>���@J{���T@Ke��a�@LQ��6��@M@�%��@N1n�^�s@O$�d_'�@P����@P����"@Q���w�@Q�nz�@R^�-V8@R�Y0^*@SY���@S�]�ª�@Ta��@�@T�cK�-�@U`8�5@U�VO&~O        ?��"l�r?��*F�l?�٠�^d�?���S@?�����@J��9@�bQ�@�1�u�4@�x�@_�@���9u@����3@�����@"Z	�]S�@%��6�@'�پk�@*�j�/�@-��~��@0��H7q@2T�^QP�@4�n1@5�J�n�@7�85�u@9�n��J@;���'֛@=��BÞT@@zF���@A,��/w@BQ�P@C|����W@D�g@�j@E�5׵_@G,ib���@Hur����@IŗVab�@K���8@Lz�����@M���Tr�@OKh0���@P^�z)��@QEg���@Q�앗�@R�Ġ�^@ScÄc�2@T,�6<X#@T�|c@U�F����@V��7̝@Wo���@XGزE��@Y"�֛!Y@Z �q-6@Z�V� @[�&y1�.@\��|4��@]��$�$�@^���+L�@_o��&�@`0,�Zq�@`�$�_�}@a%ot�I�@a�
®�@b��^Z3@b�*� �|        ?���-/�?ї����t?�:�Rg ?��^�m��?�>Ă��s@��o@�R��@f-�;�@S�ML*@N���8@�����@Fo�Y �@"�O_=�@$���䂊@'�D~i�@*z�S��@-��l]�@0a��&�e@2g��#�@3���M�@5��f�@7x'���@9f6X��@;c�"�@=p�r���@?�se�w�@@�ǀ�2@A����@C�*�`�@DFF�?��@Ew˸ɬ1@F�+��f@G� m�@I4��`�~@J�y�A9@Kҿ�:@M+CS{�@N������@O�=��O@P�����S@Qd���/@R 3�@R�I\a�@S�5,Y�@Tb����@U)k;���@U����H@V����@W�8ErC�@X^�tg��@Y2rk�L�@Z�,��h@Z� ��E@[�ѭ���@\����@]|��b4j@^_� �@_E�3׍�@`�F�%�@`��=$@a���@az$��?C@a���LP        ?�=a��?ܰT�?�#�]�^b?��V)H�@�P8���@���fK�@a�Tqu@��j�)@G���~7@!���,@q@%b���@(� �I�2@,���PC@0C�@�@2_��X��@4��m�~r@6�$�Ri@9Az���@;��=�oZ@>G��F�@@t�i�\U@A�/�S@C54:i9@D��OUUF@F|����@G�7Y�k@I%���x@J��l��@LQ��h�@M��ē��@O����S@P��B�d@Q�ay&��@Rd�;��@SHk9}�@T/�3O�B@Uqks��@Vs*��@V����\�@W�P{�C�@X��a�[@Y�� $W�@Z�F�H�F@[�ު�x�@\�RG�@]���@^��f@_�4qo?@`��%��@a.��W�@a�仅�7@b"�Z���@b��M�T@c<��P@c�(����@d[���@d�a\�@e~D�WX
@f��OL�@f�.;��j@g;ۡ���@gҫ��@hj���+�        ?�1Ԓ��3?��A���?�6 _��?�8{#F�?��j�?���8C�@ |�ߙ��@��N��@
6���@�r�m��@�F �@�����@yb�v��@6���+@ g k[͋@"\�h��@$gT�Q8�@&��9�Dh@(��N/�H@*��;��@-N��]<	@/�����@1�Jw�z@2X�h�@3����a
@4�"S�G@6O�r��@7��?m<\@95�d@:��y��S@;��T&TW@=yۨ?w�@>���sT�@@B�J+=�@A
���V8@A�MȨ�S@B���y@Cs�e{�@DG�(�-�@Eʹ�c@E�fp���@Fӆ���@G�a8��%@H���H�F@Ix-�Ð@J^���t@KHC��c@L4%����@M"�H��=@NV4ʾ<@O���m@O�)�´z@Pz��.�@P�'�"�%@Quc��h�@Q���=��@Ru&�Q|Z@R��]�a�@Sy(?�j�@S����J�@T�@�YQ�@U˙��@U�P�5         ?���M9��?��P���m?��J�cg?����$�?�Q;�R@%FO�ۛ@�XSj@vL�J@]��p@Z���0(@�2RU�@W�*@=�@"(��'c�@$�=5Bß@'� ��K@*�c1<l}@-��?��@0j����9@2�K�@3։!��!@5���R�@7�ֈ��L@9t΋S<@;r�!��0@=���*0@?����k9@@���<��@B�.�@C&ǈ�@DQ5p�@E������@F��gLy�@G�� �Q�@I@2w��@J�����@K�`��t@M6A"���@N�^|�*�@O�XLٕ@P�	���@Qh��g�
@R#/����@R�`ج�@S�>O�h"@Tb��K�@U'���(@U�{ƞR�@V��ћ�I@W�F�l�@XU\�1@Y&��ɐf@Y��"�Z�@Z����@[��7h�5@\�{�,�6@]a��3Q'@^A ��Fi@_"�O�f�@`[�Ƨ@`veR��@`���)@a_���U@a���7y        ?��ȝms?Ѭ�\_�v?��3A�?���&�m?�a6��@@5���@�@t�:@��+UL@}�Q�B@�֞�U4@�C��u4@���+!x@"W�,<^@@%���@'�mh�@*�Q{>�@.K4|l@0�����@2^Nڧ/@4'�S�@6���C�@7�9�RH~@9��G�@;�D@��@>�#��@@ј 7@A=ؕ"JI@BczL��@C��wke@D��#�@F �#V3\@GCiڿܓ@H�"1aGA@Iݶ��:@K5\{@L�b�p;@M�|��!�@Ob`8��b@PiȻ��z@Q%{�a�#@Q�<�S~�@R�G��@Sj��9�@T2n�nv@T��2�%@U�rN��Y@V��~MQ�@Wm���O@XC� �R�@Y%6<@Y�d��L�@Z�O}@[��O��@\����@]~ü��@^g�`0�@_Q�5A
@`�'��(@`�����i@a�p���@a�c�w;@b�ޗ
@b��(ވ�        ?��+cs�?�w�c�$�?���Y�.?������r@u

S�@gĆ#�\@I��f�@t��wh@+�I��@!����I�@%�`#(V@(��X���@,y��?@0?gȤ�0@2[���dO@4�]�E,.@6�G��@9>��#@;�D�W��@>B��*)@@q��Z�1@A˄/�K�@C.̌���@D�&����@FNE$�@G�Z�@I"�3@J�=�l@L8_��7�@M�I��A@O{�	���@P�ks`@Qn���b@RL_"�Ɓ@S-���#@Tt�-D�@T�����@U�,�aW@V��D� @W���#$@X�8�*�@Y���cf�@Z��S�@[����@\�R�y@]�h��S9@^�O�MD�@_��c݈{@`h2A6H#@`￠Xr�@ax� 06@b��.|O@b�R�,:@c��(�@c�~&8A@d8Ou��@dȻ����@eZV��o@e���@f�bP��@g�`g:@g�8�%&@hC��j�